#! /bin/sh

. ../../testenv.sh

for f in repro1 repro2; do
  synth $f.v -e > syn_$f.vhdl
  analyze syn_$f.vhdl
done
clean

echo "Test successful"
