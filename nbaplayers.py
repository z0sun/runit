import requests
import csv

# API endpoint and parameters
url = "https://free-nba.p.rapidapi.com/players"
querystring = {"page": "0", "per_page": "100"}  # Increased to 100, adjust as necessary

headers = {
    "X-RapidAPI-Key": "801e9e60f4msh682ed0d41bd0b58p1947aajsn5c2668a6a34b",
    "X-RapidAPI-Host": "free-nba.p.rapidapi.com"
}

# Fetch data from API
response = requests.get(url, headers=headers, params=querystring)
data = response.json()

# Extract the relevant data
players = data['data']

# Create the CSV file
with open('nba_players.csv', 'w', newline='') as csvfile:
    fieldnames = ['player_id', 'first_name', 'last_name', 'position', 'team_name']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    
    writer.writeheader()
    for player in players:
        writer.writerow({
            'player_id': player['id'],
            'first_name': player['first_name'],
            'last_name': player['last_name'],
            'position': player['position'],
            'team_name': player['team']['full_name']
        })

print("CSV file has been created successfully!")
