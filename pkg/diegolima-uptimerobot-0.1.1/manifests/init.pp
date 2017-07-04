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
#      key          => 'abcd1234',
#      url          => 'https://example.com',
#      friendlyname => 'Example.com Website',
#      alert        => '12345678',
#    }
#
# Authors
# -------
#
# Diego Lima <diego@diegolima.org>
#
# Copyright
# ---------
#
# Copyright 2017 Diego Alencar Alves de Lima 
#
class uptimerobot (
  String $format       = $uptimerobot::params::format,
  String $type         = $uptimerobot::params::type,
  String $api          = $uptimerobot::params::api,
  String $lockfile     = $uptimerobot::params::lockfile,
  String $curl_package = $uptimerobot::params::curl_package,
  String $curl_opts    = "-X POST -H \"Cache-Control: no-cache\" -H \"Content-Type: application/x-www-form-urlencoded\" -d",
) inherits uptimerobot::params {
  package { "$curl_package":
    ensure => present,
  }
}
