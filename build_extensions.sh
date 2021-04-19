rm -rf odbc_fdw
git clone git@github.com:aintitfun/odbc_fdw.git
cp build_extension.sh odbc_fdw/
cd odbc_fdw
sh build_extension.sh 12
