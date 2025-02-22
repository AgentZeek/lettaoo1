
from letta.server.rest_api.app import start_server

if __name__ == "__main__":
    start_server(host="0.0.0.0", port=8080, debug=True)
