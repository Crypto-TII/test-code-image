#!/bin/bash
useradd $JUPYTER_USER -m -s /bin/bash -u $JUPYTER_USER_UID
echo $JUPYTER_USER:$PASSWORD | chpasswd
runuser -l $JUPYTER_USER -c "PASSWORD=$PASSWORD code-server --host 0.0.0.0 --port 8085 --auth password"