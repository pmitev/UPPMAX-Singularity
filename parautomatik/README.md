# parautomatik

https://github.com/peterbmob/parautomatik

## Clone repositories before building the image / private repositories
``` bash
git clone https://github.com/peterbmob/parautomatik.git
cd parautomatik/pgm         
git clone https://github.com/Teoroo-CMC/CCS
cd ../../
```
## Building the image
```bash
sudo singularity build parautomatik.sif Singularity.parautomatik
```

## Running

```bash
./parautomatik.sif

```

