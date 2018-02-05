# How to run measurements

## Run mininet with the custom S-R-C topology
$ sudo mn --custom topo.py --topo mytopo --link tc


## Run the delay/loss script in the mininet prompt
$ source run_delay.sh


## TODO
Rewrite run_delay.sh and run_loss.sh in python. </br>
Having no loops is horrible and messy.
