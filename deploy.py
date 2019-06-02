import requests
from flask import Flask, render_template, url_for
app=Flask(__name__)

#main Func
def find():
    url="https://icanhazdadjoke.com/"
    response=requests.get(
                        url,
                        headers={"Accept" : "text/plain"},
                        )
    return response.text

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/joke')
def joke():
    str=find()
    return render_template('joke.jinja2', joke=str)
