#!/bin/bash
# Yirui Zheng, Jan 2021, feel free to circulate the scripts.
# usage:
# 1. edit the script "line 21, 22, 25", change user@remote to your username and server address, e.g. abc12@exo.st-andrews.ac.uk
#   for vela users, line 22 looks like:  ssh -N -f -L localhost:9999:localhost:${remote_localhost} abc12@vela.st-andrews.ac.uk
# 2. run "chmod +x remote_jupyter.sh lose_jupyter_tunnel.sh" to make the scripts executable
# 3. run this script "bash remote_jupyter.sh" or "./remote_jupyter.sh", the last line will be
#    "http://localhost:8888/?token=dkfajfkajfklajf". Please copy the token
# 4. type "locahost:9999" in your browser, if a token is required, paste the
#    token copied in the previous step
# 5. when you want to leave, presss "Ctrl+C" to stop the script,
#   also run "bash close_jupyter_tunnel.sh" or "./close_jupyter_tunnel.sh" to free the server source.
#    you need to change user@remote in the "close_jupyter_tunnel" script as well.



# change the port used by jupyter. 8888 by default
# sometimes the port is occupied by someone else, you will then need to change it, ideally, choose a specific one for yourself so no one else will conflict with you.
remote_localhost=8888
# create a tunnel to hear from jupyter on the server
echo "ssh -N -f -L localhost:9999:localhost:${remote_localhost} user@remote"
ssh -N -f -L localhost:9999:localhost:${remote_localhost} user@remote

# run jupyter notebook on the server
ssh -Y user@remote jupyter notebook --no-browser --port=${remote_localhost}
