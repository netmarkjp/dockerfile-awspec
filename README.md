# dockerfile-awspec

# Usage

## run awspec

```bash
docker run --rm -v $(pwd):/mnt -w /mnt -u $(id -u):$(id -g) ghcr.io/netmarkjp/awspec awspec help
```

## run test

```bash
docker run --rm -v $(pwd):/mnt -w /mnt -u $(id -u):$(id -g) ghcr.io/netmarkjp/awspec rake
```