# PacketAnalyzer

PacketAnalyzer is a simple application that analyzes IPv4 and IPv6 headers.

# How to use


This project is guaranteed to work with the following versions.

` Docker version 19.03.5, build 633a0ea `

How to start:

```bash
git clone https://github.com/niya1123/PacketAnalyzer.git
cd PacketAnalyzer
docker-compose up -d --build
docker exec -it pa /bin/bash
# After container connection...
cd packet_analyzer
mix deps.get
cd assets && npminstall
mix phx.server
```
Next, connect [http://localhost:4000](http://localhost:4000) .

# License

PacketAnalyzer is under [MIT license](https://en.wikipedia.org/wiki/MIT_License).