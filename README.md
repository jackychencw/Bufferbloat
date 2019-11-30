# 1. SETUP
All required dependencies are included in requirements.txt
## Dependencies <br />
run following command to install requirements in root folder, all dependencies should be included in requirements.txt:
```shell
sudo pip install -r requirements.txt
```
Or if not using requirement.txt, run:
```shell
sudo pip install termcolor matplotlib==1.5.3
```
If there is error saying package SIX cannot be uninstalled, use following command instead:
```shell
sudo pip install --ignore-installed six -r requirements.txt
```
Since I had problem with package six version, therefore I have included six-1.13.0 source code, cd into this folder and run 
```shell
sudo python setup.py install
``` 
this command should install the newest version of six, then you can rerun command above, should install required dependencies correctly now.

## Some Error that worth noticing <br />
Strange things happened when I ran ./run.sh for the first time, I got bus error at the end of experimental time, with no extra log, after examing each file for almost an hour it turns out it was issue with matplotlib.pyplot in helper.py, therefore I had to switch to use matplolib version 1.5.3.

# 2. OUTPUT
Average download time is 1.05291666667 <br />
Standard Deviation is 0.528771052904

