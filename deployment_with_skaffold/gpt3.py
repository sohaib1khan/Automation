import openai
from dotenv import load_dotenv
import os

load_dotenv()
OPENAI_API_KEY = os.getenv("_OPENAI_API_KEY")

# Again, you can use a default argument for the API key if you like
def call_gpt3(user_input, api_key=OPENAI_API_KEY):
    try:
        openai.api_key = api_key
        response = openai.Completion.create(
            engine="davinci",
            prompt=user_input,
            max_tokens=150
        )
        return f"GPT-3: {response.choices[0].text.strip()}"
    except Exception as e:
        print(f"Error: {e}")
        return "GPT-3 could not find an answer."
