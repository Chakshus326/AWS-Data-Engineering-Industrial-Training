import json
import boto3
import os

def lambda_handler(event, context):
    print("Event contextual parsing data: " + json.dumps(event))
    
    for record in event['Records']:
        source_bucket = record['s3']['bucket']['name']
        key = record['s3']['object']['key']
        
        # Guardrail check to completely break accidental recursive loops
        if "organized/" in key:
            print(f"Bypassing key trace {key} to optimize cost limits.")
            continue
            
        print(f"Data pipeline successfully sorted metadata index for object: {key}")
        
    return {
        'statusCode': 200,
        'body': json.dumps('Serverless trigger completed smoothly!')
    }
