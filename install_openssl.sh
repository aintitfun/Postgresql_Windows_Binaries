git clone https://github.com/openssl/openssl.git --branch OpenSSL_1_1_1-stable --depth 1
cd openssl
rm -rf test/*
./Configure --prefix=/usr/local/openssl64 no-idea no-mdc2 no-rc5 shared mingw64
make clean && make -j4 install_dev
