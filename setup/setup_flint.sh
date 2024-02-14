MPFR_VERSION=4.2.1
GMP_VERSION=6.3.0
VERSION=3.0.1
export CC=gcc-12
export CXX=g++-12
export CFLAGS="-Wall -O3 -march=znver2"

WRKDIR=/home/docker/flintcxx/setup/work_flint
ARCHIVEDIR=/home/docker/flintcxx/archives/

rm -rf $WRKDIR
mkdir -p $WRKDIR
cd $WRKDIR
tar xvf $ARCHIVEDIR/flint-${VERSION}.tar.gz
cd flint-${VERSION}
./configure                                         \
    --enable-assert                                 \
    --enable-avx2                                   \
    --disable-static                                \
    --with-gmp-include=/home/docker/flintcxx/i/GMP-${GMP_VERSION}/include \
    --with-gmp-lib=/home/docker/flintcxx/i/GMP-${GMP_VERSION}/lib         \
    --with-mpfr=/home/docker/flintcxx/i/MPFR-${MPFR_VERSION}              \
    --prefix=/home/docker/flintcxx/i/FLINT-${VERSION}
make -j`nproc`
make check
make install
make examples
cd ..
rm -rf $WRKDIR
