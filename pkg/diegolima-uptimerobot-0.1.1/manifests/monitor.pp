class uptimerobot::monitor (
  String $key,
  String $url,
  String $friendlyname,
  String $alert,
  String $curl_request = "api_key=$key&format=$format&type=$type&url=$url&friendly_name=$friendlyname&alert_contacts=$alert",  
  String $curl_response = '\"stat\":\"ok\"'
) inherits uptimerobot {
  exec { 'add into monitoring':
    require => Package['curl'],
    command => "$curl $curl_opts \"$curl_request\" $api > $lockfile",
    unless  => "$grep $curl_response $lockfile",
  }
  exec { 'check operation status':
    require => Exec['add into monitoring'],
    command => "$grep $curl_response $lockfile",
  }
}
