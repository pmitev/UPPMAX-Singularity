# parautomatik

https://github.com/peterbmob/parautomatik

## Clone repositories before building the image / private repositories
``` bash
git clone git@github.com:peterbmob/parautomatik.git
cd parautomatik/pgm         
git clone https://github.com/Teoroo-CMC/CCS
cd ../../
```
## Building the image
```bash
sudo singularity build parautomatik.sif Singularity.parautomatik |& tee build.log
```

## Running

```bash
./parautomatik.sif
Singularity> conda activate parautomatik
(parautomatik) Singularity> 

# follow the instructions from the documetation
```

