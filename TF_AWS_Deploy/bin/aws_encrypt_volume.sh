#!/bin/bash

# Set your instance ID and unencrypted volume ID here
INSTANCE_ID="i-123abc"
OLD_VOLUME_ID="vol-123abc"
AZ=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[0].Instances[0].Placement.AvailabilityZone' --output text)  # Automatically determine the AZ
DEVICE="/dev/xvda"  # Device name

# Stop the instance before detaching the root volume
aws ec2 stop-instances --instance-ids $INSTANCE_ID
aws ec2 wait instance-stopped --instance-ids $INSTANCE_ID

# Create a snapshot
SNAPSHOT_ID=$(aws ec2 create-snapshot \
    --volume-id $OLD_VOLUME_ID \
    --description "Snapshot for root volume encryption" \
    --query 'SnapshotId' \
    --output text)

# Wait for snapshot to complete
aws ec2 wait snapshot-completed --snapshot-ids $SNAPSHOT_ID

# Create an encrypted volume from the snapshot
NEW_VOLUME_ID=$(aws ec2 create-volume \
    --availability-zone $AZ \
    --snapshot-id $SNAPSHOT_ID \
    --encrypted \
    --query 'VolumeId' \
    --output text)

# Wait for the new volume to be available
aws ec2 wait volume-available --volume-ids $NEW_VOLUME_ID

# Detach the old volume
aws ec2 detach-volume --volume-id $OLD_VOLUME_ID
aws ec2 wait volume-available --volume-ids $OLD_VOLUME_ID

# Attach the new encrypted volume to the instance
aws ec2 attach-volume \
    --volume-id $NEW_VOLUME_ID \
    --instance-id $INSTANCE_ID \
    --device $DEVICE

# Restart the instance
aws ec2 start-instances --instance-ids $INSTANCE_ID

# Delete the snapshot
aws ec2 delete-snapshot --snapshot-id $SNAPSHOT_ID

