<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [Azure](#azure)
- [Chef](#chef)
- [AWS DNS entries (production console)](#aws-dns-entries-production-console)
- [Fastly](#fastly)
- [gitlab-ci.yml config in www-gitlab-com](#gitlab-ciyml-config-in-www-gitlab-com)

<!-- markdown-toc end -->


# Azure #

Terraform code for Azure infra is deprecated and no longer maintained, it hasn't been used in a long time so any changes should be made manually through the WebUI

```
$ dig +short about.gitlab.com
151.101.130.49
151.101.2.49
151.101.66.49
151.101.194.49
$ whois 151.11.130.49  # Fastly
$ dig +short about-src.gitlab.com
40.79.82.214
$ whois 40.79.82.214  # Azure
$ ssh about-src.gitlab.com # ssh keys are put there by Chef

```

Ubuntu 14.04


# Chef #


```
$ knife node show about.gitlab.com
Node Name:   about.gitlab.com
Environment: _default
FQDN:        about.gitlab.com
IP:          40.79.82.214
Run List:    role[base-debian], role[about-gitlab-com]
Roles:       base-debian, base-debian-no-chef-client, base, syslog-client, gitlab-security, about-gitlab-com
Recipes:     gitlab-server::ohai-plugin-path, gitlab-server::packages, gitlab-server::timezone-utc, gitlab-server::disable_history, gitlab-server::cron-check-authorized_keys2, gitlab-server::aws-get-public-ip, gitlab-server::get-public-ip, apt::unattended-upgrades, gitlab-server::locale-en-utf8, gitlab-server::ntp-client, gitlab-server::screenrc, gitlab-server::updatedb, gitlab_users::default, gitlab_sudo::default, gitlab-openssh, gitlab-openssh::default, chef_client_updater, chef_client_updater::default, chef-client, chef-client::default, gitlab-exporters::node_exporter, gitlab-server::rsyslog_client, postfix::_common, postfix::aliases, gitlab-server::debian-editor-vim, gitlab-server::dpkg-defaults, gitlab-iptables, gitlab-iptables::default, gitlab-security::rkhunter, gitlab-security::auditd, cookbook-about-gitlab-com::default, apt::default, gitlab-server::timesync, sudo::default, openssh::default, chef-client::service, chef-client::init_service, gitlab-exporters::default, gitlab-exporters::chef_client, ark::default, runit::default, postfix::_attributes, iptables-ng::install, iptables-ng::manage, cookbook-about-gitlab-com::runner, cookbook-about-gitlab-com::nginx, gitlab-vault::default, chef-vault::default
Platform:    ubuntu 14.04
Tags:
```

relevant bits of config:
- node-exporter (there are no other exporters, we do not ship logs anywhere)
- secrets in gitlab-vault (tls certs)
- nginx
- `about-src.gitlab.com` nginx config, contains config for review apps (which use `<branch_name>.about-src.gitlab.com`) as well as for `about.gitlab.com` and redirects within `about.gitlab.com`
- `redirects` nginx config, it redirects four old links, almost never changes
- gitlab-runner (only installs the package, gitlab-runner config or gitlab-runner register command are not managed with Chef!)
- cron to prune review apps

# AWS DNS entries (production console) #

about-src.gitlab.com - vm in Azure

about.gitlab.com - fastly
4 A records
4 AAAA records
1 global-sign-domain


# Fastly #

config is managed through the WebUI

about.gitlab.com backend:
```
40.79.82.214 : 443
addr 40.79.82.214

Enable TLS?
    Yes 
Verify certificate?
    Yes 
Certificate hostname
    about-src.gitlab.com 
SNI hostname
    about-src.gitlab.com 
Maximum connections
    200 
Connections (ms)
    1000 
First byte (ms)
    15000 
Between bytes (ms)
    10000 

```

# gitlab-ci.yml config in www-gitlab-com #

[url](https://gitlab.com/gitlab-com/www-gitlab-com/blob/master/.gitlab-ci.yml)

most jobs use runners with `gitlab-org` tag (general purpose docker runners)

there are three deploy jobs: deploy review apps (only merge requests), stop deploying review apps (manual), deploy the prod version of the website (only master). All three use the runner on about-src.gitlab.com, it's a shell runner. All three deploy websites content by rsyncing artifacts generated using MiddleMan in previous jobs

