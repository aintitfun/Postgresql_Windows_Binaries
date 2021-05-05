mkdir -p postgres_sources/${1}
cd postgres_sources/${1}
case "$2" in
    "")
	rm -rf postgres
	git clone https://github.com/postgres/postgres.git --branch REL_${1}_STABLE --depth 1
	;;
    "--no-download")
	;;
esac
case "$3" in
    "--with-debug")
	debug_string="CFLAGS=-O0 --enable-debug"
	;;
    "")
	debug_string=
        ;;
esac
rootdir=`pwd`/openssl_binaries
cd postgres
#this is to use a precompiled linux zic for make install on crosscompile
#sed -i 's/ZIC= .\/zic/ZIC= \/home\/papa\/Postgresql_Windows_Binaries\/zic/g' src/timezone/Makefile
#sed -i '1s/^/ZIC= \/home\/papa\/Postgresql_Windows_Binaries\/zic/g' / src/timezone/Makefile
sudo mv /usr/sbin/zic /usr/sbin/zic_
export ZIC=/home/papa/Postgresql_Windows_Binaries/zic
CFLAGS="-D WINVER=0x0600 -D _WIN32_WINNT=0x0600" LIBS="-ladvapi32" ./configure --prefix=${HOME}/Postgresql_Windows_Binaries/postgres_binaries/${1} --host=x86_64-w64-mingw32 --with-openssl --with-includes=$rootdir/include --with-libraries=$rootdir/lib $debug_string
make clean && make  && make install
sudo mv /usr/sbin/zic_ /usr/sbin/zic

