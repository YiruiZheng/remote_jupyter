### README

其实只要ssh进服务器后运行jupyter notebook --no-browser， 再在本地运行ssh -N -f -L 建立一个监听隧道就行了。我比较懒，所以整合到了一块。

-----

#### 使用前

1. 修改remote_jupyter.sh脚本中的remote_localhost， 挑一个你喜欢的数字，避免与别人冲突
2. 修改**两个**脚本中user@remote, 改成你的用户名和服务器
3. `chmod +x remote_jupyter.sh close_jupyter_tunnel.sh`

#### 使用时

1. 运行``bash remote_jupyter.sh` 或者 `./remote_jupyter.sh`，这时最后一行输出应该是 "http://localhost:8888/?token=dkfajfkajfklajf"之类， 把 token 复制下来
2. 打开浏览器，输出“locahost:9999"，如果提示要token或者password, 把上一步复制的token粘贴上去

#### 使用后

1. 回到运行remote_jupyter.sh的terminal, 按Ctrl+c，终止运行
2. 运行`bash remote_jupyter.sh` or `./remote_jupyter.sh`, 就能关闭本地的监听通道和服务器上的jupyter进程，把资源释放出来

---

#### 其他说明

1. 把这两个代码放到/usr/local/bin/，或者其他PATH下面，这样就不用cd到存储文件的文件夹了。登上terminal 就可以直接`remote_jupyter.sh`。
2. 这个代码要多次输出服务器密码，建议谷歌或者百度一下set ssh passwordless， 这样方便，比如可以使用key来登录。当然，有需要的话，问问服务器的管理人员，这样是否安全。如果不便，那就还是建议按README最开始的，分两步走。关闭的时候也分同步关就可以了。



