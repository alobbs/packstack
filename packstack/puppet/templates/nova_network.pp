
class {"nova::network":
    enabled => true,
    private_interface => '%(CONFIG_NOVA_NETWORK_PRIVIF)s',
    public_interface => '%(CONFIG_NOVA_NETWORK_PUBIF)s',
    fixed_range => '%(CONFIG_NOVA_NETWORK_FIXEDRANGE)s',
    floating_range => '%(CONFIG_NOVA_NETWORK_FLOATRANGE)s',
    config_overrides => {force_dhcp_release => false}
}

package { 'dnsmasq': ensure => present }
