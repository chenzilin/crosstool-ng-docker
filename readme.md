Usage:

	1. First Enter Container
		sudo docker run -it crosstool-ng-docker:latest /bin/bash

	2. Enter Exited Container
		sudo docker ps -a
		sudo docker start -ia 57c5d096ec6b


Reference:

Create Image:

	cd crosstool-ng-docker/

	sudo docker build -t crosstool-ng-docker .

List Images:

	sudo docker images

Remeve Image:

	sudo docker rmi 7d9495d03763

	sudo docker image remove 7d9495d03763

Run Container:

	sudo docker run -it crosstool-ng-docker:latest /bin/bash

List Containers:

	sudo docker ps

	sudo docker ps -a

Remove Container:

	sudo docker rm d48b68282c03

Partition Tar:

	tar cvjfa - dl/ |split -b 85m - dl.tar.bz2.

	cat dl.tar.bz2.a* | tar xvj