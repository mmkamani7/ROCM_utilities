# rocm-utils
Utilities that can help running ML codes on AMD GPUs with ROCM

## Dockerfile
The provided Dockerfile will help create custom docker image from the original rocm/pytorch, while having access to all GPUs with the same permissions as the main user.

## Scripts
To install scripts do this:

```cli
chmod +x install.sh
./install.sh
```

The you can run the following commands:

- `rocm-usage`: That will display which process ids and users are currently running on what GPU
- `rocm-drun`: An alias for `docker run` with some optional instructions to load all necessary GPUs, as well as volumes from the main env.

### rocm-drun
To use this script follow this instruction:
```cli
rocm-drun -n <your_container_name> -i <image_name> --amd 0,1,2,3
```
where `--amd` tag indicates which GPUs to use. If this is not passed, all the GPUs will be used.

