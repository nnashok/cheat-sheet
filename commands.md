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

# Resetting specific files to a specific commit version
git checkout c5f567 -- file1/to/restore file2/to/restore

# Docker
* Delete dangling images
    ```
    docker rmi $(docker images -q -f dangling=true)
    ```

# VIM
* Format a json buffer: `:%!python -m json.tool`

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
