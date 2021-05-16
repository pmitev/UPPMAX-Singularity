#!/bin/bash
params=$@
singularity exec  ./MitoZ.v2.3.sif \
  /bin/bash -c "source /app/anaconda/etc/profile.d/conda.sh; conda activate mitozEnv; exec /app/release_MitoZ_v2.3/MitoZ.py $params"
