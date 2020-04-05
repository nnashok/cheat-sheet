# Tools on Windows
* Firefox
* Google Chrome
* WhatsApp
* Chocolatey

* Process Explorer
* Malawarebytes
* ccleaner
* winrar
* vlc
* putty
* keepass
* ffmpeg

* gvim
* mplayer
* steam
* inkscape
* sketchbook
* krita
* 7z
* NetSpot (for WiFi signal analysis) (NetStumbler didnt support the specific Intel wifi chip)

* android studio

* install_hyperv
* docker
* Ubuntu
* MobaXTerm
* ConEmu
* kind or minikube

```
choco install procexp malwarebytes ccleaner winrar vlc putty keepass notepadplusplus ffmpeg-batch.install

nodejs git python3 vscode
```

   Configure ConEmu to use Ubuntu bash: goto the settings -> Startup -> Specific task name screen and pick {Bash::bash} from the drop down list and save the settings.

# Firefox Extensions
* Duck Duck Go
* YouTube Downloader (https://addons.mozilla.org/en-US/firefox/addon/youtube_downloader_webx)

# Installing Hyper-V ad Containers packages on Windows Home to use Docker
From https://forums.docker.com/t/installing-docker-on-windows-10-home/11722/25
Execute the following in a Admin `cmd` window:
```
pushd "%~dp0"
dir /b %SystemRoot%\servicing\Packages\*Hyper-V*.mum >hyper-v.txt
for /f %%i in ('findstr /i . hyper-v.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
del hyper-v.txt
dir /b %SystemRoot%\servicing\Packages\*containers*.mum >containers.txt
for /f %%i in ('findstr /i . containers.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
del containers.txt
Dism /online /enable-feature /featurename:Microsoft-Hyper-V -All /LimitAccess /ALL
Dism /online /enable-feature /featurename:Containers -All /LimitAccess /ALL
pause
```

You need to edit registry:
```
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion :
EditionID: Core --> Professional
ProductName: Windows 10 Home --> Windows 10 Pro
```

Latest version on the edge Docker channel supports Windows 10 Home but needs an Windows Insider version for now

# WSL, Docker and Ubuntu on Windows
https://nickjanetakis.com/blog/using-wsl-and-mobaxterm-to-create-a-linux-dev-environment-on-windows
https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly
##TL;DR
* Check if virtualization is enabled (`system information`: look for Hyer-V* featurs)
* Enable WSL (`Turn Windows Features On or Off`)
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

# Kubernetes in Windows
Two options using `kind` or `minikube`
## kind
This allows you to run Kubernetes in a Docker container. `Docker for Windows` will show a new container `kind-control-plane` which is running the Kubernetes cluster. Except for being able to pull images from private registies, everything else seems to work.
## Minikube
You also can use `minikube` to create a Kubernetes cluster without creating another VM. Instead, you can configure `minikube` to create the cluster in a container in `Docker for Windows`.
```
minikube start --driver=docker
```
Note that the above needs to be run in Windows. Trying that in an Ubuntu shell does not work as `minikube` expects to reach the Docker daemon over Unix socket, it does not use `DOCKER_HOST` to reach the Docker daemon. To verify installation:
```
minikube kubectl -- get pods --all-namespaces
```
### Accessing from Ubuntu in WSL
```
cd ~ && ln -s /mnt/c/Users/ashoknn/.minikube
cp /mnt/c/Users/ashoknn/.kube/config ~/.kube/
sed -i -e 's#C:\\Users\\ashoknn\\#/home/ashoknn/#' -e 's#\\#\/#g' ~/.kube/config
```

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

   
# Windows Tricks
* Open a file using the default application from a Windows shell: `start readme.txt`. If you need to start from within another program, you need to invoke it via the `cmd` like `cmd /c "start readme.txt"`.
* To Take a Screenshot of Part of Your Screen: Press “Windows + Shift + S”. Your screen will appear grayed out and your mouse cursor will change. Click and drag on your screen to select the part of your screen you want to capture. A screenshot of the screen region you selected will be copied to your clipboard. You can paste it in any application by selecting Edit > Paste or pressing Ctrl + V, just as you’d paste a full-screen shortcut taken with the Print Screen key.
* Open task manager: Control + F3

# Bluetooth
https://answers.microsoft.com/en-us/windows/forum/windows_10-other_settings-winpc/win-10-pc-cant-complete-bluetooth-file-transfer/291119aa-5e87-4fe2-9da1-6a5b4a49eb68

# Wifi
Show password for a wifi profile:
`netsh wlan show profile name="nannana1" key=clear`
