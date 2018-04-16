# == Class: test
#
# Full description of class test here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'test':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2018 Your name here, unless otherwise noted.
#


class { 'nginx':

        manage_repo => true,
        package_resource => 'nginx-stable',
}

nginx::resource::upstream { 'upstream_app':
        members => [
                '10.10.10.10',
                '20.20.20.20',
        ],
}

nginx::resource::server {'www.domain.com' :
        www_root => '/opt/html',
}

nginx::resource::location {'/resource2':
        proxy => 'https:/domain.com/',
        server => '20.20.20.20',
}

class copy {
	file { '/etc/nginx/conf.d/default.conf':
	  ensure => "absent",
	  mode => "0644",
	  owner => 'root',
	  group => 'root',
 	  source => 'templates/etc/nginx/conf.d/default.conf',
	}

	file { '/etc/nginx/nginx.conf':
          ensure => "absent",
          mode => "0644",
          owner => 'root',
          group => 'root',
          source => 'templates/etc/nginx/nginx.conf',
        }

	file { '/etc/nginx/ssl/test.io-cert.pem':
          ensure => "absent",
          mode => "0644",
          owner => 'root',
          group => 'root',
          source => 'templates/etc/nginx/ssl/test.io-cert.pem',
        }

	file { '/etc/nginx/ssl/test.io-key.pem':
          ensure => "absent",
          mode => "0644",
          owner => 'root',
          group => 'root',
          source => 'templates/etc/nginx/ssl/test.io-key.pem',
        }

}
