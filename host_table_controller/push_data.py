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


host_table=pd.read_csv("outcome.csv")

app = Flask(__name__)

@app.route("/")
def push_data():
    
    return hosts
    
    
    

# name = "example.com"

# # # refresh the priority
# # #example:  new_dict ={"example":{"ip":192.1.1.1,"count": 10,"priority":1} }
# @app.route("/push_data/<name>")
# def push_data(name):
#        print(name)
#        with open("table.json") as f :
#               host_table=json.load(f)
#               print(host_table[name][0])
#               return  host_table[name]
       
# @app.route("/")
# def home():
#        print("sucessed")
#        return jsonify("x" )

# # input: {ip: ,count: ,priority: }
# @app.route("/update")
# def refresh():
#         response = requests.get('http://127.0.0.1:3001/hdSimu')
#         print(response.content)
# #      new_dict=response.json()
# #      with open("table.json") as f :
# #         host_table=json.load(f)
# #         for k in new_dict.keys():
# #                 host_table[k]=new_dict[k]
# #         host_table[k].sort(key=lambda x : x['priority'])      
# #         json.dump(host_table,f)

#         return "refresh sucessed"

# if __name__ == "__main__":
#         response = requests.get('http://127.0.0.1:3001/hdSimu/ini')
#         print(response.content)
#         app.run(port=8001,debug=True)