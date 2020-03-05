class exim (
  String $package_name,
  String $service_name,
  String $service_user,
  String $service_group,
  String $config_file,
  String $primary_hostname                                   = $facts['fqdn'],
  Array[String] $relay_to_domains                            = [],
  Array[String] $relay_from_hosts                            = [],
  Boolean $av_scanner_enable                                 = false,
  String $av_scanner                                         = 'clamd:/tmp/clamd',
  Boolean $spamd_enable                                      = false,
  Enum['variant=rspamd', ''] $spamd_variant                  = '',
  Stdlib::Host $spamd_address                                = 'localhost',
  Integer $spamd_port                                        = 783,
  Boolean $tls_enabled                                       = true,
  String $tls_certificate_path,
  Optional[String] $tls_certificate_content                  = undef,
  String $tls_privatekey_path,
  Optional[String] $tls_privatekey_content                   = undef,
  Array[Integer] $daemon_smtp_ports                          = [25, 465, 587],
  String $qualify_domain                                     = $facts['domain'],
  String $qualify_recipient                                  = $qualify_domain,
  Boolean $allow_domain_literals                             = false,
  Array[String] $never_users                                 = ['root'],
  Array[String] $host_lookup                                 = ['*'],
  Boolean $rfc1413_enable                                    = false,
  Array[String] $rfc1413_hosts                               = ['*'],
  Exim::Time $rfc1413_query_timeout                          = '5s',
  Boolean $prdr_enable                                       = true,
  Array[String] $sender_unqualified_hosts                    = [],
  Array[String] $recipient_unqualified_hosts                 = [],
  String $log_selector                                       = '+smtp_protocol_error +smtp_syntax_error +tls_certificate_verified',
  Exim::Time $ignore_bounce_errors_after                     = '2d',
  Exim::Time $timeout_frozen_after                           = '7d',
  Boolean $split_spool_directory                             = true,
  Boolean $check_rfc2047_length                              = false,
  Boolean $accept_8bitmime                                   = false,
  String $keep_environment                                   = '^LDAP',
  String $add_environment                                    = 'PATH=/usr/bin::/bin',
  Boolean $domain_literal_enable                             = false,
  Boolean $smarthost_enable                                  = false,
  Optional[Stdlib::Host] $smarthost                          = undef,
  String $retries                                            = 'F,2h,15m; G,16h,1h,1.5; F,4d,6h',
  Array[String] $rewrites                                    = [],
  Boolean $auth_ldap_enable                                  = false,
  Optional[String] $ldap_hostname                            = undef,
  Integer $ldap_port                                         = 636,
  Enum['demand', 'allow', 'try', 'never'] $ldap_require_cert = 'demand',
  String $ldap_ca_cert_file,
  Optional[String] $ldap_base_dn                             = undef,
  Optional[String] $ldap_bind_dn                             = undef,
  Optional[String] $ldap_passwd                              = undef,
  String $ldap_user_attrib                                   = 'sAMAccountName',
  Optional[String] $ldap_filter                              = '(objectClass=user)',
) {

  contain ::exim::install
  contain ::exim::config

  Class['::exim::install']
  -> Class['::exim::config']
}
