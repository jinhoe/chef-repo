# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'company_web'

# This lets you source cookbooks from your chef-repo.
default_source :chef_repo, '../'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'company_web::default'

# Specify a custom source for a single cookbook:
# cookbook 'example_cookbook', path: '../cookbooks/example_cookbook'
cookbook 'company_web', path: '../cookbooks/company_web'
cookbook 'myiis', path: '../cookbooks/myiis'
cookbook 'apache', path: '../cookbooks/apache'
