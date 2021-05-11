https://github.com/linzhi2013/MitoZ/blob/master/version_2.3/INSTALL.md

# docker pull 
singularity  pull docker://guanliangmeng/mitoz:2.3

# fixed singularity recipe
sudo singularity build MitoZ.sif Singularity.v2.3-pm |& tee log
