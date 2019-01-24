#!/bin/sh

if [[ $# != 1 ]]
then
  echo "run_sweep.sh KMER_LEN"
  exit
fi

k=$1
g=1000000

outdir="sweep.k$k"

mkdir -p $outdir

for p in 2 3 4 5 6 7 8 9 10
do
  for d in 0.00 0.10 0.20 0.30 0.40 0.50 0.60 0.70 0.80 0.90 1.00
  do
    for r in 0.00 .001 .010 .050 .100 .200 .300
    do
      echo "eval d=$d r=$r k=$k g=$g p=$p"
      ./simhisto.sh $g $d $r $k $p >& $outdir/sim-d${d}-r${r}-k${k}-g${g}-p${p}-out
    done
  done
done
