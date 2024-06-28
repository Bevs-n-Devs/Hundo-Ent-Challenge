import os
from flask import Flask, render_template, request, jsonify
from flaskwebgui import FlaskUI
import ssl
ssl.create_default_context = ssl._create_unverified_context

app = Flask(__name__)

@app.route("/", methods=["GET", "POST"])
def home():
    if request.method == 'GET':
        return render_template("index.html")
    else:
        track_name = request.form.get('track_name')
        album_name = request.form.get('album_name')
        artist_name = request.form.get('artist_name')
        audio_year = request.form.get('audio_year')
        audio_genre = request.form.get('audio_genre')
        album_type = request.form.get('album_type')
        release_type = request.form.get('release_type')
        audio_frame_rate = request.form.get('audio_frame_rate')
        audio_notes = request.form.get('audio_notes')

        data = {'File Name': 
            {
                'Track Name': track_name,
                'Artist': artist_name,
                'Album Name': album_name,
                'Genre': audio_genre,
                'Year': audio_year,
                'Frame Rate': audio_frame_rate,
                'Album Type': album_type,
                'Release Type': release_type,
                'Audio Notes': audio_notes,
            }
        }
        return jsonify(data)

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