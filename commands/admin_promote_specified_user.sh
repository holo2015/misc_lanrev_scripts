#!/bin/bash
# You must add a valid username to
# 'Command line options:'

dscl . -append /Groups/admin GroupMembership $1;
echo "Admin accounts are now:";
dscl . -read /Groups/admin GroupMembership;

