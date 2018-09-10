# WSL, Docker and Ubuntu on Windows
https://nickjanetakis.com/blog/using-wsl-and-mobaxterm-to-create-a-linux-dev-environment-on-windows
https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly
##TL;DR
* Enable WSL
* Download and install Docker for Windows. Make sure you run it as Administrator other wise you'll see errors like `Docker hv-sock proxy (vsudd) is not reachable`.
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

# Accessing files within Ubuntu from Windows
```C:\Users\%USERNAME%\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs\```
**NOTE: Modifying a file from Windows may cause the file properties/attributes to be corrupted.**

# Launch graphical apps on Ubuntu
* Launch MobaXTerm on Windows
* In Ubuntu: `export DISPLAY=:0`

# Setting MobaXTerm to use Ubuntu on Windows' bash as the terminal
https://blog.mobatek.net/post/mobaxterm-new-release-9.0/

Once this is setup, we dont need git-bash or Cygwin or other tools for development.

# Tools in Ubuntu on Windows
* tig dos2unix apt-file

# Tools on Windows
* MobaXTerm
* Firefox
* Google Chrome
* Ubuntu
* WhatsApp
* NetSpot (for WiFi signal analysis) (NetStumbler didnt support the specific Intel wifi chip)
* ConEmu
   Configure ConEmu to use Ubuntu bash: goto the settings -> Startup -> Specific task name screen and pick {Bash::bash} from the drop down list and save the settings.
   
# Windows Tricks
* Open a file using the default application from a Windows shell: `start readme.txt`. If you need to start from within another program, you need to invoke it via the `cmd` like `cmd /c "start readme.txt"`.

# Bluetooth
https://answers.microsoft.com/en-us/windows/forum/windows_10-other_settings-winpc/win-10-pc-cant-complete-bluetooth-file-transfer/291119aa-5e87-4fe2-9da1-6a5b4a49eb68

# Wifi
Show password for a wifi profile:
`netsh wlan show profile name="nannana1" key=clear`
