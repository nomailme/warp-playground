FROM microsoft/dotnet:2.2-sdk AS build-env
WORKDIR /app
ARG version=1.0.0
 

COPY WarpExample.sln ./
COPY ./src/ ./src
 
# restore for all projects
RUN dotnet restore WarpExample.sln
 

# build and publish

RUN dotnet publish src/WarpExample/WarpExample.csproj --framework netcoreapp2.2 -c Release -o /app/out/linux-x64 /p:Version=${version} -r linux-x64

# pack and squeeze

RUN curl -Lo warp-packer https://github.com/dgiagio/warp/releases/download/v0.3.0/linux-x64.warp-packer && chmod +x warp-packer

RUN chmod +x warp-packer

RUN ./warp-packer --arch linux-x64 --input_dir /app/out/linux-x64 --exec warp-example --output out/warp-example

