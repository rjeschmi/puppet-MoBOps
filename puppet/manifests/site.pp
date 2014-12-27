
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
