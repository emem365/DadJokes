# -*- coding: utf-8 -*-
import requests
from random import choice


def findByTopic(term):
    url="https://icanhazdadjoke.com/search"
    response=requests.get(
                        url,
                        headers={"Accept" : "application/json"},
                        params={"term" : term, "limit":30})
    data=response.json()
    if data['total_jokes']>1:
        random_joke=choice(data['results'])
        return random_joke['joke'].encode("ascii","ignore").decode("ascii")
    elif data['total_jokes']>1:
        return data['results'][0]['joke'].encode("ascii","ignore").decode("ascii")
    else:
        return f"Sorry! No jokes on \"{term}\""

def find():
    url="https://icanhazdadjoke.com/"
    response=requests.get(
                        url,
                        headers={"Accept" : "text/plain"},
                        )
    return response.text.encode("ascii","ignore").decode("ascii")
