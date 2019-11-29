All required dependencies are included in requirements.txt
run following command to install them:
sudo pip install -r requirements.txt

If there is error saying package SIX cannot be uninstalled, use following command instead:
sudo pip install --ignore-installed six -r requirements.txt

Since I had problem with package six version, therefore I have included six-1.13.0. cd into this folder and run sudo python setup.py install should install the newest version of six, then you can rerun command above, should work.


