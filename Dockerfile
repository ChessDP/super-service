# use .NET SDK as base image
FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build

# set working directory
WORKDIR /app

# copy everything into the container
COPY . ./

# build the solution
RUN dotnet build

# run the tests
RUN dotnet test --no-build --verbosity normal