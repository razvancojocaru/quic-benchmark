
h1 export PATH=$PATH:/usr/local/go/bin
h2 export PATH=$PATH:/usr/local/go/bin

# Set 100Mbps with 100ms RTT 0 loss
s1 ./qdisc.sh s1-eth1 100Mbit 50ms 0
s1 ./qdisc.sh s1-eth2 100Mbit 50ms 0

# Run with 1 connection
h2 nohup go run ~/go/src/github.com/lucas-clemente/quic-go/example/main.go -bind 10.0.0.2:4443 -www /var/www/html/ &
h1 echo "-----Measurement 1-----" > quic_fairness
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness
h1 echo "----------" >> quic_fairness
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness
h1 echo "----------" >> quic_fairness
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness
h2 pkill main

# Run with 2 connections (one bg one fg)
h2 nohup go run ~/go/src/github.com/lucas-clemente/quic-go/example/main.go -bind 10.0.0.2:4443 -www /var/www/html/ &
h1 echo "-----Measurement 2-----" >> quic_fairness
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness
h1 sleep 10

h1 echo "----------" >> quic_fairness
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness
h1 sleep 10

h1 echo "----------" >> quic_fairness
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness
h1 sleep 10
h2 pkill main

# Run with 3 connections (2 bg one fg)
h2 nohup go run ~/go/src/github.com/lucas-clemente/quic-go/example/main.go -bind 10.0.0.2:4443 -www /var/www/html/ &
h1 echo "-----Measurement 3-----" >> quic_fairness
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness
h1 sleep 10

h1 echo "----------" >> quic_fairness
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness
h1 sleep 10

h1 echo "----------" >> quic_fairness
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness
h1 sleep 10
h2 pkill main

# Run with 4 connections (3 bg one fg)
h2 nohup go run ~/go/src/github.com/lucas-clemente/quic-go/example/main.go -bind 10.0.0.2:4443 -www /var/www/html/ &
h1 echo "-----Measurement 4-----" >> quic_fairness
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness
h1 sleep 20

h1 echo "----------" >> quic_fairness
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness
h1 sleep 20

h1 echo "----------" >> quic_fairness
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness
h1 sleep 20
h2 pkill main

# Run with 5 connections (4 bg one fg)
h2 nohup go run ~/go/src/github.com/lucas-clemente/quic-go/example/main.go -bind 10.0.0.2:4443 -www /var/www/html/ &
h1 echo "-----Measurement 5-----" >> quic_fairness
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness
h1 sleep 20

h1 echo "----------" >> quic_fairness
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness
h1 sleep 20

h1 echo "----------" >> quic_fairness
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 ((time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness &)
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> quic_fairness
h1 sleep 20
h2 pkill main

