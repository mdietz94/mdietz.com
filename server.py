import simplejson
from flask import Flask, render_template, request, jsonify, g, session

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html", message = "Hello world!")

if __name__ == "__main__":
    app.secret_key = '170286119d3aad478da621870eb81e75'
    app.debug = True
    app.run(host='0.0.0.0')
