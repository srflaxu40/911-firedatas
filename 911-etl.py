#!/usr/bin/env python

import json, sys, os
import boto3
import time

def main():

    client = boto3.client('kinesis')
    response = client.get_shard_iterator(
        StreamName=os.environ['TF_VAR_stream_name'],
        ShardId='0',
        ShardIteratorType='LATEST'
    )


    iterator = response['ShardIterator']
   
    record = client.get_records(ShardIterator=iterator,Limit=2)

    firehoseClient = boto3.client('firehose')

    while 'NextShardIterator' in record:
        record = client.get_records(ShardIterator=record['NextShardIterator'],
                                                  Limit=2)
        if len(record['Records']) > 0:
            jsonData = json.dumps(record['Records'][0]['Data'])
            rawData  = record['Records'][0]['Data']
            print rawData
            

            # now put record into delivery stream
            response = firehoseClient.put_record(
                DeliveryStreamName=os.environ['TF_VAR_firehose_name'],
                Record={
                    'Data': jsonData
                }
            )
            print "Record Inserted"
            print response
        # wait for 5 seconds
        time.sleep(3)

if __name__ == "__main__":
    main()

