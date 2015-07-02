class student {
  # ILT training-specific setup
  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  file { '/usr/bin/envpuppet':
    source => 'puppet:///modules/bootstrap/envpuppet',
    mode   => '0755',
  }


  # Add a few extra packages for convenience
  package { [ 'patch', 'screen', 'telnet', 'tree', 'wget' ] :
    ensure  => present,
    require => Class['localrepo'],
  }


  # configure user environment
  include userprefs::defaults

  # create local repos
  include localrepo

  # Add helper scripts
  include student::scripts

  # Yum related config
  include student::repos

  # Clean up extranous build stuff
  include student::cleanup
}
