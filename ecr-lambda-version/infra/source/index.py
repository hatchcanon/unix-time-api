import json
import time

def lambda_handler(event, context):
    epoch_time = int(time.time())
    response_body = {
        "The current epoch time": epoch_time
    }

    return {
        'statusCode': 200,
        'body': json.dumps(response_body),
        'headers': {
            'Content-Type': 'application/json',
        }
    }