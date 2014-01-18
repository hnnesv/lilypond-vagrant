lilypond-vagrant
================

Vagrant/Puppet scripts for Lilypond.

Usage
-----
See http://www.vagrantup.com/ for details about using Vagrant.

Place your project files in the scores directory, which is accessible from within the VM in *~/scores* (you can use ```vagrant ssh``` to access the VM).

By default version 2.18.0 of Lilypond will be used, however this can be changed in ```manifests/lily.pp``` by setting the variable ```$lilypond_version```.
