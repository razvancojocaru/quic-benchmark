import subprocess
import argparse
import json

DOWNLOAD_STARTED = 327
DOWNLOAD_ITEM_FINISHED = 337


def run_command(cmd):
    process = subprocess.Popen(cmd, 
                     shell=True, 
                     stdout=subprocess.PIPE,
                     stderr=subprocess.STDOUT)
    return process.stdout.read()

def get_event_codes(file):
    line = ''
    # read first line of file and strip newline and comma
    with open(file, 'r') as har_file:
        line = har_file.readline()[:-2]
    all_event_codes = line #json.loads(line)
    print all_event_codes

def get_event_timestamp(file, event):
    download_start_event = run_command('cat {0} | grep \'"type":{1}\''
                                       .format(file, event))[:-2]
    download_start_event = json.loads(download_start_event)
    return int(download_start_event['time'])

def parse_args():
    parser = argparse.ArgumentParser(description='Provide har file path')
    parser.add_argument('har_file')
    args = parser.parse_args()
    return args

def main(args):
    FILE = args.har_file
    start_time = get_event_timestamp(FILE, DOWNLOAD_STARTED)
    finish_time = get_event_timestamp(FILE, DOWNLOAD_ITEM_FINISHED)
    print finish_time - start_time


if __name__ == '__main__':
    args = parse_args()
    main(args)
