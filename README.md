# Httrack Docker image 
![Build status](https://github.com/svenjambor/httrack-docker/workflows/Build/badge.svg)

Docker container running httrack to download dynamic website to blob storage.

The container downloads the entire website at the address defined in environment variable "WEBSITE" and then copies that content to an Azure Blob container using azCopy. It logs on to this container using a SAS token provided in the URL you specify in the AZBLOBCONTAINERSAS variable.

##How to use
Set the following environmental variables when running the container:
- `AZBLOBCONTAINERSAS` - URL and SAS key of blob container to sync website contents into
- `ENV WEBSITE` - Full URL (incl. http(s)://) of site to copy to blob container
