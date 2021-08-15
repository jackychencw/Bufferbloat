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

for q = 20 <br />

```
Average download time is 0.492766666667
Standard Deviation is 0.116256808642
```

For q = 100 <br />

```
Average download time is 1.05291666667
Standard Deviation is 0.528771052904
```

# 3. Q&A

### (1).Why do you see a difference in webpage fetch times with short and large router buffers?

Answer: When queue size is large TCP will continuelly double congestion window and keep sending more and more packets, since there will be a 4ms delay for each packet, the fetch time will be longer when queue size is large. And when queue size is small TCP has to half its congestion window every time limit is reached and thus webpage fetch request can be more quickly sent.

### (2).Bufferbloat can occur in other places such as your network interface card (NIC). Check the output of ifconfig eth0 on your VirtualBox VM. What is the (maximum) transmit queue length on the network interface reported by ifconfig? For this queue size, if you assume the queue drains at 100Mb/s, what is the maximum time a packet might wait in the queue before it leaves the NIC?

Answer: txqueuelen for my mininet is 1000, which means it allows 1000 packets to be buffered. Assume each packet is 1500 bytes, so in total we will have 1.5 \* 10^6 bytes, and 100mb/s is 1.25 \* 10^7 bytes/s, therefore it will take about 0.12s.

### (3).How does the RTT reported by ping vary with the queue size? Write a symbolic equation to describe the relation between the two (ignore computation overheads in ping that might affect the final result).

Answer: RTT gets larger when queue size is larger <br />
RTT = queue_size \* propogation_delay <br />
Therefore it's not hard to see since propogation delay is fixed, the larger the queue_size the long the RTT.

### (4).Identify and describe two ways to mitigate the bufferbloat problem.

Answer: The first way is to tune the max queue size, by limiting the buffer size under a limited bandwidth network could reduce the RTT. The second way is that we can use active queue management schemas such as RED to randomly drop packets in early stage with a probability parameter.
