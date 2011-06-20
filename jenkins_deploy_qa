#!/bin/bash

python bootstrap.py
./bin/buildout -c deploy.cfg
./bin/deploy-qa -s $SSHUser -p $SSHPassword -g $GitUser -w $GitPassword -f
