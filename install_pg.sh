mkdir -p postgres_sources/`echo -n $1`
cd postgres_sources/`echo -n $1`
rm -rf postgres
git clone https://github.com/postgres/postgres.git --branch REL_`echo -n $1`_STABLE --depth 1
cd postgres
CFLAGS="-D WINVER=0x0600 -D _WIN32_WINNT=0x0600" LIBS="-ladvapi32" ./configure --prefix=${HOME}/build_extensions/postgres_binaries/${1} --with-openssl --with-includes=/usr/local/openssl64/include --with-libraries=/usr/local/openssl64/lib
make clean && make -j4 && make install
