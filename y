#!usr/bin/python2
# coding=utf-8 

import os, sys, time, datetime, random
from time import sleep

try:
    import mechanize
except ImportError:
    os.system("pip2 install mechanize")

try:
    import youtube_dl
except ImportError:
    os.system("pip2 install youtube_dl")

try:
    import requests
except ImportError:
    os.system("pip2 install requests")
from requests.exceptions import ConnectionError
from mechanize import Browser


def videos(url, itag=None, audio_only=False, output_path=None,
                           filename=None, filename_prefix=None,
                           proxies=None, progress_callback=None):
   Mael_faxel ={}  
  with youtube_dl.YoutubeDL(Mael_faxel) as ydl:
    if output_path:
        makedirs(output_path, exist_ok=True)
    if 'http' not in url:
        url = 'https://www.youtube.com/watch?v=%s' % url
    if proxies:
        video = ydl(url, proxies=proxies)
    else:
        video = ydl(url)
    if progress_callback:
        video.register_on_progress_callback(progress_callback)
    if itag:
        itag = int(itag)
        stream = video.streams.get_by_itag(itag)
    else:
        stream = video.streams.filter(only_audio=audio_only).first()
    print('Téléchargement commencé: %s' % video.title)
    if filename:
        filename = safe_filename(filename)
    stream.download(output_path=output_path, filename=filename)
    file_type = '.' + stream.mime_type.split('/')[1]
    filename = stream.default_filename if filename is None else filename + file_type
    print("Téléchargement commencé : %s" % filename)
    return filename
    
def interactive_mode():
    print(get_header())
    while True:
        dmd = input('Voulez vous télécharger une video: ')
        if dmd.lower() in ['oui', 'o']:
            url = input("Entrer l'url: ")
            formule = input("Voulez-vous télécharger la vidéo ou l'audio : ")
            if formule.lower() in ['video', 'v', 'V']:
                videos(url, output_path='videos/')
                
