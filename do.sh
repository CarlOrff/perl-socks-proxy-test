#!/bin/bash
# via sh is neccesary to change the default file directory

cd `dirname $0`
rm -R export/*
docker run -dit --name "perl-socks-proxy-test" archaeopath/perl-socks-proxy-test /bin/bash
docker exec perl-socks-proxy-test /bin/bash -c "./init.sh" > perl-socks-proxy-test.log 2>&1
docker export perl-socks-proxy-test > export/perl-socks-proxy-test.tar
docker container stop perl-socks-proxy-test
docker container rm perl-socks-proxy-test

cd export
tar -xf perl-socks-proxy-test.tar