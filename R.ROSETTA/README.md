# R.ROSETTA

https://komorowskilab.github.io/R.ROSETTA/tutorials.html#installation

## Offline fixes
```bash
singularity shell rosetta.sif

# In the container run
Singularity> wine msiexec /i /opt/wine-mono-7.4.0-x86.msi
# wait untill it is stuck, CTRL_C
```

## to test
```bash
singularity shell rosetta.sif

# in the container
Singularity> R

...
> library(R.ROSETTA); rosetta(autcon)
```

## notes
```bash
sh -c wine /library/R.ROSETTA/exec/clrosetta.exe SerialExecutor "FILENAME.COMMANDS=/scratch/RtmpnrLBAU/Mar_02_2024_101101_RROS/results/data.csv/outPrep/data_toRosCmd.txt; FILENAME.LOG=/scratch/RtmpnrLBAU/Mar_02_2024_101101_RROS/results/data.csv/outPrep/log.txt" >/dev/null
```
