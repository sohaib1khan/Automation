from bardapi import Bard
from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()

# Extracting the Bard API key from the .env file
BARD_API_KEY = os.getenv("_BARD_API_KEY")

# Note: Since you're already loading the API key from the environment variable, you might not even need to pass it as an argument.
def call_bard(user_input, api_key=BARD_API_KEY):
    try:
        bard = Bard(token=api_key)
        answer = bard.get_answer(user_input)
        return answer['content']
    except Exception as e:
        print(f"Error: {e}")
        return "Sorry, I faced an error while processing your request. Please try again later."