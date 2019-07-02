import os
import boto3
s3 = boto3.resource('s3')

def lambda_handler(event, context):
    user = event['detail']['requestParameters']['userName']
    createHomeDir(user)
    return 'Done'

def createHomeDir(user):
    print "Creating home dir in s3 for user " + user
    dirName = user + "/"
    s3.Bucket(os.environ['bucket_name']).put_object(Key=dirName, Body='', ServerSideEncryption='AES256')
