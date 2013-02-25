class logstash {

  include logstash::params
  require java_service_wrapper

  case $::osfamily {
    'RedHat' : {
      require jpackage
    }
    'Debian' : {
      require apt

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
    $logstash::params::etc_dir: ensure => directory;
    $logstash::params::log_dir: ensure => directory;
    $logstash::params::run_dir: ensure => directory;
  }

  exec { 'get logstash jar file':
    command => "wget -O ${logstash::params::bin_file}  ${logstash::params::url}",
    path    => ['/usr/bin'],
    cwd     => $logstash::params::bin_dir,
  }

}
