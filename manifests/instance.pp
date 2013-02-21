define logstash::instance(
  $configuration,
  $java_opts = '-Xms256m -Xmx256m',
) {

  require logstash

  java_service_wrapper::service{$name:
    wrapper_mainclass   => 'WrapperJarApp',
    wrapper_additional  => split($java_opts),
    wrapper_library     => ['/usr/local/lib'],
    wrapper_classpath   => ['/usr/local/lib/wrapper.jar', $logstash::params::bin_file],
    wrapper_parameter   => [$logstash::params::bin_file, 'agent', '-f', $configuration],
  }

}
