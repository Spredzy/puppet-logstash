# Logstash Module

This module manages Logstash and daemonizes it with java-service-wrapper

# About

## Logstash (Class)

This class installs the Logstash dependencies (atm. java-service-wrapper), it needs to be required by the instances

## Instance (Define)

This is the actual Logstash instance you will configure

# Usage

    logstash::instance {'instance1' :
      configuration_file => '/etc/logstash/instance1.conf',
    }

# Note

Components traditionnaly used with Logstash (ie. ElasticSearch, Redis, etc...) needs to be installed on their own

