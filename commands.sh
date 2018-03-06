# Mirror a directory, preserves timestamps. progress2 shows overall status, --no-i-r creates list of files upfront
rsync -e ssh --info=progress2 --no-i-r -avz $PWD/ nnashok@192.168.1.133:"/Mac/Documents/"
