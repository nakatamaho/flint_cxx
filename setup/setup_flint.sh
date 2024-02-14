MPFR_VERSION=4.2.1
GMP_VERSION=6.3.0
VERSION=1.3.1
export CC=gcc-12
export CXX=g++-12
export CFLAGS="-Wall -O3 -march=zen2"

WRKDIR=/home/docker/flintcxx/setup/work_mpc
ARCHIVEDIR=/home/docker/flintcxx/archives/

rm -rf $WRKDIR
mkdir -p $WRKDIR
cd $WRKDIR
tar xvf $ARCHIVEDIR/mpc-${VERSION}.tar.gz
cd mpc-${VERSION}
./configure                                         \
    --enable-assert                                 \
    --enable-avx2                                   \
    --disable-static                                \
    --with-gmp-include=/home/docker/flintcxx/i/GMP-${GMP_VERSION}/include \
    --with-mpfr=/home/docker/flintcxx/i/MPFR-${MPFR_VERSION} \
    --prefix=/home/docker/flintcxx/i/FLINT-${VERSION}
make -j`nproc`
make check
make install
make examples
cd ..
rm -rf $WRKDIR
