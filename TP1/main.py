from flask import Flask, jsonify
from pymongo import MongoClient

app = Flask(__name__)

client = MongoClient('mongodb://mongodb:27017/')
db = client['mydatabase']
collection = db['mycollection']

@app.route('/')
def home():
    try:
        collection.insert_one({'message': 'Hello, MongoDB!'})
        documents = list(collection.find({}, {'_id': 0}))
        return jsonify(documents)
    except Exception as e:
        return jsonify({'error': str(e)})

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)