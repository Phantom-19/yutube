#!usr/bin/python2
# coding=utf-8 

import os,sys,time,datetime,random,hashlib,re,threading,json,requests
from datetime import datetime
from tqdm import tqdm
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

# -Parametre-#########
reload(sys)
sys.setdefaultencoding('utf8')
br = mechanize.Browser()
br.set_handle_robots(False)
br.set_handle_refresh(mechanize._http.HTTPRefreshProcessor(), max_time=1)
br.addheaders = [('User-Agent', 'Opera/9.80 (Android; Opera Mini/36.2.2254/119.132; U; id) Presto/2.12.423 Version/12.16')]

def McTony():
    mr = [  '*Faxel*', '      ', '*McTony*', '      ', '*Faxel*', '      ', '*McTony*', '      ', '*Faxel*', '      ', '*Faxel*', '      ', '*McTony*', '      ', '*Faxel*', '      ', '*Faxel*', '      ', '*McTony*', '      ', '*Faxel*', '      ', '*Faxel*', '      ', '*McTony*', '      ', '*Faxel*', '      ', '*Faxel*', '      ', '*Faxel*', '      ', '*McTony*', '      ', '*Faxel*', '      ', '*Faxel*', '      ', '*McTony*\n']
    for o in mr:
        print '\r\x1b[1;97m[\x1b[1;32m●●\x1b[1;97m]   [38;5;221m ' + o,
        sys.stdout.flush()
        time.sleep(0.15)

logo =("""\033[38;5;214m●▬▬▬▬▬▬▬▬๑\033[1;97m●▬▬▬▬▬▬๑۩۩๑▬▬▬▬▬▬●●▬▬▬▬▬\033[1;32m▬▬▬▬๑۩۩๑▬▬▬▬▬▬●     \n\033[38;5;214m•_  _ ____ \033[1;97m _  _ ____ ____ _  _\033[1;32m ____ ____   _  _• \n\033[38;5;214m•|\/| |__/ \033[1;97m |__| |__| |    |_/ \033[1;32m |___ |__/   |_/ • \n\033[38;5;214m•|  | |  \ \033[1;97m |  | |  | |___ | \_\033[1;32m |___ |  \ __| \_• \n\033[38;5;214m●▬▬▬▬▬▬▬▬๑\033[1;97m●▬▬▬▬▬▬๑۩۩๑▬▬▬▬▬▬●●▬▬▬▬▬\033[1;32m▬▬▬▬๑۩۩๑▬▬▬▬▬▬●\n\033[1;97m╔═════════════════════════════════════════════╗\n\033[1;97m║\033[1;91m[\033[1;93m**\033[1;91m]\033[38;5;95m      Developpeur \033[1;97m:\033[38;5;214m  Faxel           \033[1;91m[\033[1;93m**\033[1;91m]\033[1;97m║\n\033[1;97m╚═════════════════════════════════════════════╝""")	

# -Automatisation-#

def Street(z):
    for e in z + '\n':
        sys.stdout.write(e)
        sys.stdout.flush()
        time.sleep(0.009)

#-Effacer l\'environnemeent et place au chargement
os.system("clear")
#-Animation
McTony()
#--Menu 
def menu():
  
  os.system('clear')
  print(logo)
  print("\033[1;97m╔════════════════════════════╗     ")
  Street("\033[1;97m║\033[1;96m        YOUTUBE VIDEO       \033[1;97m║")
  print("\033[1;97m║\033[1;96m                           \033[1;97m ║")
  print("\033[1;97m║\033[1;93m1.\033[1;95m Information sur une video\033[1;97m║")
  print("\033[1;97m║\033[1;93m2.\033[1;92m Telecharger une Video    \033[1;97m║")
  print("\033[1;97m║\033[1;93m3.\033[1;94m Telecharger une musique  \033[1;97m║")
  print("\033[1;97m║\033[1;93mQ.\033[1;91m Quitter                  \033[1;97m║")
  print("\033[1;97m╚════════════════════════════╝     ")
  print("\033[1;97m║")
  choisir()

