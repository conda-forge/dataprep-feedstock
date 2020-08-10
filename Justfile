conda-shell:
  docker run -it --rm \
  -v $PWD/recipe:/home/conda/recipe_root:rw,z -v $PWD:/home/conda/feedstock_root:rw,z \
  --env CONFIG=linux_ --env HOST_USER_ID=1015 \
  condaforge/linux-anvil-comp7 \
  bash

build:
  python build-locally.py

install-conda:
  docker run -it --rm condaforge/linux-anvil-comp7 bash -c "conda install -y -c conda-forge dataprep"

skeleton:
  docker run -it --rm \
  condaforge/linux-anvil-comp7 \
  bash -c "conda skeleton pypi dataprep && cat dataprep/meta.yaml"