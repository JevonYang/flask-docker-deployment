from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World! Here is Flask!</p>"

@app.route("/api")
def hello_api():
    return "<p>Hello, World! Here is API-path!</p>"

@app.route("/hello")
def hello():
    return "<p>Hello, World! Here is API-hello!</p>"

def main():
    app.run()

if __name__ == '__main__':
    main()
