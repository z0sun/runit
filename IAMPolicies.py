import boto3
import csv

def get_iam_policies_to_csv():
    # Initialize the IAM client
    iam_client = boto3.client('iam')

    # List all IAM policies
    paginator = iam_client.get_paginator('list_policies')
    policies = []
    for page in paginator.paginate():
        policies.extend(page['Policies'])

    # Create and open a CSV file for writing
    with open('iam_policies.csv', mode='w', newline='') as csv_file:
        fieldnames = ['Policy Name', 'PolicyId', 'Arn']
        writer = csv.DictWriter(csv_file, fieldnames=fieldnames)
        
        # Write the CSV header
        writer.writeheader()

        # Iterate through the policies and write each one to the CSV file
        for policy in policies:
            policy_name = policy['PolicyName']
            policy_id = policy['PolicyId']
            policy_arn = policy['Arn']

            # Write the policy details to the CSV file
            writer.writerow({'Policy Name': policy_name, 'PolicyId': policy_id, 'Arn': policy_arn})

    print("CSV file 'iam_policies.csv' created successfully.")

# Call the function to generate the CSV file
get_iam_policies_to_csv()
