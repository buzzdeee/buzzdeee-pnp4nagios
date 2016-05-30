# == Class: pnp4nagios
#
# Full description of class pnp4nagios here.
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
#  class { 'pnp4nagios':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class pnp4nagios (
  $package_name = $::pnp4nagios::params::package_name,
  $package_ensure = $::pnp4nagios::params::package_ensure,
  $service_name = $::pnp4nagios::params::service_name,
  $service_ensure = $::pnp4nagios::params::service_ensure,
) inherits pnp4nagios::params {

  include pnp4nagios::install
  include pnp4nagios::config
  include pnp4nagios::service

}
