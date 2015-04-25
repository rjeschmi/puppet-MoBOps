
class {'::postfix::server': 
	myhostname => 'keg.barleyment.ca',
	mydomain   => 'barleyment.ca',
    alias_maps => 'hash:/etc/aliases,hash:/var/lib/mailman/data/aliases',
    inet_interfaces => 'all',
    inet_protocols => 'ipv4',
    spamassassin => true,
    spampd_children       => '4',
    master_services       => [ '127.0.0.1:10027 inet n  -       n       -      20       smtpd'],
    smtp_content_filter   => ['smtp:127.0.0.1:10026'],
    mynetworks => "127.0.0.0/8 54.243.224.94",
}

class {'::mailman':
    default_url_host => 'lists.barleyment.ca',
    default_email_host => 'lists.barleyment.ca',
    mm_cfg_settings     => {
        'MTA' => "'Postfix'",
        'IMAGE_LOGOS' => "'/images/mailman/'",
        'SMTPPORT' => '10027',
    }
}

file { '/etc/apache2/conf.d/mailman.conf':
    content => template('MoB/mailman_apache.conf.erb'),
    notify => Service["apache2"],    
}

class { '::apache':
    mpm_module => 'prefork',
}

package { 'ntp':
    ensure => installed,
}
