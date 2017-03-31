vagrant up
vagrant ssh -c 'sudo bash /vagrant/test/verify.sh'
code=$?
vagrant halt
exit $code
