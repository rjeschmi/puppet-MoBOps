
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
