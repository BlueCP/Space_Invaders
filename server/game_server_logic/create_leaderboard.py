import boto3

### Run this script to set up the leaderboard.

def create_leaderboard():

    dynamodb = boto3.resource('dynamodb', region_name='us-east-1')

    table = dynamodb.create_table(
        TableName = 'Leaderboard',
        KeySchema = [
            {
                'AttributeName' : 'leaderboard',
                'KeyType' : 'HASH' # Partition key
            },
            {
                'AttributeName' : 'name',
                'KeyType' : 'RANGE' # Sort key
            }
        ],
        AttributeDefinitions = [
            {
                'AttributeName' : 'leaderboard',
                'AttributeType' : 'N'
            },
            {
                'AttributeName' : 'name',
                'AttributeType' : 'S'
            },
        ],
        ProvisionedThroughput={
            'ReadCapacityUnits': 10,
            'WriteCapacityUnits': 10
        }
    )

if __name__ == '__main__':
    create_leaderboard()