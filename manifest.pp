exec { "jenkins-key":
    command => "/usr/bin/wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -",
}

exec { "jenkins-source":
    command => "/bin/echo \"deb http://pkg.jenkins-ci.org/debian binary/\" > /etc/apt/sources.list.d/jenkins.list",
    require => Exec["jenkins-key"]
}

exec { "apt-update":
    command => "/usr/bin/apt-get update",
    require => Exec["jenkins-source"]
}

package { 'jenkins':
    ensure => installed,
    require => Exec["apt-update"]
}

package { 'nginx':
    ensure => installed,
}

file {
    '/etc/nginx/sites-enabled/nginx.jenkins.conf':
        ensure => link,
        target => '/var/praekelt/jenkins/nginx.jenkins.conf';
}

