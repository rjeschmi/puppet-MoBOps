puppet-MoBOps
=============

There is a Rakefile in the main directory that describes the major tasks. Basically, we need
a way to install some modules so that I don't maintain old versions with the deployment.

Second, there is a task to apply the puppet configs.

```

# rake r10k_deploy

will deploy the modules required

# rake puppet_apply

will apply the config

```
