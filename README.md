# apt-cache

1.Build the image using this command:
	docker build -t apt-cacher-ng

2.run it, binding the exposed port:
      docker run -d -p 3142:3142 --name apt-cacher apt-cacher-ng

3.to see the logs:
     docker logs -f apt-cacher


4.Using the apt-cacher while building your Dockerfiles
So we have set up an apt-cacher. We now have to use it in our Dockerfiles:

   FROM debian
   RUN echo 'Acquire::http { Proxy "http://<host's-docker0-ip-here>:3142"; };' >> /etc/apt/apt.conf.d/01proxy

