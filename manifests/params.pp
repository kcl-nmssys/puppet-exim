class exim::params {
  case $facts['os']['family'] {
    'Debian': {
      $package_name         = 'exim4-daemon-heavy'
      $service_name         = 'exim4'
      $service_user         = 'Debian-exim'
      $service_group        = 'Debian-exim'
      $config_file          = '/etc/exim4/exim4.conf'
      $dkim_config_file     = '/etc/exim4/dkim.conf'
      $dkim_keys_path       = '/etc/exim4/dkim'
      $tls_certificate_path = '/etc/ssl/exim.pem'
      $tls_privatekey_path  = '/etc/ssl/exim.key'
      $ldap_ca_cert_file    = '/etc/ssl/certs/ca-certificates.crt'
    }
    'RedHat': {
      $package_name         = 'exim'
      $service_name         = 'exim'
      $service_user         = 'exim'
      $service_group        = 'exim'
      $config_file          = '/etc/exim/exim.conf'
      $dkim_config_file     = '/etc/exim/dkim.conf'
      $dkim_keys_path       = '/etc/exim/dkim'
      $tls_certificate_path = '/etc/pki/tls/certs/exim.pem'
      $tls_privatekey_path  = '/etc/pki/tls/private/exim.key'
      $ldap_ca_cert_file    = '/etc/pki/tls/certs/ca-bundle.trust.crt'
    }
    default: {
      fail('Sorry, your OS is not currently supported by this module.')
    }
  }
}
