###############################################################################
Everything Python

Confluence

###############################################################################

## Install and Configure

>> Install
https://www.digitalocean.com/community/tutorials/install-python-windows-10
https://docs.python.org/3/using/windows.html#configuring-python

>> Configure Virtual Environment
https://docs.python.org/3/library/venv.html
https://www.geeksforgeeks.org/creating-python-virtual-environment-windows-linux/
https://mothergeo-py.readthedocs.io/en/latest/development/how-to/venv-win.html

>> Using
Using Python in Windows >>>>  https://docs.python.org/3.12/using/windows.html
Documentation >>>>  https://docs.python.org/3.12/
Tutorial  >>>>  https://docs.python.org/3.12/tutorial/index.html

python --version
py --list
pip --version
pip3 --version
python -m pip --version
python -m pip install --upgrade pip

>> global
python -m pip install --user requests
python -m pip uninstall requests
pip install requests
python -m pip install requests
py -m pip install requests        // '-m" module to install
python -m pip install requests==<version>
python -m pip install -U requests
python -m pip uninstall requests

py -m pip list
py -m pip show requests
py -m pip freeze > requirements.txt

>> venv
.\.snakebyte\Scripts\Activate.ps1
pip list
py -m pip list
py -m pip install requests
py -m pip install python-dotenv

py -m pip show requests
py -m pip freeze > requirements.txt

#API_KEY=ATATT3xFfGF0CS_SmXMC8JXP-wejFIE6cvNDQmSd3Dae_f4pMBFR_F1yPB0aIlMAkQ0TX6k3f-tRwdXrI4n-GtfsEaHqEooHFtxj4hZN_bVRYjxx_RQ8uWlzz4i99PfY1vuFu0zk2HEYg2Ows5jWI9pAOcPzpc2rV2lYVViSSZXl7gdTEHN3v7g=A52817D9
# USERNAME=GO-SVCOneplatform@kpmg.com

# API_KEY = os.getenv("API_KEY")
API_KEY = "ATATT3xFfGF0CS_SmXMC8JXP-wejFIE6cvNDQmSd3Dae_f4pMBFR_F1yPB0aIlMAkQ0TX6k3f-tRwdXrI4n-GtfsEaHqEooHFtxj4hZN_bVRYjxx_RQ8uWlzz4i99PfY1vuFu0zk2HEYg2Ows5jWI9pAOcPzpc2rV2lYVViSSZXl7gdTEHN3v7g=A52817D9c"
#USERNAME = os.getenv("USERNAME")
USERNAME = "GO-SVCOneplatform@kpmg.com"

echo %PATH%
C:\Program Files\Python312\Scripts\;C:\Program Files\Python312\;C:\Program Files (x86)\RSA SecurID Token Common;C:\Program Files\RSA SecurID Token Common;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\WINDOWS\System32\OpenSSH\;C:\Program Files\dotnet\;C:\Program Files\PuTTY\;C:\Program Files\RSA SecurID Token Common\;C:\Users\hsidhu2\AppData\Local\Programs\Microsoft VS Code\bin;C:\Users\hsidhu2\AppData\Local\Programs\Git\cmd;C:\Users\hsidhu2\AppData\Local\GitHubDesktop\bin
'C:\Users\hsidhu2\AppData\Roaming\Python\Python312\Scripts'

echo %PATHEXT%
.COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW

pip install virtualenv
python -m venv c:\Slytherin\snakebyte

c:\Slytherin\snakebyte>.\Scripts\activate.bat
c:\Slytherin\snakebyte>.\Scripts\Activate.ps1
deactivate

///////////////////////////////////////////////////////////////////////////////////////////////////

https://developer.atlassian.com/cloud/confluence/rest/v1/intro/#using
https://developer.atlassian.com/server/confluence/advanced-searching-using-cql/
https://atlassian-python-api.readthedocs.io/confluence.html
https://github.com/danswer-ai/danswer/blob/main/backend/danswer/connectors/confluence/connector.py


ADO DevOps
https://github.com/microsoft/azure-devops-python-api

confluence = Confluence(
    confluence_url="BASE_URL"
		API_KEY = os.getenv("API_KEY")
		USERNAME = os.getenv("USERNAME")
    
		print(f"connected to confluense page... ")

///////////////////////////////////////////////////////////

get_confluence.py
---
# Importing Libraries
from atlassian import Confluence  # type:ignore
from requests import HTTPError

from datetime import datetime
from datetime import timezone
import os
import requests
from dotenv import load_dotenv
from pprint import pprint
import json
import logging
# import traceback

# Load environment variables
load_dotenv()

# Define Constants
base_url = "https://go-oneplatform.atlassian.net/wiki/rest/api"
api_key = os.getenv("api_key")
username = os.getenv("username")
output_dir = "./oneplatform_pages_v1"

# Ensure output directory exists
# if not os.path.exists(output_dir):
#     os.makedirs(output_dir)
#     print(f"Output directory created... {output_dir}")
# else:
#     print(f"Output directory already exists.. ")

os.makedirs(output_dir, exist_ok=True)
print(f"Output directory checked/created at: {output_dir}")
    
# get_auth_headers()
# This function generates the headers required for making authenticated API requests. 
# The Authorization key uses the API token for basic authentication. 
# The Accept key tells the server that the client expects JSON responses.
def get_auth_headers():
    """Generate authentication headers."""
    print("Getting auth headers... ")
    headers = {
        "Authorization": f"Basic {username}:{api_key}",
        "Accept": "application/json"
    }
    print(f"Auth headers using... {username}")
    print(f"Auth headers using... {api_key}")
    return headers

# fetch_pages()
# Fetches the pages from Confluence. It makes a GET request to the /content endpoint of the API, 
# uses headers from get_auth_headers(), and checks for errors with response.raise_for_status(). 
# If the response is successful, it parses and returns the JSON data.
def fetch_pages():
    """Fetch list of page IDs and titles from Confluence."""
    print(f"Fetching Pages... ")
    response = requests.get(f"{base_url}/content",auth=auth)
    response.raise_for_status()
    return response.json()["results"]

auth = (username, api_key)

# download_page()
# Downloads the content of a specific page by its ID. 
# It fetches the page content in HTML stored format (body.storage). 
# Errors are checked, and the content is written to an HTML file named after the page title in the specified output directory.
def download_page(page_id, title):
    """Download the content of a page given its ID and save it locally."""
    print(f"Downloading Pages... ")
    response = requests.get(f"{base_url}/content/{page_id}?expand=body.storage",auth=auth)
    response.raise_for_status()
    content = response.json()["body"]["storage"]["value"]
    with open(f"{output_dir}/{title}.html", "w", encoding="utf-8") as file:
        file.write(content)
        
auth = (username, api_key)

# Main Execution Function
# The main function that orchestrates the script. 
# It fetches all pages and then iterates over each page, downloading it using download_page().
def main():
    """Main function to enumerate and download Confluence pages."""
    pages = fetch_pages()
    for page in pages:
        print(f"Downloading {page["title"]}...")
        download_page(page["id"], page["title"])

# Entry Point
# This is the entry point of the Python script. 
# If the script is run as the main program (not imported as a module), it will call the main() function.
if __name__ == "__main__":
    main()

---


######################################################################################################################


Pythonic
Snakebyte
Slither
Coiled
Pythagoras
Serpentine
Py-high
Viper
Scaled
Pythonesque

Pythonic
Coiled
Slytherin
Anaconda
Guido (after Guido van Rossum, the creator of Python)
Monty (a reference to Monty Python)
Py-High
Pythagoras
Py-Curious
Py-Licious











