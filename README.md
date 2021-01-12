# Dynamic-to-static downloader (httrack Docker image)

![Build status](https://github.com/svenjambor/httrack-docker/workflows/Build/badge.svg)

Docker container running httrack to download dynamic website to blob storage. The idea is to use this container to download the contents of an infrequently changing dynamic site to Azure Blob storage; this blob is published as a static website. This reduces the attack surface of the site while still allowing the editor to use the dymica site's editing functions (Wordpress, Joomla, etc).

The container downloads the entire website at the address defined in environment variable "WEBSITE" and then copies that content to an Azure Blob container using azCopy. It logs on to this container using a SAS token provided in the URL you specify in the AZBLOBCONTAINERSAS variable.

## How to use




Set the following environmental variables when running the container:

- `WEBSITE` - Full URL (incl. http(s)://) of site to copy to blob container
- `AZBLOBCONTAINERSAS` - URL and SAS key of blob container to sync website contents into

This could definitely be made nicer by asking for containername and SAS key separately - so consider this a work in progress
