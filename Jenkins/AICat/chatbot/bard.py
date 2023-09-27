from bardapi import Bard
from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()

# Extracting the Bard API key from the .env file
BARD_API_KEY = os.getenv("_BARD_API_KEY")

def call_bard(query):
    try:
        bard = Bard(token=BARD_API_KEY)
        answer = bard.get_answer(query)
        return answer['content']
    except Exception as e:
        # Log the actual exception for debugging purposes
        print(f"Error: {e}")
        return "Sorry, I faced an error while processing your request. Please try again later."

