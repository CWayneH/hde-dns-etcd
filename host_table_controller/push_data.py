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
import random


app = Flask(__name__)

def rand_pick():
      host_table=pd.read_csv("../data engine/outcome.csv")
      host_table[['rbstatus']]=0
      dead_one=random.randint(0,host_table.shape[0]-1)
      for index, row in host_table.iterrows(): 
        #     print(row)
            if index==dead_one:
                  host_table.at[index, 'rbstatus'] = 1
                  print("drop index ",index, row )
      print(host_table)
      host_table.to_csv("../data engine/outcome.csv",index = False )

def push_data():
    host_table=pd.read_csv("../data engine/outcome.csv")
#     print(host_table.shape)
    host_dict={}
    for index, row in host_table.iterrows(): 
          if row['rbstatus']==0:
                host_dict[row['host']]=row['priIP']
    print(len(host_dict))
    response = requests.post('http://127.0.0.1:3001/test',data=host_dict,params=host_dict)
    print(response.text)
    return host_dict

if __name__ == "__main__":
       while True:
             time.sleep(5)
             rand_pick()
             k=push_data()
             print(k)