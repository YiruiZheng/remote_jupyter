#!/bin/bash
# Yirui Zheng, Jan 2021, feel free to circulate the scripts.
# edit the script "line 17", change user@remote to your username and server address, e.g. abc12@exo.st-andrews.ac.uk
#   for vela users, line 17 looks like:  ssh -Y abc12@vela.st-andrews.ac.uk ps aux | grep -i "jupyter-notebook --no-browser" | awk {'print $2'}|xargs ssh -Y abc12@vela.st-andrews.ac.uk kill


#ps aux            : report a snapshot of the current processes
#grep -i jupyter   : find the line that tells the info of jupyter
#awk {'print $2'}  : find the second the trunk of the line, which is the PID of jupyter
#xargs             : pass the result of previous command to the following command
#                    as a parameter. Here we pass the PID to kill.

# close the jupyter tunnel that created in "remote_jupyter"
ps aux | grep -i localhost:9999 | awk {'print $2'}|xargs kill
# shut down the jupyter process on the server
# ssh -Y user@remote --> conduct the following command on the server
ssh -Y user@remote ps aux | grep -i "jupyter-notebook --no-browser" | awk {'print $2'}|xargs ssh -Y user@remote kill
