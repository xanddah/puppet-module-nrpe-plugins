# == Class: nrpe_plugins
#
# This module distribute all nrpe plugins from a directory
#
# === Parameters
#
# All parameters are described in the README file
#

class nrpe_plugins (
  $nrpe_plugins_ensure = 'present',
  $nrpe_package        = 'USE_DEFAULTS',
  $nrpe_user           = 'USE_DEFAULTS',
  $nrpe_group          = 'USE_DEFAULTS',
  $source              = undef,
  $destination         = undef,
  $purge               = true,
  $force               = true,
) {

  # OS platform defaults
  case $::osfamily {
    'RedHat': {
      $default_nrpe_package = 'nrpe'
      $default_nrpe_user    = 'nrpe'
      $default_nrpe_group   = 'nrpe'
    }
    'Suse': {
      $default_nrpe_package = 'nagios-nrpe'
      $default_nrpe_user    = 'nagios'
      $default_nrpe_group   = 'nagios'

    }
    'Solaris': {
      $default_nrpe_package = undef
      $default_nrpe_user    = 'nagios'
      $default_nrpe_group   = 'nagios'
    }
    'Debian': {
      $default_nrpe_package = 'nagios-nrpe-server'
      $default_nrpe_user    = 'nagios'
      $default_nrpe_group   = 'nagios'
    }
    default: {
      fail("nrpe_plugins supports osfamilies RedHat, Suse, Solaris and Debian (Ubuntu). Detected osfamily is <${::osfamily}>.")
    }
  }

  # Use defaults if a value was not specified in Hiera.
  if $nrpe_package == 'USE_DEFAULTS' {
    $nrpe_package_real = $default_nrpe_package
  } else {
    $nrpe_package_real = $nrpe_package
  }

  if $nrpe_user == 'USE_DEFAULTS' {
    $nrpe_user_real = $default_nrpe_user
  } else {
    $nrpe_user_real = $nrpe_user
  }

  if $nrpe_group == 'USE_DEFAULTS' {
    $nrpe_group_real = $default_nrpe_group
  } else {
    $nrpe_group_real = $nrpe_group
  }

  #--- Check parameters ---

  if $source != '' and $destination == '' {
    fail( 'source is set, destination is mandatory' )
  }

  # Validates $plugins_contrib_ensure
  case $nrpe_plugins_ensure {
    'file', 'present', 'absent': {
      # noop, these values are valid
    }
    default: {
      fail("Valid values for \$nrpe_plugins_ensure are \'absent\', \'file\', or \'present\'. Specified value is ${nrpe_plugins_ensure}")
    }
  }

  validate_absolute_path($destination)

  file { $destination :
    ensure  => $nrpe_plugins_ensure,
    source  => $source,
    recurse => true,
    purge   => $purge,
    force   => $force,
    owner   => $nrpe_user_real,
    group   => $nrpe_group_real,
    require => Package[$nrpe_package_real],
  }
}
