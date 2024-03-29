﻿# lcol
Liquid collector projects, linux preferences and scripts and etc

# Deployment of the project

## General building and publishing 

You have to do it for the app via docker composer. It's described into docker-compose.yml
You can also run locally projects with upped mysql db, it has mapped ports to localhost.
```console
docker-compose up -d --build
docker-compose down
```

## To build and run only web asp.net app

```console
cd ./site/
docker build --pull -t site .
docker run --name lcol_site --rm -it -p 8080:80 site
```

## To build and run only db data postprocessor .net app
```console
cd ./postprocessor/
docker build --pull -t postprocessor .
docker run --name lcol_postprocessor --rm -it postprocessor
```

## To build and run only MySQL
```console
docker-compose -f mysql_only.yml run --service-ports db
```

## Usefull docker commands
```console
docker ps
docker images
docker logs lcol_site_1
docker logs lcol_postprocessor_1
docker exec -it lcol_site_1 /bin/bash
docker exec -it lcol_postprocessor_1 /bin/bash
docker exec -it lcol_db_run_509e60e0d455 /bin/bash
docker rmi $(docker images | grep "none" | awk '/ / { print $3 }')
```
## Usefull docker programms to install into container
```console
apt-get update
apt-get install dnsutils -y
apt-get install net-tools -y
apt-get install iputils-ping -y
```


# Use ASP.NET Core on Linux ARM32 with Docker

