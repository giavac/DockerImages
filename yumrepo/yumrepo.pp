include epel
include cpan

package { 'rrdtool-perl':
	ensure => present,
}->
package { 'perl-ExtUtils-MakeMaker':
	ensure => present,	
}->
package { 'fpm':
	ensure => present,
	provider => gem
}

cpan { "App::cpanminus":
  ensure  => present,
  require => Class['::cpan'],
  force   => true,
}

class { 'apache': }

apache::vhost { 'first.example.com':
  port    => '80',
  docroot => '/var/www/html/puppetrepo',
}->
createrepo { 'yumrepo':
  repository_dir => '/var/www/html/puppetrepo/el-6.5',
  repo_cache_dir => '/var/cache/puppetrepo/el-6.5',
}->
yumrepo {'el-6.5':
  descr    => 'test El 6.5 - x86_64',
  baseurl  => 'http://localhost/el-6.5/',
  enabled  => 'true',
  gpgcheck => 'false',
}