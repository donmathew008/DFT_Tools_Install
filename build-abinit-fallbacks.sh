#!/bin/bash

# Init
Fallbacks="bigdft atompaw wannier90 libpsml xmlf90 libxc hdf5 netcdf4 netcdf4_fortran"

Disabled="--disable-bigdft --disable-atompaw --disable-libpsml --disable-xmlf90 --disable-libxc --disable-hdf5 --disable-netcdf4 --disable-netcdf4_fortran"

Optional_fbks="--disable-bigdft --disable-atompaw --disable-libpsml --disable-xmlf90"

if [[ -z $1 ]]; then
   Disabled=$Optional_fbks
fi

while [[ "$#" -gt 0 ]]; do
   if [ ! "`echo -n $Fallbacks | grep -Fo ${1}`" ]; then
       echo "Unknown parameter: $1";
       exit 1
   fi
   Disabled=`echo $Disabled | sed "s/--disable-${1}//"`
   shift
done

# Init
fallbacks_prefix="/home/vincent/INSTALL/abinit-10.0.7/build/fallbacks/install_fb/gnu/11.4"

# Find and Unpack tarball
tarfile=`basename $(ls /home/vincent/INSTALL/abinit-10.0.7/build/../fallbacks/*.tar.gz)`
source=${tarfile%.tar.gz}

mkdir -p $source && tar -xzf /home/vincent/INSTALL/abinit-10.0.7/build/../fallbacks/$tarfile -C $source --strip-components=1
cd $source

# Configure
./configure \
  --prefix="${fallbacks_prefix}" \
  --with-tardir="${HOME}/.abinit/tarballs" \
  --with-linalg-incs=" " \
  --with-linalg-libs="-L/usr/lib/x86_64-linux-gnu -llapack -lblas -lscalapack-openmpi" \
  --with-libxc-incs="-I/opt/etsf/include" \
  --with-libxc-libs="-L/opt/etsf/lib -lxcf90 -lxc -lm" \
  --with-fc-vendor="gnu" \
  --with-fc-version="11.4" \
  `echo $Disabled` \
  LIBS_NETCDF4_FORTRAN="-ldl -lm -lz" \
  CC="mpicc" \
  CXX="mpic++" \
  FC="mpif90" \
  

make -j 4 install
rc=`echo $?`

if test "$rc" = "0"; then
  printf "$(tput bold)----------------------------------------------------------------------$(tput sgr0)\n\n"
  echo "The fallbacks are now ready to use."; \
  echo "You can link these fallbacks with Abinit by copying the following options to your ac9 file.";

  list_of_fbks=( libxc hdf5 netcdf4 netcdf4_fortran linalg xmlf90 libpsml wannier90 )
  for i in "${list_of_fbks[@]}"; do
    if test "`${fallbacks_prefix}/bin/abinit-fallbacks-config --enabled ${i}`" = "yes"; then
      Prefix=`${fallbacks_prefix}/bin/abinit-fallbacks-config --libs ${i}`
      printf "\n$(tput bold)"
      echo "with_${i}=${Prefix}" | sed '-e s/-L//;  s/\/lib //; s/netcdf4/netcdf/; s/-l.*$//'
      printf "$(tput sgr0)"
    fi
  done
  printf "\n"
else
  printf "We have detected a problem while generating fallbacks : contact Abinit's team\n"
fi

exit
