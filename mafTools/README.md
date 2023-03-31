To cretae soft links pointing to the container run

```bash
for i in $(singularity exec mafTools.sif ls -1 /opt/mafTools/bin); do  ln -s mafTools.sif $i; done
```

or

```bash
echo $(singularity exec mafTools.sif ls -1 /opt/mafTools/bin) | xargs -n 1 ln -s mafTools.sif
```

or

```bash
$ parallel --dry-run ln -s mafTools.sif {} ::: $(singularity exec mafTools.sif ls -1 /opt/mafTools/bin)

ln -s mafTools.sif mafComparator
ln -s mafTools.sif mafCoverage
ln -s mafTools.sif mafDuplicateFilter
ln -s mafTools.sif mafExtractor
ln -s mafTools.sif mafFilter
ln -s mafTools.sif mafPairCounter
ln -s mafTools.sif mafPairCoverage
ln -s mafTools.sif mafPositionFinder
ln -s mafTools.sif mafRowOrderer
ln -s mafTools.sif mafSorter
ln -s mafTools.sif mafStats
ln -s mafTools.sif mafStrander
ln -s mafTools.sif mafToFastaStitcher
ln -s mafTools.sif mafTransitiveClosure
ln -s mafTools.sif mafValidator.py
```
