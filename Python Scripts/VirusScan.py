import requests

#File containing Key for virustotal API
filename = 'apikey'

#To parse the file for key
def get_file_contents(filename):
    """ Given a filename,
        return the contents of that file
    """
    try:
        with open(filename, 'r') as f:
            # It's assumed our file contains a single line,
            # with our API key
            return f.read().strip()
    except FileNotFoundError:
        print("'%s' file not found" % filename)


#API set up
api_key = get_file_contents(filename)
url = "https://www.virustotal.com/api/v3/files"

# Input the file name for the suspicious file
files = {"file": ("bad2.pdf", open("bad2.pdf", "rb"), "application/pdf")}
headers = {
    "accept": "application/json",
    "x-apikey": 
}

response = requests.post(url, files=files, headers=headers)

#Call for analyzing the file
url = "https://www.virustotal.com/api/v3/analyses/"+ response.id
response = requests.get(url, headers=headers)

# Creating a file for the output
with open("apiResult.txt", "w") as external_file:
    add_text = response.text
    print(add_text, file=external_file)
    external_file.close()