# -Place au choix
def choisir():    
  Choix = raw_input("\033[1;97m╚═\033[1;31m▶[38;5;245m Mr [38;5;221mFaxel \033[1;31m▶▶▶ \033[1;33m")
  if Choix == "1" or Choix == "01":
    os.system("clear")
    McTony()
    os.system("clear")
    informations()    
    menu()
  elif Choix == "2" or Choix == "02":
    os.system("clear")
    McTony()
    os.system("clear")
    videos()   
    raw_input("\n\033[1;91m[\033[38;5;245m Retour\033[1;91m]")
    menu()
  elif Choix == "3" or Choix == "03":
    os.system("clear")
    McTony()
    os.system("clear")    
    audios()    
    raw_input("\n\033[1;91m[\033[38;5;245m Retour\033[1;91m]")
    menu()  
  elif Choix == "q" or Choix == "Q":
    exit()
  else:
    print("\n\033[1;91mRemplissez correctement")
    menu()  
    
#def videos():
#  print(logo)
#  lien = raw_input("\x1b[1;97m Lien\x1b[1;91m : \x1b[1;95m ")
#  nom_fichier = raw_input("\n\033[1;97m Enregistrer sous le nom de \033[1;91m(\033[1;97mex\033[1;91m :\033[1;96m faxel\033[1;91m) : \033[1;93m ")
#  print("\n\033[1;95m Patientez")
#  Mael_faxel = {}
#  #with open(nom_fichier + '.mp4', 'wb') as f:
#  with youtube_dl.YoutubeDL(Mael_faxel) as ydl:
#   ydl.download([lien])
#  os.system('mv '+nom_fichier+' /sdcard/')
#  print("\n\033[1;92mTerminer")
#  Street ("\n\033[1;91m[\033[1;93m**\033[1;91m] \033[38;5;214mFaxel\033[1;97m un jour, \033[38;5;214mFaxel \033[1;97mtoujours    \033[1;91m[\033[1;93m**\033[1;91m]")
#  raw_input("\n\033[1;91m[\033[38;5;245m Retour\033[1;91m]")
def videos():
    url = raw_input("\n\033[1;91m[\033[1;36m▶\033[1;91m]\033[1;97m Veuillez saisir l'URL la video\033[1;91m : \033[1;93m")
    nom_fichier = raw_input("\n\033[1;91m[\033[1;36m▶\033[1;91m] \033[1;97mEnregistrer sous le nom de\033[1;91m : \033[1;95m")
    x = re.match(r'^(https:)[/][/]www.([^/]+[.])*youtube.com', url)
    try:
        if x:
            demande_image = requests.get(url)
            src = demande_image.content.decode('utf-8')
            verifier_type = re.search(r'<meta name="medium" content=[\'"]?([^\'" >]+)', src)
            verifier_type_fichier = verifier_type.group()
            final = re.sub('<meta name="medium" content="', '', verifier_type_fichier)
            if final == "video":
                  Street("\n\033[1;96mTéléchargement de la vidéo en qualité HD en cours...\033[1;97m\n")
                  extrait_lien_video = re.search(r'meta property="og:video" content=[\'"]?([^\'" >]+)', src)
                  video_lien = extrait_lien_video.group()
                  final = re.sub('meta property="og:video" content="', '', video_lien)
                  _response = requests.get(final).content
                  taille_fichier_demander = requests.get(final, stream=True)
                  taille_fichier = int(taille_fichier_demander.headers['Content-Length'])
                  taille_qualite = 1024 
                  t=tqdm(total=taille_fichier, unit='B', unit_scale=True, desc=nom_fichier, ascii=True)
                  with open(nom_fichier + '.mp4', 'wb') as f:
                      for data in taille_fichier_demander.iter_content(taille_qualite):
                          t.update(len(data))
                          f.write(data)
                  t.close()
                  print("\033[1;92mVidéo téléchargée avec succès")
		  raw_input("\t\033[1;91m[[38;5;24mRetour\033[1;91m]")
                  menu()
	    else:
                 print("\033[1;91mL'URL saisie n'est pas une URL d'instagram")
		 raw_input("\t\033[1;91m[[38;5;24mRetour\033[1;91m]")
		 menu()
    except AttributeError:
          print("\n\033[1;91mURL Inconnue")
	  menu()
