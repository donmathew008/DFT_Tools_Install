#!/bin/sh
  for i in `seq -w 10.00 1.00 15.00`
 do

  sed -e "s/LATT/$i/g" gold.fdf >\ Au.$i.fdf
 siesta < Au.$i.fdf | tee Au.$i.out
done
grep "Total =" *.out | tee energy.dat
