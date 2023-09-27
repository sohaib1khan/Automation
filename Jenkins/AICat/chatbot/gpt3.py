import openai
from dotenv import load_dotenv
import os

load_dotenv()
OPENAI_API_KEY = os.getenv("_OPENAI_API_KEY")

openai.api_key = OPENAI_API_KEY

def call_gpt3(prompt):
    try:
        response = openai.Completion.create(
            engine="davinci",
            prompt=prompt,
            max_tokens=150
        )
        return f"GPT-3: {response.choices[0].text.strip()}"
    except Exception as e:
        print(f"Error: {e}")
        return "GPT-3 could not find an answer."
