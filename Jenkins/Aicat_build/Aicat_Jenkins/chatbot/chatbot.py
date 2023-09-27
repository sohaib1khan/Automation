from bard import call_bard
from gpt3 import call_gpt3

chat_history = []

def save_chat():
    """
    Save the chat history to a local file.
    """
    with open('chat_history.txt', 'w') as file:
        for line in chat_history:
            file.write(line + '\n')

def main():
    banner = """
     |\      _,,,---,,_
ZZZzz /,`.-'`'    -.  ;-;;,_
     |,4-  ) )-,_. ,\ (  `'-'
    '---''(_/--'  `-'\_)  AICat

    """
    print(banner)

    print("Hello! I'm AiCat,  What is your name?")
    name = input("Username: ")
    chat_history.append(f"Username: {name}")
    
    print(f"\nAiCat: Hello {name}! Ask me anything.\n")

    try:
        while True:
            user_input = input(f"{name}: ")
            chat_history.append(f"{name}: {user_input}")
            
            if user_input.lower() in ['exit', 'quit', 'bye']:
                print(f"\nAiCat: Goodbye, {name}!\n")
                save_chat()  # Save chat when user exits
                break

            bard_response = call_bard(user_input)
            gpt3_response = call_gpt3(user_input).strip()

            responses = []
            if bard_response.strip():
                responses.append(("Bard", bard_response))

            if gpt3_response.strip():
                responses.append(("GPT-3", gpt3_response))

            for index, (source, response) in enumerate(responses, start=1):
                chat_line = f"[{index}] AiCat (from {source}): {response}"
                print(chat_line)
                chat_history.append(chat_line)

            try:
                selection = int(input("Select the response you like (e.g., 1, 2): "))
                if 1 <= selection <= len(responses):
                    selected_source, selected_response = responses[selection-1]
                    selected_line = f"You selected the response from {selected_source}: {selected_response}"
                    print(selected_line)
                    chat_history.append(selected_line)
                else:
                    print("Invalid selection. Please choose from the displayed numbers.")
            except ValueError:
                print("Please enter a valid number.")

    except KeyboardInterrupt:
        print(f"\nAiCat: Goodbye, {name}!")
        save_chat()  # Save chat on KeyboardInterrupt

if __name__ == '__main__':
    main()