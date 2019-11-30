# 1. SETUP
All required dependencies are included in requirements.txt
## Dependencies <br />
run following command to install requirements in root folder, all dependencies should be included in requirements.txt:
```shell
sudo pip install -r requirements.txt
```

If there is error saying package SIX cannot be uninstalled, use following command instead:
```shell
sudo pip install --ignore-installed six -r requirements.txt
```
Since I had problem with package six version, therefore I have included six-1.13.0 source code,  cd into this folder and run 
```shell
sudo python setup.py install
``` 
this command should install the newest version of six, then you can rerun command above, should install required dependencies correctly now.

## Some Error that worth noticing <br />
Strange things happened when I ran ./run.sh for the first time, I got bus error at the end of experimental time, with no extra log, after examing each file for almost an hour it turns out it was permission issue with matplotlib.pyplot in helper.py. So in order to fix this bus error I have to add sudo in front of each python command in ./run.sh, I'm not sure what the side effect will be(it might ask you to enter password maybe), therefore I think it's worth mentioning.