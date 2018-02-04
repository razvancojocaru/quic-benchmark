
h1 export PATH=$PATH:/usr/local/go/bin
h2 export PATH=$PATH:/usr/local/go/bin

# Set 100Mbps with 100ms RTT 0 loss
s1 ./qdisc.sh s1-eth1 100Mbit 50ms 0
s1 ./qdisc.sh s1-eth2 100Mbit 50ms 0

h2 nohup go run ~/go/src/github.com/lucas-clemente/quic-go/example/main.go -bind 10.0.0.2:4443 -www /var/www/html/ &
h1 echo "-----Measurement 1-----" > quic_delay
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_delay
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_delay
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_delay
h2 pkill main

h2 nohup iperf -s &
h1 echo "-----Measurement 1-----" > iperf_delay
h1 iperf -c 10.0.0.2 &>> iperf_delay
h1 iperf -c 10.0.0.2 &>> iperf_delay
h1 iperf -c 10.0.0.2 &>> iperf_delay
h2 pkill iperf


# Set 100Mbps with 500ms RTT 0 loss
s1 ./qdisc.sh s1-eth1 100Mbit 250ms 0
s1 ./qdisc.sh s1-eth2 100Mbit 250ms 0

h2 nohup go run ~/go/src/github.com/lucas-clemente/quic-go/example/main.go -bind 10.0.0.2:4443 -www /var/www/html/ &
h1 echo "-----Measurement 2-----" >> quic_delay
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_delay
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_delay
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_delay
h2 pkill main

h2 nohup iperf -s &
h1 echo "-----Measurement 2-----" >> iperf_delay
h1 iperf -c 10.0.0.2 &>> iperf_delay
h1 iperf -c 10.0.0.2 &>> iperf_delay
h1 iperf -c 10.0.0.2 &>> iperf_delay
h2 pkill iperf


# Set 100Mbps with 1000ms RTT 0 loss
s1 ./qdisc.sh s1-eth1 100Mbit 500ms 0
s1 ./qdisc.sh s1-eth2 100Mbit 500ms 0

h2 nohup go run ~/go/src/github.com/lucas-clemente/quic-go/example/main.go -bind 10.0.0.2:4443 -www /var/www/html/ &
h1 echo "-----Measurement 3-----" >> quic_delay
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_delay
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_delay
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_delay
h2 pkill main

h2 nohup iperf -s &
h1 echo "-----Measurement 3-----" >> iperf_delay
h1 iperf -c 10.0.0.2 &>> iperf_delay
h1 iperf -c 10.0.0.2 &>> iperf_delay
h1 iperf -c 10.0.0.2 &>> iperf_delay
h2 pkill iperf


# Set 100Mbps with 1500ms RTT 0 loss
s1 ./qdisc.sh s1-eth1 100Mbit 750ms 0
s1 ./qdisc.sh s1-eth2 100Mbit 750ms 0

h2 nohup go run ~/go/src/github.com/lucas-clemente/quic-go/example/main.go -bind 10.0.0.2:4443 -www /var/www/html/ &
h1 echo "-----Measurement 4-----" >> quic_delay
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_delay
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_delay
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_delay
h2 pkill main

h2 nohup iperf -s &
h1 echo "-----Measurement 4-----" >> iperf_delay
h1 iperf -c 10.0.0.2 &>> iperf_delay
h1 iperf -c 10.0.0.2 &>> iperf_delay
h1 iperf -c 10.0.0.2 &>> iperf_delay
h2 pkill iperf


# Set 100Mbps with 2000ms RTT 0 loss
s1 ./qdisc.sh s1-eth1 100Mbit 1000ms 0
s1 ./qdisc.sh s1-eth2 100Mbit 1000ms 0

h2 nohup go run ~/go/src/github.com/lucas-clemente/quic-go/example/main.go -bind 10.0.0.2:4443 -www /var/www/html/ &
h1 echo "-----Measurement 5-----" >> quic_delay
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_delay
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_delay
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_delay
h2 pkill main

h2 nohup iperf -s &
h1 echo "-----Measurement 5-----" >> iperf_delay
h1 iperf -c 10.0.0.2 &>> iperf_delay
h1 iperf -c 10.0.0.2 &>> iperf_delay
h1 iperf -c 10.0.0.2 &>> iperf_delay
h2 pkill iperf


# Set 100Mbps with 2500ms RTT 0 loss
s1 ./qdisc.sh s1-eth1 100Mbit 1250ms 0
s1 ./qdisc.sh s1-eth2 100Mbit 1250ms 0

h2 nohup go run ~/go/src/github.com/lucas-clemente/quic-go/example/main.go -bind 10.0.0.2:4443 -www /var/www/html/ &
h1 echo "-----Measurement 6-----" >> quic_delay
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_delay
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_delay
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_delay
h2 pkill main

h2 nohup iperf -s &
h1 echo "-----Measurement 6-----" >> iperf_delay
h1 iperf -c 10.0.0.2 &>> iperf_delay
h1 iperf -c 10.0.0.2 &>> iperf_delay
h1 iperf -c 10.0.0.2 &>> iperf_delay
h2 pkill iperf


# Set 100Mbps with 3000ms RTT 0 loss
s1 ./qdisc.sh s1-eth1 100Mbit 1500ms 0
s1 ./qdisc.sh s1-eth2 100Mbit 1500ms 0

h2 nohup go run ~/go/src/github.com/lucas-clemente/quic-go/example/main.go -bind 10.0.0.2:4443 -www /var/www/html/ &
h1 echo "-----Measurement 7-----" >> quic_delay
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_delay
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_delay
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_delay
h2 pkill main

h2 nohup iperf -s &
h1 echo "-----Measurement 7-----" >> iperf_delay
h1 iperf -c 10.0.0.2 &>> iperf_delay
h1 iperf -c 10.0.0.2 &>> iperf_delay
h1 iperf -c 10.0.0.2 &>> iperf_delay
h2 pkill iperf
