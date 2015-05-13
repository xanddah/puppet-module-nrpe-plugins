# == Class: nrpe_plugins
#
# This module installs the nrpe_plugins_contrib via a package
#
#

class nrpe_plugins::contrib(
  $o5npc_pkg	='op5-nrpe-plugins-contrib',
  $o5npc_source	='hiera-defined',
  $o5npc_adminfile	='hiera-defined',  
  $o5npc_provider	='DEFAULT', ) { 

  case $::osfamily {
    'RedHat', 'Suse','Ubuntu','Debian': {
	package { $o5npc_pkg: 
		ensure => 'installed',
	}
    }
    'Solaris': {
	package { $o5npc_pkg: 
		ensure => 'installed',
		provider => $o5npc_provider,
		source    => $o5npc_source,
		adminfile => $o5npc_adminfile,
	}

    }
    default: {
      fail("nrpe_plugins::contrib supports osfamilies RedHat, Suse, Solaris and Debian (Ubuntu). Detected osfamily is <${::osfamily}>.")
    }

  }
}
