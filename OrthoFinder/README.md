# OrhoFinder ...
https://github.com/davidemms/OrthoFinder

```bash
# Build container
sudo singularity build orthofinder OrthoFinder.def

# Add overlay...
singularity overlay create --size 1024 orthofinder


# to edit /opt/OrthoFinder_source/scripts_of/config.json
# copy prepared file, there are no editors in the container
singularity shell --writable orthofinder
```
