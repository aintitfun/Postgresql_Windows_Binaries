export PATH=$PATH:`echo -n $HOME`/build_extensions/postgres_binaries/`echo -n $1`/bin
cp -R ${1}_related/* .
make && make install
mkdir -p temp_zip/bin/
mkdir -p temp_zip/lib/
mkdir -p temp_zip/share/extension/
cp ${HOME}/build_extensions/postgres_binaries/${1}/bin/${PWD##*/}* temp_zip/bin
cp ${HOME}/build_extensions/postgres_binaries/${1}/lib/${PWD##*/}* temp_zip/lib
cp ${HOME}/build_extensions/postgres_binaries/${1}/share/extension/${PWD##*/}* temp_zip/share/extension

zip -r ${PWD##*/}.zip temp_zip/*
#git checkout HEAD~1 -- .
