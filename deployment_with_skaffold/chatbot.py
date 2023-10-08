# from bard import call_bard  # Uncomment these in your version
# from gpt3 import call_gpt3  # Uncomment these in your version
from flask import Flask, request, render_template, redirect, url_for, session
from dotenv import load_dotenv
import os

load_dotenv()
bard_api_key = os.getenv("_BARD_API_KEY")
openai_api_key = os.getenv("_OPENAI_API_KEY")

def save_chat(chat_history):
    with open('chat_history.txt', 'w') as f:
        for chat in chat_history:
            f.write(f"{chat['type']} ({chat['source']}): {chat['text']}\n")

app = Flask(__name__)
app.secret_key = 'supersecretkey'

@app.route('/')
def welcome():
    if 'username' not in session:
        return render_template('welcome.html')
    else:
        return redirect(url_for('index'))

@app.route('/chat', methods=['POST'])
def chat():
    session['username'] = request.form['username']
    session['chat_history'] = []
    return redirect(url_for('index'))

@app.route('/index')
def index():
    if 'username' in session:
        return render_template('index.html', username=session['username'], chat_history=session['chat_history'])
    else:
        return redirect(url_for('welcome'))

@app.route('/ask', methods=['POST'])
def ask():
    user_input = request.form['user_input']
    new_chat_history = session['chat_history'] + [{"type": "user", "text": user_input, "source": "User"}]
    bard_response = call_bard(user_input, bard_api_key)
    gpt3_response = call_gpt3(user_input, openai_api_key)
    new_chat_history += [{"type": "bot", "text": bard_response, "source": "Bard"}]
    new_chat_history += [{"type": "bot", "text": gpt3_response, "source": "GPT-3"}]
    session['chat_history'] = new_chat_history[-2:]
    save_chat(session['chat_history'])
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(host='0.0.0.0')
