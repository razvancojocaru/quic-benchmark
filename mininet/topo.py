from mininet.topo import Topo
from mininet.link import TCLink

class MyTopo( Topo ):
    "Simple topology example."

    def __init__( self ):
        "Create custom topo."

        # Initialize topology
        Topo.__init__( self )

        # Add hosts and switches
        h1 = self.addHost('h1')
        h2 = self.addHost('h2')
        tor1 = self.addSwitch('s1')
        # Add links
        self.addLink(h1, tor1) #, bw=200, delay='25ms')
        self.addLink(h2, tor1) #, bw=200, delay='25ms')

topos = { 'mytopo': ( lambda: MyTopo() ) }