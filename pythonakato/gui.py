from flaskwebgui import FlaskUI
from main import app

FlaskUI(
    app=app,
    width=500,
    height=500,
    start_server="flask",
    close_server_on_exit=False
)