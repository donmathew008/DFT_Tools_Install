## Installation of different DFT Tools in Ubuntu(here Ubuntu 22.04) with minimum steps and no reference

#### Initially install Anaconda from official website after signing in
[Anaconda](https://www.anaconda.com/download)
```diff
cd Downloads
chmod +x Anaconda3-2024.02-1-Linux-x86_64.sh
./Anaconda3-2024.02-1-Linux-x86_64.sh
```

## $\color{Violet}{\textbf{1. BURAI}}$

#### BURAI is a GUI system of Quantum ESPRESSO

#### $\color{Green}{\textbf{Prerequisites/ Preparing the environment}}$
```diff
sudo apt install -y build-essential gfortran libopenmpi-dev openmpi-bin libblas-dev liblapack-dev libscalapack-mpi-dev libhdf5-dev libhdf5-mpi-dev libnetcdf-dev libnetcdff-dev netcdf-bin readline-common curl wget diffutils patch openjdk-8-jdk openjfx
```
#### Download the "BURAI1.3_Linux.tgz" from the link given below
[Download](https://github.com/BURAI-team/burai/releases/download/ver.1.3-linux/BURAI1.3_Linux.tgz)
#### Open the Downloads folder in terminal
#### Unzip the file either using the command line (OR just extract directly)
```diff
tar -xvzf BURAI1.3_Linux.tgz
```
```diff
cd BURAI1.3/bin
```
#### Check for "burai.jar" using ls command
#### Execute the file by
```diff
java -jar burai.jar
```
#### $\color{Red}{\textbf{Possible error: Could not find or load main class burai.app.QEFXMain}}$
#### This might give an error to fix it run fix_burai.sh(given in this repository)after making it executable 
```diff
chmod +x fix_burai.sh
sudo ./fix_burai.sh
```
#### Then execute the java command of previous step
#### It should open the GUI
#### $\color{Red}{\textbf{Possible error: No structure visualisation is shown}}$
#### $\color{Red}{\textbf{NB: Run this iff no structure is shown else go to next step creating Desktop shortcut}}$
```diff
java -Dprism.forceGPU=true -jar burai.jar
```
#### The above command should be executed again if BURAI is restarted to visualize the structure, But this can be incorporated in the Desktop shortcut
#### To create a Desktop shortcut and incorporate above command replace "burai.sh" file in the 'bin' folder(Downloads/BURAI1.3/bin) with the one given in this repository and execute the following

```diff
cd ..
```
```diff
./makeLauncher.sh
```
#### This creates 'BURAI.desktop', copy this to Desktop
#### Right click on the created desktop icon and press "Allow Launching"
#### That's it but on running "scf" files the below error will pop up

#### $\color{Red}{\textbf{Possible error on running: No pseudopotentials, please download files}}$
#### $\color{Violet}{\textbf{This may be due to two reasons 1. Downloaded pseudopotentials is not in the location, 2. Wrong QE path}}$

##### $\color{Green}{\textbf{Solution: 1. Downloaded pseudopotentials is not in the location}}$
##### On running BURAI will search the pseudopotentials at ".burai/.pseudopot" which is available on the $HOME folder (It will be hidden so check the "Show Hidden Files" to view it)
##### It will be empty
##### $\color{Violet}{\textbf{OR}}$
##### Open a terminal and 
```diff
ls cd .burai/.psedopot/
```
##### If it shows nothing, pseudopotentials are not in that folder but are available on the BURAI installation folder 
##### We can do this by command line as follows
```diff
sudo cp -a ~/Downloads/BURAI1.3/pseudopot/. ~/.burai/.pseudopot
```
##### Change the installation directory if required

## $\color{Violet}{\textbf{2. QUANTUM ESPRESSO}}$
### $\color{Green}{\textbf{This is optional as we already have QE executables in BURAI}}$
##### Initially register in Quantum Espresso
[Register](https://www.quantum-espresso.org/register-user/)
##### Then login using the credentials
[Login](https://www.quantum-espresso.org/login/)
##### Then download and unzip the files in a favourable location
##### Open terminal in that location and execute 
```diff
cd qe-7.3.1-ReleasePack/qe-7.3.1/
```
##### $\color{Red}{\textbf{Check the version; folder name may be different}}$
##### Execute the following
```diff
./configure
```
```diff
make all
```
```diff
sudo make install
```

## $\color{Violet}{\textbf{3. SIESTA}}$
#### SIESTA is both a method and its computer program implementation, to perform efficient electronic structure calculations and ab initio molecular dynamics simulations of molecules and solids.

```diff
wget https://gitlab.com/siesta-project/siesta/-/releases/v4.1.5/downloads/siesta-4.1.5.tar.gz
```
```diff
tar xvzf siesta-4.1.5.tar.gz
```
```diff
cd siesta-4.1.5/Obj
```
```diff
cp gfortran.make arch.make
```
#### $\color{Red}{\textbf{Possible error: Running the 'sh ../Src/obj setup.sh' will give a mismatch error so we will edit the `arch.make' file using vi editor}}$
```diff
vi arch.make
```
#### Enter insert mode by pressing "i" and locate and replace the line
```diff
FFLAGS = -O2 -fPIC -ftree-vectorize 
```
#### with
```diff
FFLAGS = -O2 -fPIC -ftree-vectorize -w -fallow-argument-mismatch -O2
```
#### save and exit by ":wq" after pressing Esc key
#### Then run the following
```diff
sh ../Src/obj_setup.sh
```
```diff
make
```
```diff
cd ..
```
```diff
cd Util
```
```diff
./build_all.sh
```
#### Copy siesta to usr/local/bin
```diff
cd ..
```
```diff
cd Obj
```
#### check for "siesta"
```diff
ls si*
```
```diff
sudo cp siesta /usr/local/bin/
```
#### Checking
#### Run 
```diff
./siesta
```
from Obj folder
#### OR
```diff
sudo ./siesta
```
#### from usr/local/bin folder

### $\color{Rhodamine}{\textbf{Executing the first program in SIESTA}}$
#### Download and unzip the files from Dr. Arun Kumar
[Download](https://drive.google.com/drive/folders/1h2PzQ2V2ALKun7PNkBC8qKw_wR59-hRW)
#### Say it is in the Downloads folder, open a terminal window
```diff
cd Downloads/serb-workshop/files/gold/fcc
```
#### Where we can see three files "Au.psf", "EVSLATT.sh", "gold.fdf", out of which "gold.fdf" is the input file and "EVSLATT.sh" is the executable file

#### The siesta_par is to be replaced with siesta(edited file is given in the repository) in the "EVSLATT.sh" and to make it executable from terminal
```diff
chmod +x EVSLATT.sh
```
#### Finally execute the file using 
```dif
./EVSLATT.sh
```
#### We need to create the '.fdf' and '.psf' which are the input file and pseudo potential files to run siesta, this is done with 'GDIS' and 'ATOM' repectively.
#### Install GDIS to create .fdf file
```diff
sudo apt-get install -y gdis
```
#### To open 'filename.cif' via GDIS, open terminal window at the file location and
```diff
gdis filename.cif
```
#### Then save the file as 'filename.fdf'
#### Install ATOM to create .psf file
#### Go to Pseudo Directory in Siesta location (Here it is in the Downloads folder)
```diff
cd Downloads/siesta-4.1.5/Pseudo/
wget https://siesta-project.org/SIESTA_MATERIAL/Pseudos/Code/atom-4.2.7-100.tgz
tar xvf atom-4.2.7-100.tgz
cd atom-4.2.7-100/
gedit 000_INSTALL
```
#### Download and install libgridxc
```diff
wget https://launchpad.net/libgridxc/trunk/0.8/+download/libgridxc-0.8.5.tgz
tar xvf libgridxc-0.8.5.tgz 
cd libgridxc-0.8.5/
mkdir Gfortran
cd Gfortran
cp ../extra/fortran.mk .
sh ../src/config.sh
make clean
make
```
#### Coming back to atom folder, install xmlf90
```diff
cd ../../
wget https://launchpad.net/xmlf90/trunk/1.5/+download/xmlf90-1.5.4.tar.gz
tar xvf xmlf90-1.5.4.tar.gz
cd xmlf90-1.5.4
./configure
make
sudo make install
```
#### Come back to atom file and continue installing atom.
```diff
cd ../
cp arch.make.sample arch.make
gedit arch.make
```
#### Edit the path for files make following changes in the arch.make:
```diff
  XMLF90_ROOT=/home/vincent/Downloads/siesta-4.1.5/Pseudo/atom-4.2.7-100/xmlf90-1.5.4/config/data
		GRIDXC_ROOT=/home/vincent/Downloads/siesta-4.1.5/Pseudo/atom-4.2.7-100/libgridxc-0.8.5/Gfortran
		include $(XMLF90_ROOT)/xmlf90.mk
		include $(GRIDXC_ROOT)/gridxc.mk
```
#### Continue in the atom folder to complete the installation:
```diff
make
sudo make install
```
#### Generating Pseudo potential Files with ATOM: (Check the following directory)
```diff
cd Downloads/siesta-4.1.5/Pseudo/atom-4.2.7-100/Tutorial/PS_Generation
```
#### Alternate way to get Pseudo potential- Download from :
[Here](https://nninc.cnf.cornell.edu/)

## $\color{Violet}{\textbf{4. BoltzTraP2}}$
#### BoltzTraP2 is a modern implementation of the smoothed Fourier interpolation algorithm for electronic bands that formed the base of the original and widely used BoltzTraP code. One of the most typical uses of BoltzTraP is the calculation of thermoelectric transport coefficients as functions of temperature and chemical potential in the rigid-band picture. 
#### $\color{Green}{\textbf{Prerequisites/ Preparing the environment}}$
```diff
pip install numpy scipy spglib NetCDF4 ASE colorama pyFFTW vtk pytest
```
```diff
sudo apt install python3-pip cmake
```
#### Install BoltzTraP2 by
```diff
pip3 install boltztrap2
```
#### Even though this method installs BoltzTraP2, a building it from [here](https://gitlab.com/sousaw/BoltzTraP2) is highly preferred
```diff
wget https://gitlab.com/sousaw/BoltzTraP2/-/archive/public/BoltzTraP2-public.tar.gz
```

## $\color{Violet}{\textbf{5. Avogadro2}}$
#### Avogadro 2 is a chemical editor and visualization application, it is also a set of reusable software libraries written in C++ using principles of modularity for maximum reuse
#### $\color{Green}{\textbf{The below commands should build the openchemistry repository which has avagadro as a module}}$
#### $\color{Green}{\textbf{Prerequisites/ Preparing the environment}}$
#### Here we mention installation of Qt, eigen, cairo, wxwidgets, OpenBabel. Even thogh building Avogadro installs most of these packages, installing separately is preferred to find any unmet dependency

[Download Qt](https://download.qt.io/archive/qt/4.8/4.8.5/)
#### Qt install
```diff
sudo apt install -y libgtk2.0-dev libgtk-3-dev
sudo add-apt-repository ppa:rock-core/qt4
sudo apt update
sudo apt install qt4-dev-tools libqt4-dev libqtcore4 libqtgui4 
```
#### Install zlib cairo eigen libxml
```diff
sudo apt install -y zlib1g zlib1g-dev libxml2 libxml2-dev libcairo2-dev libeigen3-dev
```
#### wxWidgets
[Download](https://www.wxwidgets.org/downloads/)
```diff
cd Downloads/
tar -xf wxWidgets-3.2.5.tar.bz2
cd wxWidgets-3.2.5/
mkdir gtk-build
cd gtk-build/
../configure
make
sudo make install
sudo ldconfig
```

[Download OpenBabel](https://sourceforge.net/projects/openbabel/files/openbabel/2.4.0/openbabel-openbabel-2-4-0.tar.gz/download)
```diff
 tar -zxf openbabel-openbabel-2-4-0.tar.gz
mkdir build
cd build
cmake ../openbabel-openbabel-2-4-0
make
sudo make install
```
#### The initial setup is done, but the repository we are going to use doesn't build if the ssh key is not setup in GitHub

#### $\color{Green}{\textbf{You should have a github account to do this}}$
#### Setting SSH key
```diff
cd ~/.ssh && ssh-keygen
cat id_rsa.pub
```
#### copy the contents to github website SSH keys and then execute
```diff
ssh -T git@github.com
```
#### This should show "You've successfully authenticated, but GitHub does not provide shell access."
#### But before moving further, we need to configure git, this allows to use "git" instead of "https" within the git clone
```diff
git config --global url."https://".insteadOf git://
```
#### We need CMake 3.3+(CMake3.29.3) for building so we install it manually[[Reference]](https://wiki.openchemistry.org/Build)
#### Installing CMake 3.29.3
[Download](https://github.com/Kitware/CMake/releases/download/v3.29.3/cmake-3.29.3.tar.gz)
```diff
cd Downloads/
tar -xvzf cmake-3.29.3.tar.gz
./bootstrap && make && sudo make install
```
#### Installing googletest # even though this might not be necessary
```diff
git clone https://github.com/google/googletest.git -b release-1.10.0
cd googletest        
mkdir build          
cd build
cmake ..             
```
#### Now it is all set to build openchemistry
```diff
git clone --recursive git://github.com/OpenChemistry/openchemistry.git
cd openchemistry/
git pull
git submodule update --init
sudo apt-get install -y curl build-essential qtbase5-dev qtdeclarative5-dev zlib1g-dev libxml2-dev git libqt5svg5-dev libqt5gui5 libqt5concurrent5 rapidjson-dev
cd
mkdir openchemistry-build
cd openchemistry-build
cmake ../openchemistry
cmake --build . --config Release
```
#### Creating a Desktop shortcut for Avogadro2
#### Download the folder 'Avogadro2' given in this repository and open the folder in terminal and execute
```diff
makeLauncher_avogadro.sh 
```
#### This creates 'Avogadro.desktop', copy this to Desktop
#### Right click on the created desktop icon and press "Allow Launching" and open the app
#### $\color{Red}{\textbf{Possible Error: This system does not support OpenGL.}}$
#### Solution open a terminal window and execute the following command afterwards Avagadro2 should open
```diff
conda install -c conda-forge libstdcxx-ng
```


