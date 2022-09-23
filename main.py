from flask import Flask
import toplevelfunc
import time
import sys

app = Flask(__name__)
app.obj = None

@app.route("/")
def hello_world():
    return {'response':'running'}

@app.route('/init')
def initialize():
    st = time.time()
    app.obj=toplevelfunc.initialize()
    en = time.time()
    return {'response':'ok','initdurationsec': (str(en-st))}

@app.route('/call/<int:val>')
def callfunc(val):
    return {'answer':app.obj.toplevelfunc(float(val))}

@app.route('/end')
def endfunc():
    app.obj.terminate()
    # sys.exit(0)
    return {'response':'endfunc done'}