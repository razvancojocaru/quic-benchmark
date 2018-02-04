
h1 export PATH=$PATH:/usr/local/go/bin
h2 export PATH=$PATH:/usr/local/go/bin

# Set 100Mbps with 100ms RTT 0 loss
s1 ./qdisc.sh s1-eth1 100Mbit 50ms 0
s1 ./qdisc.sh s1-eth2 100Mbit 50ms 0

h2 nohup go run ~/go/src/github.com/lucas-clemente/quic-go/example/main.go -bind 10.0.0.2:4443 -www /var/www/html/ &
h1 echo "-----Measurement 1-----" > quic_loss
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_loss
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_loss
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_loss
h2 pkill main

h2 nohup iperf -s &
h1 echo "-----Measurement 1-----" > iperf_loss
h1 iperf -c 10.0.0.2 &>> iperf_loss
h1 iperf -c 10.0.0.2 &>> iperf_loss
h1 iperf -c 10.0.0.2 &>> iperf_loss
h2 pkill iperf


# Set 100Mbps with 100ms RTT 0.5 loss
s1 ./qdisc.sh s1-eth1 100Mbit 100ms 0.25
s1 ./qdisc.sh s1-eth2 100Mbit 100ms 0.25

h2 nohup go run ~/go/src/github.com/lucas-clemente/quic-go/example/main.go -bind 10.0.0.2:4443 -www /var/www/html/ &
h1 echo "-----Measurement 2-----" >> quic_loss
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_loss
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_loss
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_loss
h2 pkill main

h2 nohup iperf -s &
h1 echo "-----Measurement 2-----" >> iperf_loss
h1 iperf -c 10.0.0.2 &>> iperf_loss
h1 iperf -c 10.0.0.2 &>> iperf_loss
h1 iperf -c 10.0.0.2 &>> iperf_loss
h2 pkill iperf


# Set 100Mbps with 100ms RTT 1 loss
s1 ./qdisc.sh s1-eth1 100Mbit 100ms 0.5
s1 ./qdisc.sh s1-eth2 100Mbit 100ms 0.5

h2 nohup go run ~/go/src/github.com/lucas-clemente/quic-go/example/main.go -bind 10.0.0.2:4443 -www /var/www/html/ &
h1 echo "-----Measurement 3-----" >> quic_loss
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_loss
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_loss
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_loss
h2 pkill main

h2 nohup iperf -s &
h1 echo "-----Measurement 3-----" >> iperf_loss
h1 iperf -c 10.0.0.2 &>> iperf_loss
h1 iperf -c 10.0.0.2 &>> iperf_loss
h1 iperf -c 10.0.0.2 &>> iperf_loss
h2 pkill iperf


# Set 100Mbps with 100ms RTT 2 loss
s1 ./qdisc.sh s1-eth1 100Mbit 100ms 1
s1 ./qdisc.sh s1-eth2 100Mbit 100ms 1

h2 nohup go run ~/go/src/github.com/lucas-clemente/quic-go/example/main.go -bind 10.0.0.2:4443 -www /var/www/html/ &
h1 echo "-----Measurement 4-----" >> quic_loss
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_loss
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_loss
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_loss
h2 pkill main

h2 nohup iperf -s &
h1 echo "-----Measurement 4-----" >> iperf_loss
h1 iperf -c 10.0.0.2 &>> iperf_loss
h1 iperf -c 10.0.0.2 &>> iperf_loss
h1 iperf -c 10.0.0.2 &>> iperf_loss
h2 pkill iperf


# Set 100Mbps with 100ms RTT 3 loss
s1 ./qdisc.sh s1-eth1 100Mbit 100ms 1.5
s1 ./qdisc.sh s1-eth2 100Mbit 100ms 1.5

h2 nohup go run ~/go/src/github.com/lucas-clemente/quic-go/example/main.go -bind 10.0.0.2:4443 -www /var/www/html/ &
h1 echo "-----Measurement 5-----" >> quic_loss
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_loss
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_loss
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_loss
h2 pkill main

h2 nohup iperf -s &
h1 echo "-----Measurement 5-----" >> iperf_loss
h1 iperf -c 10.0.0.2 &>> iperf_loss
h1 iperf -c 10.0.0.2 &>> iperf_loss
h1 iperf -c 10.0.0.2 &>> iperf_loss
h2 pkill iperf


# Set 100Mbps with 100ms RTT 4 loss
s1 ./qdisc.sh s1-eth1 100Mbit 100ms 2
s1 ./qdisc.sh s1-eth2 100Mbit 100ms 2

h2 nohup go run ~/go/src/github.com/lucas-clemente/quic-go/example/main.go -bind 10.0.0.2:4443 -www /var/www/html/ &
h1 echo "-----Measurement 6-----" >> quic_loss
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_loss
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_loss
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_loss
h2 pkill main

h2 nohup iperf -s &
h1 echo "-----Measurement 6-----" >> iperf_loss
h1 iperf -c 10.0.0.2 &>> iperf_loss
h1 iperf -c 10.0.0.2 &>> iperf_loss
h1 iperf -c 10.0.0.2 &>> iperf_loss
h2 pkill iperf


# Set 100Mbps with 100ms RTT 5 loss
s1 ./qdisc.sh s1-eth1 100Mbit 100ms 2.5
s1 ./qdisc.sh s1-eth2 100Mbit 100ms 2.5

h2 nohup go run ~/go/src/github.com/lucas-clemente/quic-go/example/main.go -bind 10.0.0.2:4443 -www /var/www/html/ &
h1 echo "-----Measurement 7-----" >> quic_loss
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_loss
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_loss
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_loss
h2 pkill main

h2 nohup iperf -s &
h1 echo "-----Measurement 7-----" >> iperf_loss
h1 iperf -c 10.0.0.2 &>> iperf_loss
h1 iperf -c 10.0.0.2 &>> iperf_loss
h1 iperf -c 10.0.0.2 &>> iperf_loss
h2 pkill iperf
