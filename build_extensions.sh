rm -rf odbc_fdw
git clone git@github.com:aintitfun/odbc_fdw.git
cp -R odbc_fdw/ postgres_sources/${1}/postgres/contrib
cd postgres_sources/${1}/postgres/contrib/odbc_fdw
make

