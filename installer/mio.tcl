package require twapi_service

set services_all [lindex [twapi::get_multiple_service_status] 1]
foreach one $services_all  {
	puts [lindex $one 9]
#	catch {
		set command [twapi::get_service_configuration [ twapi::get_service_internal_name [lindex $one 9 ] ] -command ]
		if { [ string first $command "pg_ctl" ] > 0 } {
			set parameters [string split $command "-"]
			lappend [lsearch -inline [string split $command "-"] D*] rdbms_paths
		}
#	}
}