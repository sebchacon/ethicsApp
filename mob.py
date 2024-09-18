
from openai import OpenAI
import os

client = OpenAI()
# messages = [ {"role": "system", "content": "You are an intelligent assistant"} ]

class mob:
    def query(message):
        completion = client.chat.completions.create(
            model="gpt-4o-mini",
            messages=[
                {"role": "system", "content": "You are a helpful assistant."},
                {
                    "role": "user",
                    "content": message
                }
            ]
        )
        return completion.choices[0].message
    
    if __name__ == "__main__":
        while True:
            q = input("What would you like to ask? If nothing enter nothing: ")
            if q:
                print(query(q))
            


