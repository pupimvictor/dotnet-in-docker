build:
	 docker build --tag dotnet-docker .

run: 
	 docker run -p5000:80 --name dotnet-in-docker dotnet-docker
	
clean:
	set -e docker kill dotnet-in-docker
	docker rm dotnet-in-docker

restart: clean build run
	