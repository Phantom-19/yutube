from pytube import YouTube
from pprint import pprint
yt = YouTube()
yt.url =raw_input("\x1b[1;97m Lien\x1b[1;91m : \x1b[1;95m ")
pprint(yt.videos)
#print yt.filename
yt.filename = raw_input("\x1b[1;97m le nom \x1b[1;91m : \x1b[1;95m ")#'Dancing Scene from Pulp Fiction'
pprint(yt.filter('flv'))
video = yt.get('mp4', '720p')
video.download()
video.download('/tmp/')
print("Mon seul véritable objectif pour cela est de ne jamais avoir besoin de dépendances tierces, de le garder simple et de le rendre fiable.")
