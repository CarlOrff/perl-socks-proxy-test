#!/bin/bash

# Services get stopped after build.
/etc/init.d/tor start

#systemctl --type=service
netstat -natup

perl -le 'eval "require $ARGV[0]" and print "LWP " . $ARGV[0]->VERSION' LWP
perl -le 'eval "require $ARGV[0]" and print "LWP::Protocol::socks " . $ARGV[0]->VERSION' LWP::Protocol::socks
perl -le 'eval "require $ARGV[0]" and print "LWP::Protocol::socks4 " . $ARGV[0]->VERSION' LWP::Protocol::socks4
perl proxytest.pl

