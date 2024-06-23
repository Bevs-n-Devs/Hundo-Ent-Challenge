import os
from flask import Flask, render_template, request
from flaskwebgui import FlaskUI
import ssl
ssl.create_default_context = ssl._create_unverified_context

app = Flask(__name__)

@app.route("/", methods=["GET", "POST"])
def home():
    if request.method == 'GET':
        return render_template("index.html")
    else:
        return 'message sent!'

if __name__ == "__main__":
    debug = False
    if debug:
        app.run(debug=True)
    else:
        FlaskUI(
            app=app,
            height=500,
            width=500,
            server="flask"
        ).run()