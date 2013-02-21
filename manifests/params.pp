class logstash::params {

  $version = '1.1.9'
  $bin_dir = '/usr/local/bin'
  $etc_dir = '/etc/logstash'
  $log_dir = '/var/log/logstash'
  $run_dir = '/var/run/logstash'
  $jar_file = "logstash-${version}-monolithic.jar"
  $bin_file = "${bin_dir}/${jar_file}"
  $url = "https://logstash.objects.dreamhost.com/release/${jar_file}"

  case $::osfamily {
    'RedHat' : {
      $jdk = 'java-1.7.0-openjdk'
    }
    'Debian' : {
      $jdk = 'openjdk-7-jdk'
    }
    default : {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only support osfamily RedHat Debian")
    }
  }

}
