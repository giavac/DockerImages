## Synopsis

Repository of Docker images that are useful for me.

## Motivation

As a developer I have to deal with lack of resources available. Docker comes to the rescue.
In order to not have to redo always the same I use this repository to store Dockerfiles and some other stuff that makes my life easier.

## Installation

*Yumrepo:*
Create a CentOS 6 repository for my own rpm packages. I also provide perl Dancer2 module already prepackaged (dependencies are packaged as independent RPMs) along with a "Hello, World!" example to test.

The installation is as easy as:
```bash
docker build --rm -t TEMPLATE_NAME .
docker run -d -P -v HOST_FOLDER:CONTAINER_FOLDER --name CONTAINER_NAME TEMPLATE_NAME
```

An easy way to copy files to the container is to share a folder between HOST and CONTAINER.
Then you can copy your RPM files into folder /var/www/html/puppetrepo/el-6.5
The cronjob to update the repository runs by default each 10 minutes.

## Contributors

Let people know how they can dive into the project, include important links to things like issue trackers, irc, twitter accounts if applicable.

## License

See LICENSE file