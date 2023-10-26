# Buiding the container via docker

```bash
## Build the docker
docker build -t bio .

## Convert/build the Singularity container
```bash
sudo singularity build BioTools-from-docker.sif BioTools-from-docker.def
```

## Create links for the installed tools
```bash
# Navigate to the folder where the bin folder with tools will be created
# Avoid soft links in the folder location !!!
cd folder

# Run the script
singularity exec BioTools-from-docker.sif /opt/make_links.sh
```

## Check tool versions
```bash
singularity exec BioTools-from-docker.sif /opt/package-versions.sh
```
