all:
	$(MAKE) -C src/

clean:
	$(MAKE) -C src/ clean

centos7:
	sudo yum install -y epel-release
	sudo yum groupinstall -y "Development Tools"
	sudo yum install -y openmpi openmpi-devel python-pip python-devel tkinter
	module load mpi/openmpi-x86_64
	pip install requests matplotlib numpy scipy mpi4py --user

fedora28:
	sudo yum groupinstall -y "Development Tools"
	sudo yum install -y gcc gcc-c++ openmpi openmpi-devel python-pip python-devel python2-tkinter
	module load mpi/openmpi-x86_64
	pip install requests matplotlib numpy scipy mpi4py --user

ubuntu18:
	sudo apt-get install -y build-essential gfortran openmpi-bin libopenmpi-dev python python-dev python-pip git python-tk
	pip install requests matplotlib numpy scipy mpi4py 

venv:
	python3 -m venv env
	. env/bin/activate

conda2:
	conda create -n py2 python=2.7
	conda activate py2

install:
	pip install requests
	python install.py
	python setup.py install --user

python2:
	sudo ln -sf /usr/bin/python /usr/local/bin/pip
	sudo ln -sf /usr/bin/pip /usr/local/bin/pip
