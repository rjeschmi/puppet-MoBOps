
class {'::postfix::server': 
	myhostname => 'keg.barleyment.ca',
	mydomain   => 'barleyment.ca',
}

class {'::mailman':
    default_url_host => 'lists.barleyment.ca',
    default_email_host => 'lists.barleyment.ca',
    mm_cfg_settings     => {
        'MTA' => "'Postfix'",
        'IMAGE_LOGOS' => "'/images/mailman/'",
    }
}

file { '/etc/apache2/conf.d/mailman.conf':
    content => template('MoB/mailman_apache.conf.erb'),
    notify => Service["apache2"],    
}

class { '::apache':
    mpm_module => 'prefork',
}

