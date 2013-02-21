class logstash ($logstash_user = 'root') {

  include logstash::params
  require java_service_wrapper
  require apt

  case $::osfamily {
    'RedHat' : {
      require jpackage
    }
    'Debian' : {
      apt::source { "debian_testing":
        location    => "http://debian.mirror.iweb.ca/debian/",
        release     => "testing",
        repos       => "main contrib non-free",
        include_src => false,
      }
    }
  }

  package {$logstash::params::jdk:
    ensure => installed,
  }

  file {
    $logstash::params::bin_dir: ensure => directory;
    $logstash::params::etc_dir: ensure => directory;
    $logstash::params::log_dir: ensure => directory;
    $logstash::params::run_dir: ensure => directory;
  }

  exec { 'download logstash jar':
    command => "wget ${logstash::params::source}",
    path    => ['/usr/bin'],
    cwd     => $logstash::params::bin_dir,
    require => File[$logstash::params::bin_dir],
    creates => $logstash::params::bin_file,
  }

}
