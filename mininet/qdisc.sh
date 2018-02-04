if [ "$#" -ne 4 ]; then
	echo "Usage <dev> <rate> <delay(half)> <loss(percent)>"
    echo "Example ./qdisc.sh s1-eth1 100Mbit 50ms 0.1"
	exit
fi

dev=$1
rate=$2
delay=$3
loss=$4

tc qdisc del dev $dev root
tc qdisc add dev $dev root handle 1:0 htb default 1
tc class add dev $dev parent 1:0 classid 1:1 htb rate $rate ceil $rate
tc qdisc add dev $dev parent 1:1 handle 10: netem delay $delay loss $loss

#tc qdisc add dev $dev parent 1:1 handle 10: netem delay $delay limit $qlen
