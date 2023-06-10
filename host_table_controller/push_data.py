import json
import flask
from flask import jsonify,Flask,request
import requests
import etcd
from firebase import firebase
import firebase_admin
from firebase_admin import credentials
from firebase_admin import db,firestore
import os
import time
import pandas as pd 


# host_table=pd.read_csv("../data engine/outcome.csv")

app = Flask(__name__)

def push_data():
#     print(host_table)
    host_table=pd.read_csv("../data engine/outcome.csv")
    host_dict={}
    for index, row in host_table.iterrows():  
          host_dict[row['host']]=row['priIP']
    response = requests.post('http://127.0.0.1:3001/',data=host_dict)
    return host_dict

if __name__ == "__main__":
#        while True:
#              time.sleep(5)
        k=push_data()
        print(k)