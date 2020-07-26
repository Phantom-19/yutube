#!/bin/bash
clear
echo "
██████╗░███████╗░██████╗░██╗░░░██╗██╗░██████╗
██╔══██╗██╔════╝██╔═══██╗██║░░░██║██║██╔════╝
██████╔╝█████╗░░██║██╗██║██║░░░██║██║╚█████╗░
██╔══██╗██╔══╝░░╚██████╔╝██║░░░██║██║░╚═══██╗
██║░░██║███████╗░╚═██╔═╝░╚██████╔╝██║██████╔╝
╚═╝░░╚═╝╚══════╝░░░╚═╝░░░░╚═════╝░╚═╝╚═════╝░ ~ Outils developper par 🄵🄰🅇🄴🄻 ☪ ~
";

 Installation_du_dossier ="/usr/share/doc/Phantom20"

echo "[✔] Vérification des répertoires...";
if [ -d "$Installation_du_dossier" ];
then
    echo "[◉] Un répertoire Phantom20 a été trouvé! Voulez-vous le remplacer? [O/n]:" ;
    read faxel
    if [ $faxel == "o" ] ;
    then
      sudo rm -R "$Installation_du_dossier"
    else
        exit
    fi
fi

echo "[✔] Installation en cours, veuillez patientez...";
echo "";
sudo apt-get install -y python-pip
sudo apt-get install -y python2-pip
sudo pip install --upgrade youtube_dl
sudo apt-get install -y libav-tools
git clone https://github.com/Phantom-19/yutube.git $Installation_du_dossier;
echo "#!/bin/bash
python2 $Installation_du_dossier/you" '${1+"$@"}' > you;
chmod +x you;
sudo cp y /usr/bin/;


if [ -d "$Installation_du_dossier/you" ];
then
    echo "";
    echo "[✔] Outil installé avec succès ![✔]";
    echo "";
    echo "[✔]====================================================================[✔]";
    echo "[✔] ✔✔✔  Tout est fait!! Vous pouvez exécuter l'outil en tapant you  !  ✔✔✔ [✔]";
    echo "[✔]====================================================================[✔]";
    echo "";
else
    echo "[✘] L'installation a échouer ![✘] ";
    exit
fi
