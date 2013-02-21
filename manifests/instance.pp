define logstash::instance(
  $configuration,
  $logstash_user = 'root',
) {

  class {'logstash':
    logstash_user => $logstash_user,
    before        => Java_service_wrapper::Service[$name],
  }

  java_service_wrapper::service{$name:
    wrapper_mainclass   => 'WrapperJarApp',
    wrapper_additional  => ['-Xms256m', '-Xmx256m'],
    wrapper_library     => ['/usr/local/lib'],
    wrapper_classpath   => ['/usr/local/lib/wrapper.jar', '/usr/local/bin/logstash.jar'],
    wrapper_parameter   => ['/usr/local/bin/logstash.jar', 'agent', '-f', $configuration]
  }

}
