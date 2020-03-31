# Mirror a directory, preserves timestamps. progress2 shows overall status, --no-i-r creates list of files upfront
```
rsync -e ssh --info=progress2 --no-i-r -avz $PWD/ nnashok@192.168.1.133:"/Mac/Documents/"
```

# Show current package version (apt)
```
apt-cache show packagename
```

# Search for packages matching a name
```
apt-cache search packagename
```

# Update packages metadata
```
apt-get update
```

# Update a specific package
```
apt-get --only-upgrade install docker-ce
```

# List installed packages
```
apt-get list --installed
```

# Resetting specific files to a specific commit version
git checkout c5f567 -- file1/to/restore file2/to/restore

# Docker
* Delete dangling images
    ```
    docker rmi $(docker images -q -f dangling=true)
    ```

# VIM
* Format a json buffer: `:%!python -m json.tool`

# Extract audio from mp4/ Convert mp4 to mp3
`ffmpeg-20200106-1e3f4b5-win64-static\bin\ffmpeg.exe -loglevel error -i "Bhagavad Gita Sanskrit Guided Chant with Meaning - Chapter  -18 - Moksha Sannyasa Yoga.mp4" "Bhagavad Gita Sanskrit Guided Chant with Meaning - Chapter  -18 - Moksha Sannyasa Yoga.mp3"`

# Download stream to file using mencoder
```
@echo Started: %date% %time% > time.txt
"C:\Program Files\mplayer\mencoder.exe" -vid 1 "https://cdn.jwplayer.com/manifests/134aeq8w.m3u8?sig=fd3c8e9d0395" -oac pcm -ovc copy -o example.mp4
@echo Ended: %date% %time% >> time.txt
```

# pip
* Show package contents: `pip show -f cookiecutter`
* Show package details for all packages: `pip list | cut -d" " -f1 | xargs pip show -f | less`

# Generating Table of Contents (TOC) for markdown (.md)
https://github.com/ekalinin/github-markdown-toc

# Local markdown (.md) rendering
```
# Install grip
pip install grip

# First download the styles, you may need to set REQUESTS_CA_BUNDLE to point to your HTTP proxy's cert's CA
echo "Hello **world**!" | REQUESTS_CA_BUNDLE=../bpaas-local-dev/BloombergLPCORPCLASS1ROOTG2.crt grip --export -

# Update settings to print debug info
echo >~/.grip/settings.py<<EOM
# GitHub Enterprise API does not support markdown API
DEBUG=True
DEBUG_GRIP=True
EOM

# Run grip server and watch the md file, URL to access rendered page is http://localhost:6419/
REQUESTS_CA_BUNDLE=../bpaas-local-dev/BloombergLPCORPCLASS1ROOTG2.crt grip docs/k8s_migration_plan.md
```


## OpenSSL, Certificates and Keys
1. Verify a certificate and key matches

```
openssl x509 -noout -modulus -in server.crt| openssl md5
openssl rsa -noout -modulus -in server.key| openssl md5
```

## Get Chromium Version from Inspector/Console
```
var uaStr = navigator.userAgent.toLowerCase();
var index = uaStr.indexOf('chrome/');
uaStr.substring(index +7,index+11);
```

## Saving a stream to a file
Saving the video stream 1 from the URL which serves multiple video streams:
```
mplayer\mencoder.exe -vid 1 "https://cdn.jwplayer.com/manifests/Xs1Ix2Fn.m3u8?sig=f037b0ca226f48939edd1579e97ead77&exp=1575836684" -oac pcm -ovc copy -o inner_7.mp4
```
Playing a specific stream from a URL:
```
mplayer\mplayer.exe -vid 1 "https://cdn.jwplayer.com/manifests/MARlcFVG.m3u8?sig=827e53a201cdd5336d7076938ec56dfd&exp=1575764700"
```
