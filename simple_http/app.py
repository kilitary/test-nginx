from flask import Flask, request

app = Flask(__name__)

@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
def echo(path):
    # Return the X-Forwarded-For header value (if any) and all headers for debugging
    xff = request.headers.get('X-Forwarded-For', '(none)')
    headers = '\n'.join(f"{k}: {v}" for k, v in request.headers.items())
    return f"X-Forwarded-For: {xff}\n\nHeaders:\n{headers}\n"

if __name__ == '__main__':
    # Listen on all interfaces, port 8080
    app.run(host='0.0.0.0', port=8080)
