# WSL, Docker and Ubuntu on Windows
https://nickjanetakis.com/blog/using-wsl-and-mobaxterm-to-create-a-linux-dev-environment-on-windows
https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly
##TL;DR
* Download and install Docker for Windows
* On host (Windows): Enable Docker to be accessible over tcp WITHOUT TLS (in settings)
* In Ubuntu:
** Install docker-ce, *docker.io* does NOT work using the Docker For Windows as the daemon
   ```
   sudo apt-get remove docker docker-engine docker.io
   sudo apt-get update
   sudo apt-get install     apt-transport-https     ca-certificates     curl     software-properties-common
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   sudo apt-key fingerprint 0EBFCD88
   sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
   sudo apt-get update
   sudo apt-get install docker-ce
   export DOCKER_HOST=tcp://0.0.0.0:2375
   docker run hello-world
   ```
Building a Docker image in Ubuntu:

# Launch graphical apps on Ubuntu
* Launch MobaXTerm on Windows
* In Ubuntu: `export DISPLAY=:0`

# Setting MobaXTerm to use Ubuntu on Windows' bash as the terminal
https://blog.mobatek.net/post/mobaxterm-new-release-9.0/

Once this is setup, we dont need git-bash or Cygwin or other tools for development.
