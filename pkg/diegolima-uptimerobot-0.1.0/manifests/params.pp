class uptimerobot::params (
  String $api      = 'https://api.uptimerobot.com/v2/newMonitor',
  String $format   = 'json',
  String $lockfile = '/etc/uptimerobot.monitored',
  String $type     = '1',
  String $alert    = '',
) {
  case $::osfamily {
    default: {
      $curl_package = "curl"
    }
  }
}
