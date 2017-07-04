class uptimerobot::params (
  String $api      = 'https://api.uptimerobot.com/v2/newMonitor',
  String $format   = 'json',
  String $lockfile = '/etc/uptimerobot.monitored',
  String $type     = '1',
  String $alert    = '',
) {
  case $::osfamily {
    'Debian': {
      $curl_package = "curl"
      $grep = "/bin/grep"
      $curl = "/usr/bin/curl"
    }
    default: {
      $curl_package = "curl"
      $grep = "/usr/bin/grep"
      $curl = "/usr/bin/curl"
    }
  }
}
