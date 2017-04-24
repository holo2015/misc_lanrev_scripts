#!/bin/bash
dscl . -delete /Groups/admin GroupMembership $1;
dscl . -read /Groups/admin GroupMembership;

