case "$1" in
    "")
	rm -rf openssl
	git clone https://github.com/openssl/openssl.git --branch OpenSSL_1_1_1-stable --depth 1
	;;
    "--no-download")
	;;
esac
rootdir=`pwd`/openssl_binaries
cd openssl
rm -rf test/*
./Configure --cross-compile-prefix=x86_64-w64-mingw32- mingw64 --prefix=$rootdir no-idea no-mdc2 no-rc5 shared
make clean && make -j4 install_dev
cp -r $rootdir/lib/* /usr/x86_64-w64-mingw32/lib/
cp -r include/openssl /usr/x86_64-w64-mingw32/include/
