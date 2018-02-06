'''
HOWTO:
preparse iperf file: cat <file> | grep Mbit
preparse quic file: cat <file> | grep real
'''
import sys

if len(sys.argv) < 3:
    print 'Usage: python parse_results.py <preparsed_file> [quic | iperf]'

filename = sys.argv[1]
filetype = sys.argv[2]

if filetype == 'quic':
    # time file output line: real \t 0m42.000s
    with open(filename, 'r') as f:
        with open('bandwidth_quic', 'w') as out:
            lines = f.readlines()
            lines = [l.split()[1] for l in lines]
            lines = [l.split('m') for l in lines]
            lines = [60*float(l[0]) + float(l[1][:-1]) for l in lines]
            for i in range(0, len(lines), 3):
                print '---------------'
                print lines[i]
                print lines[i+1]
                print lines[i+2]
                out.write('{}\n'.format(800/min(lines[i:i+3])))

elif filetype == 'iperf':
    # iperf output line: [  3]  0.0-10.2 sec  43.8 MBytes  36.0 Mbits/sec
    with open(filename, 'r') as f:
        with open('bandwidth_iperf', 'w') as out:
            lines = f.readlines()
            lines = [float(l.split()[6]) for l in lines]
            for i in range(0, len(lines), 3):
                print '---------------'
                print lines[i]
                print lines[i+1]
                print lines[i+2]
                out.write('{}\n'.format(max(lines[i:i+3])))
