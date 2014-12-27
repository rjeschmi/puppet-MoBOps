
class {'::postfix::server': 
	myhostname => 'keg.barleyment.ca',
	mydomain   => 'barleyment.ca',
}

class {'::mailman':
    default_url_host => 'lists.barleyment.ca',
    default_email_host => 'lists.barleyment.ca',
    mm_cfg_settings     => {
        'MTA' => "'Postfix'",
    }
}

file { '/etc/apache2/conf-enabled/mailman.conf':
    ensure => 'link',
    target => '/etc/mailman/apache.conf',
    notify => Service["apache2"],    
}

class { '::apache':
    mpm_module => 'prefork',
}

