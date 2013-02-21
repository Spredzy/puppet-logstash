define logstash::instance(
  $configuration,
) {

  java_service_wrapper::service{'logstash-tomcat':
    wrapper_mainclass   => 'WrapperJarApp',
    wrapper_additional  => ['-Xms256m', '-Xmx256m'],
    wrapper_library     => ['/usr/local/lib'],
    wrapper_classpath   => ['/usr/local/lib/wrapper.jar', '/usr/local/bin/logstash.jar'],
    wrapper_parameter   => ['/usr/local/bin/logstash.jar', 'agent', '-f', $configuration]
  }

}
