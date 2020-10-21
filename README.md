# dockerfile-awspec

# Usage

## run awspec

```bash
docker run --rm -v $(pwd):/mnt -w /mnt -u $(id -u):$(id -g) ghcr.io/netmarkjp/awspec awspec help
```

## run test

```bash
docker run --rm -v $(pwd):/mnt -w /mnt -u $(id -u):$(id -g) ghcr.io/netmarkjp/awspec rake spec
```

Note:
If `id -u` returns 1000, you can `sudo` in container.


# Advanced Usage

## run test with credential and profile

1. edit `spec/spec_helper.rb` to load credential
    - from `Awsecrets.load(secrets_path: File.expand_path('./secrets.yml', File.dirname(__FILE__)))`
    - to `Awsecrets.load`
2. run test

```sh
docker run --rm -v $(pwd):/mnt -w /mnt -u $(id -u):$(id -g) \
    -e AWS_PROFILE=my-profile -v ${HOME:?}/.aws:/home/work/.aws:ro \
    ghcr.io/netmarkjp/awspec rake spec
```
