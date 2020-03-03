class exim::install {
  package {
    $exim::package_name:
      ensure => 'present';
  }
}
