

class {"glance::api":
    auth_host => "%(CONFIG_KEYSTONE_HOST)s",
    keystone_tenant => "services",
    keystone_user => "glance",
    keystone_password => "glance_default_password",
    sql_connection => "mysql://glance:glance_default_password@%(CONFIG_MYSQL_HOST)s/glance"
}

class { 'glance::backend::file': }

class {"glance::registry":
    auth_host => "%(CONFIG_KEYSTONE_HOST)s",
    keystone_tenant => "services",
    keystone_user => "glance",
    keystone_password => "glance_default_password",
    sql_connection => "mysql://glance:glance_default_password@%(CONFIG_MYSQL_HOST)s/glance"
}

firewall { '001 glance incoming':
    proto    => 'tcp',
    dport    => ['9292'],
    action   => 'accept',
}

