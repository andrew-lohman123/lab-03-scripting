#!/usr/bin/env python3

import os
import json
import requests

GHUSER = os.getenv('GITHUB_USER')
url = f'https://api.github.com/users/{GHUSER}/events'

def retrieve_events(url):
    """Download recent GitHub events from url and return them as a list of dictionaries."""
    response_text = requests.get(url).text
    events = json.loads(response_text)
    return events

def print_events(events, n=5):
    """Print the type and repository name of the first n events."""
    for x in events[:n]:
        event = x['type'] + ' :: ' + x['repo']['name']
        print(event)

def main():
    """Print the GitHub user and URL, then retrieve and print recent events."""
    print(GHUSER)
    print(url)
    events = retrieve_events(url)
    print_events(events)


if __name__ == "__main__":
    main()