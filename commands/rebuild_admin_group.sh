#!/bin/sh
dscl . -create /Groups/admin
dscl . -create /Groups/admin RealName Administrators
dscl . -create /Groups/admin PrimaryGroupID 80
dscl . -create /Groups/admin Password \*
dscl . -append /Groups/admin GroupMembership root
dscl . -append /Groups/admin GroupMembership admin
