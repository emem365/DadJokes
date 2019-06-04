import requests
from flask import Flask, render_template, url_for, request
import dadjokes
app=Flask(__name__)


@app.route('/')
def home():
    return render_template('index.html')

@app.route('/choose')
def choose():
    return render_template('choose.html')

@app.route('/randomJoke')
def randomJoke():
    str=dadjokes.find()
    return render_template('joke.jinja2', response=str)

@app.route('/search', methods=['GET', 'POST'])
def search():
    if request.method=='POST':
        term=request.form.get('topic')
        str=dadjokes.findByTopic(term)
        return render_template('search.jinja2', response=str)
    return render_template('joke.jinja2', response=str)
