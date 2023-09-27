# AICat


A versatile chatbot that seamlessly integrates the capabilities of Bard AI and OpenAI's GPT-3 to provide comprehensive and intelligent responses to user queries.

## Overview

AiCat is a chatbot designed to fetch answers from both Bard AI and OpenAI's GPT-3. It presents the responses from both sources, allowing users to have a richer interaction. The implementation ensures that if one of the platforms fails to provide a response, it gracefully informs the user.

## Features

- **Dual-Source Responses**: AiCat fetches answers from both Bard AI and OpenAI's GPT-3, ensuring a comprehensive response to user queries.
- **Interactive Command-Line Interface**: Engaging ASCII art and user-friendly prompts make interactions pleasant.
- **Error Handling**: If either platform (Bard AI or GPT-3) encounters an issue or fails to provide an answer, AiCat gracefully informs the user without crashing.

## Docker Environment Setup (Recommended Method)

AiCat comes with an easy-to-use Docker environment setup script named `aicat`. This script:

- Creates a `Dockerfile` and `docker-compose.yml` tailored to AiCat's requirements.
- Sets up a Python environment with all the necessary packages.
- Copies the main script and environment variables file into the Docker container.
- Launches a Python container and provides an interactive shell within the container.

``Ensure you have the necessary credentials for both Bard AI and OpenAI stored in a `.env` file.``

### Usage:

1.  Ensure you have Docker and Docker Compose installed on your system.
2.  Navigate to AiCat's main directory.
3.  Execute the `aicat` script: `./aicat`
4.  Follow the on-screen prompts.

## Structure

- `bard.py`: This script contains the functions necessary to interact with the Bard AI platform.
- `gpt3.py`: This script sets up and manages interactions with OpenAI's GPT-3.
- `chatbot.py`: The main script where the chatbot logic resides, integrating functions from `bard.py` and `gpt3.py` to provide the dual-source chatbot experience.

## Setup and Usage (without Docker)

1.  Ensure you have the necessary credentials for both Bard AI and OpenAI stored in a `.env` file.
2.  Run `chatbot.py` to initiate the chatbot.
3.  Interact with AiCat by providing your queries. To exit, type 'exit', 'quit', or 'bye'.

## Work In Progress

This project is actively being developed and improved. New features and refinements are on the horizon, so stay tuned for updates!
