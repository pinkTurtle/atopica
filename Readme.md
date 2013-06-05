# Rat, a clean web site

## How to start

####1. Install compilers

    $ sudo npm install -g jade
    $ sudo npm install -g component
    $ sudo npm install -g stylus

####2. Install npm dependencies. Just type:

    $ cd sources/styles/
    $ npm install

####3. Add permissions to execute bash scripts

    $ chmod +x ftp-push.sh compiler.sh

####4. Install ftp-tool

######Install `git ftp`

You need to clone the [git-ftp](https://github.com/git-ftp/git-ftp) github repository and follow install instructions.

For instance:

    $ git clone https://github.com/git-ftp/git-ftp.git
    $ cd git-ftp
    $ git checkout master
    $ sudo make install

You can read [install file](https://github.com/git-ftp/git-ftp/blob/master/INSTALL.md) from [git-ftp](https://github.com/git-ftp/git-ftp)

######Alternatively you may need to install `git-deploy`

You need to install the ruby gems: net-ssh, net-sftp, net-scp. So type:

    $ sudo gem install net-ssh net-sftp net-scp

Now install [git-deploy](https://github.com/Juan-Facundo/git-deploy)

    $ git clone git@github.com:Juan-Facundo/git-deploy.git
    $ cd git-deploy
    $ sudo cp bin/git-deploy /usr/local/bin (ensure your $PATH)

## Make rules

  - `make html`: compile jade files

  - `make css`: compile stylus files

  - `make js`: compile component

  - `make all`: compile all files

  - `make ftp-push`: push compiled files and push them to the hosting

  - `make deploy`: push to master [ through git ] and push files to stage [ through ftp ]. You need to add and
  commit first.

## Some tips

- Put all your public html documents (wordpress, and many others) in `public_html` folder. Many scripts in this system are referred to it.

- Edit every file to fit your needs, i.e.

        * tools/ftp-push
        * Makefie

- For uploading files to webserver using [ fit-ftp ]

    keep well configured `.git-ftp-ignore` file, and whenever you need to update, run:
    
            $ make ftp-deploy (script is in Makefile)

- For uploading files to webserver using [ git deploy ]

    keep well configured `deploy.yml` file, and whenever you need to update, run:
    
            $ git deploy
