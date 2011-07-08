Get Going Fast:
---------------

Run this on the box to provision::

    $ sudo -i
    $ apt-get install git-core puppet
    $ cd /var; mkdir praekelt; chown www-data: praekelt; cd praekelt
    $ git clone git@github.com:praekelt/jenkins-provision.git jenkins
    $ cd jenkins
    $ puppet manifest.pp