def audios():
  print(logo)
  audio = raw_input("\033[1;97m╚═\033[1;31m▶[38;5;245m Mr [38;5;221mFaxel \033[1;31m▶▶▶ \033[1;33m")
  faxel = raw_input("\n\033[1;97m Enrgistrer sous le nom de \033[1;91m(\033[1;97mex\033[1;91m :\033[1;96m faxel\033[1;91m) : \033[1;93m")
  Mael_faxel = {
    'format': 'bestaudio/best',
    'postprocessors': [{
        'key': 'FFmpegExtractAudio',
        'preferredcodec': 'mp3',
        'preferredquality': '192',
    }],
    }
  with youtube_dl.YoutubeDL(Mael_faxel) as ydl:
   ydl.download([audio])
  os.system('ls')
  print("\n\033[1;95m Patientez")
  Street("\n\033[1;93m Titre est celui que procure YouTube.\nSuivre ce modele pour deplacer votre video telecharger.\n\033[1;96m mv titredelavideo /sdcard \n")
  titre = raw_input("\x1b[1;97m Titre \x1b[1;91m : \x1b[1;93m ")
  print("\n\033[1;97m")
  os.system('mv '+titre+' /sdcard/')
  print("\n\033[1;92mTerminer")
  Street ("\n\033[1;91m[\033[1;93m**\033[1;91m] \033[38;5;214mFaxel\033[1;97m un jour, \033[38;5;214mFaxel \033[1;97mtoujours    \033[1;91m[\033[1;93m**\033[1;91m]")
  raw_input("\n\033[1;91m[\033[38;5;245m Retour\033[1;91m]")

def informations():

  print(logo)
  Street("\033[1;93m Lien de la chaine pour obtenir les informations.\n")
  url = raw_input("\033[1;97m╚═\033[1;31m▶[38;5;245m Mr [38;5;221mFaxel \033[1;31m▶▶▶ \033[1;33m")
  print("\033[1;97m")
  Mael_faxel = {}
  with youtube_dl.YoutubeDL(Mael_faxel) as ydl:
    meta = ydl.extract_info(url, download=False) 
  print ('\033[38;5;245mDate Mise a jour  \033[1;91m:\033[1;97m %s' %(meta['upload_date']))
  print ('\033[38;5;245mTelechargement    \033[1;91m:\033[1;92m %s' %(meta['uploader']))
  print ('\033[38;5;245mVues              \033[1;91m:\033[1;95m %d' %(meta['view_count']))
  print ('\033[38;5;245mJ\'aime            \033[1;91m:\033[1;96m %d' %(meta['like_count']))
  print ('\033[38;5;245mJ\'aime Pas        \033[1;91m:\033[1;93m %d' %(meta['dislike_count']))
  print ('\033[38;5;245mId                \033[1;91m:\033[38;5;223m %s' %(meta['id']))
  print ('\033[38;5;245mFormat            \033[1;91m:\033[38;5;210m %s' %(meta['format']))
  print ('\033[38;5;245mDuree             \033[1;91m:\033[38;5;217m %s' %(meta['duration']))
  print ('\033[38;5;245mTitre             \033[1;91m:\033[38;5;227m %s' %(meta['title']))
  print ('\033[38;5;245mDescription       \033[1;91m:\033[38;5;215m %s' %(meta['description']))
  Street ("\n\033[1;91m[\033[1;93m**\033[1;91m] \033[38;5;214mFaxel\033[1;97m un jour, \033[38;5;214mFaxel \033[1;97mtoujours    \033[1;91m[\033[1;93m**\033[1;91m]")
  raw_input("\n\033[1;91m[\033[38;5;245m Retour\033[1;91m]")
    
menu()

          
