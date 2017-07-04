# uptimerobot

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with uptimerobot](#setup)
    * [What uptimerobot affects](#what-uptimerobot-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with uptimerobot](#beginning-with-uptimerobot)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module aims to make it easy to monitor servers using uptimerobot's service.
Currently its tested on both Ubuntu 14.04+ and Centos 6+, but should work on any
system that has curl available.

## Module Description

This module uses UptimeRobot's REST API to manage monitored servers. Currently
it only allows adding servers into the monitoring service. New servers should
appear as monitored on the dashboard.


## Setup

### What uptimerobot affects

* Installs the "curl" package on the monitored server, along with any dependencies.
* Creates the file /etc/uptimerobot.monitored containing the API's response.

### Setup Requirements

This module expects that a package named "curl" exists in your distribution.
If curl is available from any other source it should be perfectly usable but
changes to the module might be necessary.

### Beginning with uptimerobot

Install the module by placing it on your modules directory (tipically
/etc/puppetlabs/code/environments/production/modules) or by using:

```
puppet module install diegolima-uptimerobot
```

## Usage

To simply add the server into monitoring you can add the following class to your
manifest:

```
class { 'uptimerobot::monitor':
  key          => 'your-api-key-here',
  url          => 'https://www.diegolima.org',
  friendlyname => 'Diegolima.org',
  alert        => 'id-of-users-that-should-receive-alerts,separated-by-commas',
}
```



## Reference

You can set up defaults using the uptimerobot::params class, though the included
ones should be sensible enough for most users:

```
class { 'uptimerobot::params':
  api      => 'https://api.uptimerobot.com/v2/newMonitor',
  format   => 'json',
  lockfile => '/etc/uptimerobot.monitored',
  type     => '1',
  alert    => '',
}
```

## Limitations

Due to the way the module currently works your system must have a package
called "curl" even if curl is provided from somewhere else.

## Development

Feel free to fork this module and send pull requests with any changes/improvements
you make!
