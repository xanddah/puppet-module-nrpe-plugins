# puppet-module-nrpe-plugins
===

[![Build Status](https://travis-ci.org/anders-k-lindgren/puppet-module-nrpe-plugins.png?branch=master)](https://travis-ci.org/anders-k-lindgren/puppet-module-nrpe-plugins)

Distribute nrpe plugins

===

# Compatibility
---------------
This module is built for use with Puppet v3 and is tested on the following OS families.

* EL 6
* Suse 11
* Solaris 10

===

# Class `nrpe_plugins`

## Parameters

nrpe_package
------------
Name of package(s) for NRPE.

- *Default*: based on OS platform.

source
-----------
Directory in which the nrpe plugins are read.


- *Required*: 

destination
-----------
Directory in which nrpe plugins are stored.

- *Required*: 

nrpe_user
---------
This determines the effective user that the NRPE daemon should run as.

- *Default*: based on OS platform

nrpe_group
---------
This determines the effective group that the NRPE daemon should run as.

- *Default*: based on OS platform

force
-----
Boolean value to deside if the file operation should performed even if it will destroy one or more directories.

- *Default*: true

purge
-----
Boolean value to deside if unmanaged files should be purged. 

- *Default*: true

