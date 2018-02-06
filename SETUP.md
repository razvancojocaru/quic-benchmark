
## Set up quic-go in Ubuntu 16.04
sudo apt-get update && sudo apt-get upgrade

### install go
```bash
wget https://dl.google.com/go/go1.9.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.9.3.linux-amd64.tar.gz
```

### set up env vars for go
```bash
echo 'export PATH=$PATH:/usr/local/go/bin' >> .bashrc
echo 'export GOPATH=/home/ubuntu/go' >> ~/.bashrc
source ~/.bashrc
```

### download quic-go
```bash
mkdir -p ./go/src/github.com/lucas-clemente
cd ./go/src/github.com/lucas-clemente
git clone https://github.com/lucas-clemente/quic-go.git
```

### check golang version > 1.9
```bash
go version
```

### update deps for quic-go
```bash
cd quic-go
go get -t -u ./...
```

### add hostname to /etc/hosts
### either quic.clemente.io or make your own certs
