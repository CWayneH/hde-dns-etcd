import json
import flask
from flask import jsonify,Flask,request
import requests
app = Flask(__name__)
name = "example.com"

# # refresh the priority
# #example:  new_dict ={"example":{"ip":192.1.1.1,"count": 10,"priority":1} }
@app.route("/push_data/<name>",methods=['GET'])
def push_data(name):
       print(name)
       with open("table.json") as f :
              host_table=json.load(f)
              print(host_table[name][0])
              return  host_table[name]
       
@app.route("/")
def home():
       print("sucessed")
       return jsonify("x" )


# input: {ip: ,count: ,priority: }
@app.route("/refresh")
def refresh():
     response = requests.get('http://127.0.0.1:5001/fake_client')
     new_dict=response.json()
     with open("table.json") as f :
        host_table=json.load(f)
        for k in new_dict.keys():
                for ip,new_ip in zip(host_table[k],new_dict[k]):
                        ip["count"]=new_ip["count"]
                        ip["priority"]=new_ip["priority"]
        host_table[k].sort(key=lambda x : x['priority'])      
        json.dump(host_table,f)

        return "refresh sucessed"

if __name__ == "__main__":
        response = requests.get('http://127.0.0.1:5001/fake_client')
        print(response)
        app.run(port=8001,debug=True)