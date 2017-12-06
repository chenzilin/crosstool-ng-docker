Usage:

	1. First Enter Container
		sudo docker run -it --name crosstool-ng-docker crosstool-ng-docker:latest /bin/bash

	2. Enter Exited Container
		sudo docker ps -a
		sudo docker start -ia 57c5d096ec6b


Operations:

	$ ct-ng help
	$ ct-ng list-samples
	$ ct-ng show-arm-imx6-linux-musleabihf
	$ ct-ng arm-imx6-linux-musleabihf	# based on arm-cortexa9_neon-linux-gnueabihf
	$ ct-ng menuconfig
	$ ct-ng savedefconfig
	$ cp defconfig samples/arm-imx6-linux-musleabihf/crosstool.config
	$ ct-ng build

	sudo docker cp dfee5cb1e2fc:/home/chenzilin/crosstool-ng/dl ./
	sudo chown -R chenzilin:chenzilin dl
	sudo docker cp dfee5cb1e2fc:/home/chenzilin/crosstool-ng/0001-add-sample-arm-imx6-linux-musleabihf.patch ./patches/0001-add-sample-arm-imx6-linux-musleabihf.patch

Create Image:

	cd crosstool-ng-docker/

	sudo docker build -t crosstool-ng-docker .

List Images:

	sudo docker images

Remeve Image:

	sudo docker rmi 7d9495d03763

	sudo docker image remove 7d9495d03763

Run Container:

	sudo docker run -it crosstool-ng-docker crosstool-ng-docker:latest /bin/bash

List Containers:

	sudo docker ps

	sudo docker ps -a

Remove Container:

	sudo docker rm d48b68282c03

Partition Tar:

	tar cvjfa - dl/ |split -b 85m - dl.tar.bz2.

	cat dl.tar.bz2.a* | tar xvj

Reference:

	https://github.com/mkedwards/crosstool-ng

	https://github.com/crosstool-ng/crosstool-ng
