# -*- coding: utf-8 -*-
"""
Created on Mon Mar 11 12:20:56 2019

@author: jmonc
"""

from bs4 import BeautifulSoup
import requests
import json

uib_url="https://www.uib.eu/{}"

first_page = "https://www.uib.eu/research/groups/grups_area/"

req = requests.get(first_page)
if req.status_code == 200:
    document = BeautifulSoup(req.text, 'html.parser')
else:
        print("Error accesing page")
        

lista = document.find_all("div", attrs={"class":"uib_style_filaunica"})[0].find_all("option")
grupos = dict()
for i in lista:
    nombre = i.string
    grupo = i.attrs["value"]
    grupos[i.attrs["value"]] = {'id':grupo, 'nombre':nombre, 'url':first_page+"id_area="+i.attrs["value"]}
del grupos["-1"]

with open('result.json', 'w') as fp:
    json.dump(grupos, fp)

print(grupos)
