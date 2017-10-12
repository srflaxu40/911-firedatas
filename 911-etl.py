
import json, sys, os
import boto3

def main():

    client = boto3.client('kinesis')
    response = client.get_shard_iterator(
        StreamName=os.environ['TF_VAR_stream_name'],
        ShardId='1',
        ShardIteratorType='LATEST'
    )
    
    print response

if __name__ == "__main__":
    main()

