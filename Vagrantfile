$mysql_shell = <<-SCRIPT
  apt-get update && \  
  apt-get install -y mysql-server-5.7 && \
  mysql < /vagrant/mysql/script/init.sql && \
  cat /vagrant/mysql/mysqld.cnf > /etc/mysql/mysql.conf.d/mysqld.cnf && \
  service mysql restart
SCRIPT

Vagrant.configure("2") do |config|  
  config.vm.box = "ubuntu/bionic64"
  config.vm.box_check_update = true  

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end

  config.vm.define "mysqlserver" do |db|        
    db.vm.network "forwarded_port", guest: 3306, host: 3306  
    db.vm.provision "shell",  inline: $mysql_shell
  end
       
end
