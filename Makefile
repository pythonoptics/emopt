all:
	$(MAKE) -C src/

clean:
	$(MAKE) -C src/ clean

centos7:
	sudo yum install epel-release
	sudo yum groupinstall "Development Tools"
	sudo yum install openmpi openmpi-devel python-pip python-devel tkinter
	module load mpi/openmpi-x86_64
	pip install requests matplotlib numpy scipy mpi4py --user

fedora28:
	sudo yum groupinstall "Development Tools"
	sudo yum install gcc gcc-c++ openmpi openmpi-devel python-pip python-devel python2-tkinter
	module load mpi/openmpi-x86_64
	pip install requests matplotlib numpy scipy mpi4py --user

ubuntu18:
	sudo apt-get install build-essential gfortran openmpi-bin libopenmpi-dev python python-dev python-pip git python-tk
	install requests matplotlib numpy scipy mpi4py --user

install:
	python install.py
