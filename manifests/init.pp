# Class: snmpd
# Edgar Magana (eperdomo@cisco.com)
# 
# This class installs snmpd
#
# Actions:
#   - Install the snmpd package
#
# Sample Usage:
#  class { 'snmpd': }
#
class snmpd {

  service { "snmpd":
	ensure  => "running",
	enable  => "true",
	require => Package["snmpd"],
}

  package { 'snmpd':
        ensure => installed,
  }
 
  file { "/etc/snmp/snmpd.conf":
        notify  => Service["snmpd"],
	ensure  => present,
        owner   => "root",
        group   => "root",
        mode    => 0600,
        source  => "puppet:///modules/snmpd/snmpd.conf",
	require => Package["snmpd"],
    }
}
