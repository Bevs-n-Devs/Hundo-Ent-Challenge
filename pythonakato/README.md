# Installation Guide

## Vitual Environment 
You will need to create a virtual environment to install and run your packages to create your desktop app.

```
python -m venv venv
```

Now you can install your packages using the `requirements.txt` file.
```
pip install -r requirements.txt
```

## Adjusting The Size
You can change the size of the desktop app in the `gui.py` file. You can change the height and width of the app:
```
FlaskUI(
    app=app,
    width=500,
    height=500,
    start_server="flask",
    close_server_on_exit=False
)
```

## Runing The Application
To start the application you enter the following in the terminal:
```
python main.py
```