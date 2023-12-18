from flask import Flask, jsonify
import time

app = Flask(__name__)

@app.route('/prod/time', methods=['GET'])
def get_current_epoch_time():
    epoch_time = int(time.time())
    return jsonify({"The current epoch time": epoch_time})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)