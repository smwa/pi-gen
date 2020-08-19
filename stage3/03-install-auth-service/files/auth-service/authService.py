from time import time
import json

from flask import Flask
from flask import request

ALLOW_TIME_IN_SECONDS = 60

app = Flask(__name__)

def loadAllowList():
    data = {}
    try:
        with open('/tmp/authServiceIps.json') as json_file:
            data = json.load(json_file)
    except Exception:
        print("File does not exist, continuing")
    return data

def saveAllowList(data):
    with open('/tmp/authServiceIps.json', 'w') as outfile:
        json.dump(data, outfile)

@app.route('/')
def check():
    allowList = loadAllowList()
    ip = request.headers.get("X-Forwarded-For", request.remote_addr)
    if ip not in allowList:
        return "", 403
    lastAccessed = allowList[ip]
    if lastAccessed > time() or lastAccessed < time() - ALLOW_TIME_IN_SECONDS:
        return "", 403
    return "", 401

@app.route('/allow/')
def allow():
    allowList = loadAllowList()
    allowList[request.headers.get("X-Forwarded-For", request.remote_addr)] = time()
    saveAllowList(allowList)
    return "", 200
