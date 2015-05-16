echo "Installing keys for dropbear host"

RSAKEY="/etc/dropbear/rsa_host_key"
DSSKEY="/etc/dropbear/dss_host_key"

if [ ! -f $RSAKEY ]; then
	dropbearkey -t rsa -f $RSAKEY
fi

if [ ! -f $DSSKEY ]; then
	dropbearkey -t dss -f $DSSKEY
fi

echo '::respawn:/usr/sbin/dropbear -d /etc/dropbear/dss_host_key -r /etc/dropbear/rsa_host_key -F -s' >>/etc/inittab

