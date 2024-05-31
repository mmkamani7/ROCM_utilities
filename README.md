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
- `drun`: An alias for `docker run` with some optional instructions to load all necessary GPUs, as well as volumes from the main env.

