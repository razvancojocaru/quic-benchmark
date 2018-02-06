SCRIPT_FILE = 'run_loss_generated'
OUT_FILE_QUIC = 'quic_loss'
OUT_FILE_IPERF = 'iperf_loss'

path_setup = '''
h1 export PATH=$PATH:/usr/local/go/bin
h2 export PATH=$PATH:/usr/local/go/bin
'''

measurement_run = '''
s1 ./qdisc.sh s1-eth1 100Mbit 25ms {0}
s1 ./qdisc.sh s1-eth2 100Mbit 25ms {0}

h2 nohup go run ~/go/src/github.com/lucas-clemente/quic-go/example/main.go -bind 10.0.0.2:4443 -www /var/www/html/ &
h1 echo "-----Measurement {0} loss-----" >> {1}
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> {1}
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> {1}
h1 (time go run ~/go/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:4443/test100m.dat &> /dev/null) &>> {1}
h2 pkill main

h2 nohup iperf -s &
h1 echo "-----Measurement {0} loss-----" >> {2}
h1 iperf -c 10.0.0.2 &>> {2}
h1 iperf -c 10.0.0.2 &>> {2}
h1 iperf -c 10.0.0.2 &>> {2}
h2 pkill iperf

'''

with open(SCRIPT_FILE, 'w') as script:
    script.write(path_setup)

    for loss_int in range(0,101,5):
        loss = loss_int * 0.01
        script.write(measurement_run
            .format(loss, OUT_FILE_QUIC, OUT_FILE_IPERF))