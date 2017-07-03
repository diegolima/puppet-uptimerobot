# Class: uptimerobot
# ===========================
#
# Full description of class uptimerobot here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'uptimerobot':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class uptimerobot {
  String $key          = $uptimerobot::params::key,
  String $format       = $uptimerobot::params::format,
  String $type         = $uptimerobot::params::type,
  String $url          = $uptimerobot::params::url,
  String $name         = $uptimerobot::params::name,
  String $alert        = $uptimerobot::params::alert,
  String $api          = $uptimerobot::params::api,
  String $lockfile     = $uptimerobot::params::lockfile,
  String $curl_package = $uptimerobot::params::curl_package,
  String $curl_opts    = "-X POST -H \"Cache-Control: no-cache\" -H \"Content-Type: application/x-www-form-urlencoded\" -d"
  String $curl_request = "api_key=$key&format=$format&type=$type&url=$url&friendly_name=$name&alert_contacts=$alert"

  package { "$curl_package":
    ensure => present,
  }
  exec { 'add into monitoring':
    require => Package['curl'],
    command => "/usr/bin/curl $curl_opts $curl_request $api",
    unless  => "/usr/bin/test -f $lockfile",
  }
}
