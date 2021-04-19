mkdir -p postgres_sources/`echo -n $1`
cd postgres_sources/`echo -n $1`
rm -rf postgres
git clone https://github.com/postgres/postgres.git --branch REL_`echo -n $1`_STABLE --depth 1
cd postgres
./configure --prefix=`echo -n $HOME`/build_extensions/postgres_binaries/`echo -n $1` --with-openssl --with-includes=/usr/local/openssl64/include --with-libraries=/usr/local/openssl64/lib
make clean && make -j4 && make install
