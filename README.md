# encore-go
An image based on Go official image [Go 1.19.5 official image](https://hub.docker.com/_/golang) packaged with [Encore.dev](https://encore.dev) framework binaries.

For more details, check it on [Docker Hub](https://hub.docker.com/repository/docker/fibrasek/encore-go).

# Usage
Run to pull the image from Docker Hub
```shell
$ docker pull fibrasek/encore-go:0.1
```

Or you can clone this repository and build it locally:
```shell
$ git clone git@github.com:Fibrasek/encore-go.git
$ cd encore-go
$ docker build -t <name>:<tag> .
```

And then to test it, run:
```
$ docker run fibrasek/encore-go:0.1 encore version

# or if you build it locally, use the name that you chose
$ docker run <name>:<tag> encore version

# it should output the result of the command `encore version` (at the time this was written, v1.13.2)
encore version v1.13.2
```

In those examples, you can test with any command from [Encore.dev](https://encore.dev) CLI.

# Use case
I wrote this to use in some pipelines I have in a Bitbucket repo, but it could be easily used in Github Actions too. For instance, here's an example of how easily I can run the tests of my project in my pipelines:
```yaml
image: fibrasek/encore-go:0.1

pipelines:
  default:
    - step:
        name: Test
        script:
          - encore auth login --auth-key=$ENCORE_AUTH_KEY
          - encore test ./...
```

That's it, be creative :)

# Contributing

Feel free to open an issue or pull request with any bugs, or improvements as you find :)
