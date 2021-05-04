case "$2" in
    "")
	rm -rf odbc_fdw
	rm -rf postgres_sources/${1}/postgres/contrib/odbc_fdw
	git clone git@github.com:aintitfun/odbc_fdw.git
	;;
    "--no-download")
	;;
esac
mv odbc_fdw postgres_sources/${1}/postgres/contrib
cd postgres_sources/${1}/postgres/contrib/odbc_fdw
make && make install

