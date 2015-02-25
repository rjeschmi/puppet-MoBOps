
confdir = Dir.pwd
moduledir = "#{confdir}/puppet/modules"
puppetfile = "#{confdir}/puppet/Puppetfile"

task :r10k_deploy do
    unless system ("PUPPETFILE=#{puppetfile} PUPPETFILE_DIR=#{moduledir} r10k puppetfile install")
        abort 'failed to install from puppetfile'
    end

end

task :puppet_apply do
    system ("puppet apply --modulepath=#{moduledir} #{confdir}/puppet/manifests/site.pp")
end

task :migrate_lists do
    [ 'data', 'archives', 'lists' ].each { |dir|
        system ("rm -rf /var/lib/mailman#{dir}")
        system ("ssh root@carboy.barleyment.ca tar czf - -C /var/lib/mailman #{dir} | tar xvzf - -C //var/lib/mailman") 
        system ("chown -R list.list /var/lib/mailman/lists" )
    }

end

