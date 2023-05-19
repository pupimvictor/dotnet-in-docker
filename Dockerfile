FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["src/myWebApp.csproj", "src/"]
RUN dotnet restore "src\myWebApp.csproj"
COPY . .

FROM build AS publish
RUN dotnet publish "src/myWebApp.csproj" -c Development -o /app/publish 

FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=publish /app/publish .
EXPOSE 5000 
ENTRYPOINT ["dotnet", "myWebApp.dll"]
