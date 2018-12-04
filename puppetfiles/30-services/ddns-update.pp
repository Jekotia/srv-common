cron { "ddns-update":
	ensure		=> "present",
	command		=> "$_SCRIPT_DDNS > /dev/null 2>&1",
	user		=> "root",
	minute		=> "*/5",
	hour		=> "absent",
	monthday	=> "absent",
	month		=> "absent",
	weekday		=> "absent",
	special		=> "absent",
}