You can use ASP.NET Core and Docker together on [ARM32](https://en.wikipedia.org/wiki/ARM_architecture) devices, with [Docker for Raspberry Pi and ARM32 devices](https://docs.docker.com/install/linux/docker-ce/debian).

## Try a pre-built ASP.NET Core Docker Image

You can quickly run a container with a pre-built [sample ASP.NET Core Docker image](https://hub.docker.com/_/microsoft-dotnet-core-samples/), based on this [sample](Dockerfile).

Type the following command to run a sample with [Docker](https://www.docker.com/products/docker):

```console
docker run --rm -it -p 8000:80 mcr.microsoft.com/dotnet/core/samples:aspnetapp
```

After the application starts, navigate to `http://localhost:8000` in your web browser and/or to the IP address (example: http://192.168.1.18:8000) of your ARM32 device on your network.

## Building .NET Core Samples with Docker

You can build the same [.NET Core console samples](README.md) and [ASP.NET Core sample](../aspnetapp/README.md) on ARM devices as you can on other architectures. For example, the following instructions will work on an ARM32 device. The instructions assume that you are in the root of this repository.

```console
cd samples
cd aspnetapp
docker build --pull -t aspnetapp .
docker run --rm -it -p 8000:80 aspnetapp
```

Another option is to build ARM32 Docker images on an X64 machine. You can do by using the same pattern used in the [Dockerfile.debian-arm32-selfcontained](../dotnetapp/Dockerfile.debian-arm32-selfcontained) dockerfile. It uses a multi-arch tag for building with the SDK and then an ARM32-specific tag for creating a runtime image. The pattern of building for other architectures only works because the Dockerfile doesn't run code in the runtime image.

### Viewing the Site

After the application starts, visit the site one of two ways:

* From the web browser on the ARM32 device at `http://localhost:8000`
* From the web browser on another device on the same network on the ARM32 device IP on port 8000, similar to: `http://192.168.1.18:8000`

You must set the `ASPNETCORE_URLS` environment variable manually ([example usage](https://github.com/dotnet/dotnet-docker/blob/master/2.1/runtime-deps/stretch-slim/arm32v7/Dockerfile#L19)) if you build the sample locally (without Docker) and want to navigate to the site from another machine.

## Pushing the image to a Container Registry

Push the image to a container registry after building the image so that you can pull it from another ARM32 device. You can also build an ARM32 image on an X64 machine, push to a registry and then pull from an ARM32 device. Instructions are provided for pushing to both Azure Container Registry and DockerHub (you only need to choose one):

* [Push Docker Images to Azure Container Registry](push-image-to-acr.md)
* [Push Docker Images to DockerHub](push-image-to-dockerhub.md)

## More Samples

* [.NET Core Docker Samples](../README.md)
* [.NET Framework Docker Samples](https://github.com/microsoft/dotnet-framework-docker-samples/)


# ASP.NET Core Docker Sample

This [sample Dockerfile](Dockerfile) demonstrates how to use ASP.NET Core and Docker together. The sample works with both Linux and Windows containers and can also be used without Docker. There are also instructions that demonstrate how to push the sample to [Azure Container Registry](../dotnetapp/push-image-to-acr.md) and test it with [Azure Container Instance](deploy-container-to-aci.md). You can [configure ASP.NET Core to use HTTPS with Docker](aspnetcore-docker-https.md).

The sample builds the application in a container based on the larger [.NET Core SDK Docker image](https://hub.docker.com/_/microsoft-dotnet-core-sdk/). It builds the application and then copies the final build result into a Docker image based on the smaller [ASP.NET Core Docker Runtime image](https://hub.docker.com/_/microsoft-dotnet-core-aspnet/).

This sample requires [Docker 17.06](https://docs.docker.com/release-notes/docker-ce) or later of the [Docker client](https://www.docker.com/products/docker).

## Try a pre-built ASP.NET Core Docker Image

You can quickly run a container with a pre-built [sample ASP.NET Core Docker image](https://hub.docker.com/_/microsoft-dotnet-core-samples/), based on this [sample](Dockerfile).

Type the following command to run a sample with [Docker](https://www.docker.com/products/docker):

```console
docker run --name aspnetcore_sample --rm -it -p 8000:80 mcr.microsoft.com/dotnet/core/samples:aspnetapp
```

After the application starts, navigate to `http://localhost:8000` in your web browser. On Windows, you may need to navigate to the container via IP address. See [ASP.NET Core apps in Windows Containers](aspnetcore-docker-windows.md) for instructions on determining the IP address, using the value of `--name` that you used in `docker run`.

See [Hosting ASP.NET Core Images with Docker over HTTPS](aspnetcore-docker-https.md) to use HTTPS with this image.

## Getting the sample

The easiest way to get the sample is by cloning the samples repository with git, using the following instructions:

```console
git clone https://github.com/dotnet/dotnet-docker/
```

You can also [download the repository as a zip](https://github.com/dotnet/dotnet-docker/archive/master.zip).

## Build and run the sample with Docker

You can build and run the sample in Docker using the following commands. The instructions assume that you are in the root of the repository.

```console
cd samples
cd aspnetapp
docker build --pull -t aspnetapp .
docker run --name aspnetcore_sample --rm -it -p 8000:80 aspnetapp
```

You should see the following console output as the application starts.

```console
C:\git\dotnet-docker\samples\aspnetapp>docker run --name aspnetcore_sample --rm -it -p 8000:80 aspnetapp
Hosting environment: Production
Content root path: /app
Now listening on: http://[::]:80
Application started. Press Ctrl+C to shut down.
```

After the application starts, navigate to `http://localhost:8000` in your web browser. On Windows, you may need to navigate to the container via IP address. See [ASP.NET Core apps in Windows Containers](aspnetcore-docker-windows.md) for instructions on determining the IP address, using the value of `--name` that you used in `docker run`.

> Note: The `-p` argument maps port 8000 on your local machine to port 80 in the container (the form of the port mapping is `host:container`). See the [Docker run reference](https://docs.docker.com/engine/reference/commandline/run/) for more information on commandline parameters. In some cases, you might see an error because the host port you select is already in use. Choose a different port in that case.

## Additional Samples

Multiple variations of this sample have been provided, as follows. Some of these example Dockerfiles are demonstrated later. Specify an alternate Dockerfile via the `-f` argument.

* [Multi-arch sample](Dockerfile)
* [Nanoserver 1903 sample](Dockerfile.nanoserver-1903)
* [Alpine sample](Dockerfile.alpine-x64)

## Deploying with HTTPS

ASP.NET Core 2.1 and newer uses [HTTPS by default](https://docs.microsoft.com/en-us/aspnet/core/security/enforcing-ssl). You can [configure ASP.NET Core to use HTTPS with Docker](aspnetcore-docker-https.md).

## Build and run the sample for Alpine X64 with Docker

You can build and run the sample for Alpine using the following instructions. Make sure Docker is set to Linux containers if you are on Windows.

```console
cd samples
cd aspnetapp
docker build --pull -t aspnetapp -f Dockerfile.alpine-x64 .
docker run --name aspnetcore_sample --rm -it -p 8000:80 aspnetapp
```

After the application starts, navigate to `http://localhost:8000` in your web browser.

## Build and run the sample for Ubuntu 18.04 with Docker

You can also build for [Ubuntu 18.04](https://hub.docker.com/_/ubuntu/), with a `bionic` tag. The `bionic` tags are documented at [dotnet/core/sdk](https://hub.docker.com/_/microsoft-dotnet-core-sdk/) and [dotnet/core/aspnet](https://hub.docker.com/_/microsoft-dotnet-core-aspnet/). You would switch to use the `2.2-bionic` tag for both the build and runtime phases.

## Build and run the sample for Linux ARM32 with Docker

You can build and run the sample for ARM32 and Raspberry Pi with [Build ASP.NET Core Applications for Raspberry Pi with Docker](aspnetcore-docker-arm32.md) instructions.

## Develop ASP.NET Core Applications in a container

You can develop applications without a .NET Core installation on your machine with the [Develop ASP.NET Core applications in a container](aspnet-docker-dev-in-container.md) instructions. These instructions are also useful if your development and production environments do not match.

## Deploying to Production vs Development

The approach for running containers differs between development and production.

In production, you will typically start your container with `docker run -d`. This argument starts the container as a service, without any console interaction. You then interact with it through other Docker commands or APIs exposed by the containerized application.

In development, you will typically start containers with `docker run --rm -it`. These arguments enable you to see a console (important when there are errors), terminate the container with `CTRL-C` and cleans up all container resources when the container is terminated. You also typically don't mind blocking the console. This approach is demonstrated in prior examples in this document.

We recommend that you do not use `--rm` in production. It cleans up container resources, preventing you from collecting logs that may have been captured in a container that has either stopped or crashed.

## Build and run the sample locally

You can build and run the sample locally with the [.NET Core 2.2 SDK](https://www.microsoft.com/net/download/core) using the following commands. The commands assume that you are in the root of the repository.

```console
cd samples
cd aspnetapp
dotnet run
```

After the application starts, visit `http://localhost:5000` in your web browser.

You can produce an application that is ready to deploy to production locally using the following command.

```console
dotnet publish -c Release -o out
```

You can run the application using the following commands.

```console
cd out
dotnet aspnetapp.dll
```

Note: The `-c Release` argument builds the application in release mode (the default is debug mode). See the [dotnet publish reference](https://docs.microsoft.com/dotnet/core/tools/dotnet-publish) for more information on commandline parameters.

## .NET Core Resources

More Samples

* [.NET Core Docker Samples](../README.md)
* [.NET Framework Docker Samples](https://github.com/microsoft/dotnet-framework-docker/blob/master/samples/README.md)

Docs and More Information:

* [.NET Docs](https://docs.microsoft.com/dotnet/)
* [ASP.NET Docs](https://docs.microsoft.com/aspnet/)
* [dotnet/core](https://github.com/dotnet/core) for starting with .NET Core on GitHub.
* [dotnet/announcements](https://github.com/dotnet/announcements/issues) for .NET announcements.

## Related Docker Hub Repositories

.NET Core:

* [dotnet/core](https://hub.docker.com/_/microsoft-dotnet-core/): .NET Core
* [dotnet/core/samples](https://hub.docker.com/_/microsoft-dotnet-core-samples/): .NET Core Samples
* [dotnet/core-nightly](https://hub.docker.com/_/microsoft-dotnet-core-nightly/): .NET Core (Preview)

.NET Framework:

* [dotnet/framework](https://hub.docker.com/_/microsoft-dotnet-framework/): .NET Framework, ASP.NET and WCF
* [dotnet/framework/samples](https://hub.docker.com/_/microsoft-dotnet-framework-samples/): .NET Framework, ASP.NET and WCF Samples

