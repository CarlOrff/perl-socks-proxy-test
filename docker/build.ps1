docker image rm perl-socks-proxy-test
docker build -t perl-socks-proxy-test .
docker tag perl-socks-proxy-test archaeopath/perl-socks-proxy-test:latest
docker login -u archaeopath
docker image push archaeopath/perl-socks-proxy-test