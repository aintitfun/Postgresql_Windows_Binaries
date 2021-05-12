#!/usr/bin/bash
rootdir=`pwd`
while read line; do
	case "$2" in
	    "")
		rm -rf ${line}
		rm -rf postgres_sources/${1}/postgres/contrib/${line}
		git clone git@github.com:aintitfun/${line}.git
		;;
	    "--no-download")
		;;
	esac
	mv ${line} postgres_sources/${1}/postgres/contrib
	cd postgres_sources/${1}/postgres/contrib/${line}
	make && make install
	cd $rootdir
done <list_of_extensions.txt

