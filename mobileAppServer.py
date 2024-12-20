import socket
import threading
import sqlite3
import json


def init_database():
    connection = sqlite3.connect('data.db')
    cursor = connection.cursor()

    cursor.execute('''
        CREATE TABLE IF NOT EXISTS data (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            key TEXT UNIQUE,
            value TEXT
        )
    ''')
    
    cursor.execute('''
        INSERT OR IGNORE INTO data (key, value) VALUES (?, ?)
    ''', ("TestUser", "TestPassword"))

    connection.commit()
    connection.close()

def handle_client(client_socket, address):
   def handle_client(client_socket, address):
    print(f"Connection from {address} has been established.")
    data = client_socket.recv(1024).decode('utf-8')

    if data:
        try:
            connection = sqlite3.connect('data.db')
            cursor = connection.cursor()
            cursor.execute('SELECT key, value FROM data WHERE key = ?', ("TestUser",))
            row = cursor.fetchone()
            connection.close()
                
            if row:
                response = {"status": "success", "data": {row[0]: row[1]}}
            else:
                response = {"status": "error", "message": "Data not found"}

            response_json = json.dumps(response)
            client_socket.send(response_json.encode('utf-8'))

        except json.JSONDecodeError:
            print("Error: Received data is not valid JSON.")

    client_socket.close()

def start_server():
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    server_socket.bind(('localhost', 12345))
    server_socket.listen(5)
    
    print("Server listening on port 12345...")
    
    while True:
        client_socket, address = server_socket.accept()
        client_thread = threading.Thread(
            target=handle_client,
            args=(client_socket, address)
        )
        client_thread.start()

if __name__ == '__main__':
    init_database()
    start_server()

