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
