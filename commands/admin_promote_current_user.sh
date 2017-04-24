#!/bin/bash
#who | grep console | cut -d ' ' -f 1,50
currentUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

dscl . -append /Groups/admin GroupMembership $currentUser

echo "Admin accounts are now:";
dscl . -read /Groups/admin GroupMembership | cut -c 18-;
