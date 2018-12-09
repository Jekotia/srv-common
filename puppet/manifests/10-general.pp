host { "system":
	name		=> "$_NAME",
	ensure		=> "present",
	ip		=> "$_IP",
}

# Mounts
mount { "$_DISK_MNT":
	ensure		=> "mounted",
	atboot		=> "true",
	device		=> "PARTUUID=$_DISK_ID",
	fstype		=> "ext4",
	options		=> "defaults,noatime",
}

# Symlinks
file { "$_DATA":
	ensure		=> "link",
	target		=> "$_DISK_MNT$_DISK_PATH",
}
