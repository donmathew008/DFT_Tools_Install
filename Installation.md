# Installation of different DFT Tools in Ubuntu(here Ubuntu 22.04)

### Initially install Anaconda from official website after signing in
[Anaconda](https://www.anaconda.com/download)
```diff
cd Downloads
chmod +x Anaconda3-2024.02-1-Linux-x86_64.sh
./Anaconda3-2024.02-1-Linux-x86_64.sh
```

## $\color{Violet}{\textbf{1. BURAI}}$

### BURAI is a GUI system of Quantum ESPRESSO
[Reference](https://burai.readthedocs.io/en/latest/)

## $\color{Green}{\textbf{Prerequisites/ Preparing the environment}}$
```diff
sudo apt install build-essential gfortran
```
```diff
sudo apt install libopenmpi-dev openmpi-bin
```
```diff
sudo apt install libblas-dev liblapack-dev libscalapack-mpi-dev
```
```diff
sudo apt install libhdf5-dev libhdf5-mpi-dev libnetcdf-dev libnetcdff-dev netcdf-bin
```
```diff
sudo apt install readline-common
```
```diff
sudo apt install curl wget
```
```diff
sudo apt install diffutils patch
```
```diff
sudo apt-get install openjdk-8-jdk
```
```diff
sudo apt-get install openjfx
```
### All can be done together as follows(Even though NOT Recommended due to errors in troubleshooting)
```diff
sudo apt install -y build-essential gfortran libopenmpi-dev openmpi-bin libblas-dev liblapack-dev libscalapack-mpi-dev libhdf5-dev libhdf5-mpi-dev libnetcdf-dev libnetcdff-dev netcdf-bin readline-common curl wget diffutils patch openjdk-8-jdk openjfx
```
### Download the "BURAI1.3_Linux.tgz" from the link given below
[Download](https://github.com/BURAI-team/burai/releases/download/ver.1.3-linux/BURAI1.3_Linux.tgz)
### Open the Downloads folder in terminal
### Unzip the file either using the command line (OR just extract directly)
```diff
tar -xvzf BURAI1.3_Linux.tgz
```
```diff
cd BURAI1.3/bin
```
### Check for "burai.jar" using ls command
### Execute the file by
```diff
java -jar burai.jar
```
### This might give an error to fix it run fix_burai.sh after making it executable 
```diff
chmod +x fix_burai.sh
sudo ./fix_burai.sh
```
#### $\color{Red}{\textbf{Possible error: Could not find or load main class burai.app.QEFXMain}}$

### It should open the GUI
#### $\color{Red}{\textbf{Possible error: No structure visualisation is shown}}$
#### $\color{Red}{\textbf{NB: Run this iff no structure is shown else go to next step creating Desktop shortcut}}$
```diff
java -Dprism.forceGPU=true -jar burai.jar
```
### To create a Desktop shortcut
```diff
cd ..
```
```diff
./makeLauncher.sh
```

## $\color{Violet}{\textbf{2. SIESTA}}$
### SIESTA is both a method and its computer program implementation, to perform efficient electronic structure calculations and ab initio molecular dynamics simulations of molecules and solids.
[Reference](https://docs.siesta-project.org/projects/siesta/en/latest/installation/legacy-build.html)
## $\color{Green}{\textbf{Prerequisites/ Preparing the environment}}$


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
[Reference](https://sites.google.com/arunphy.org/website1/for-students-of-physics/querries-of-learners/siesta)
```diff
vi arch.make
```
### Enter insert mode by pressing "i" and locate and replace the line
```diff
FFLAGS = -O2 -fPIC -ftree-vectorize 
```
### with
```diff
FFLAGS = -O2 -fPIC -ftree-vectorize -w -fallow-argument-mismatch -O2
```
### save and exit by ":wq" after pressing Esc key
### Then run the following
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
### Copy siesta to usr/local/bin
```diff
cd ..
```
```diff
cd Obj
```
### check for "siesta"
```diff
ls si*
```
```diff
sudo cp siesta /usr/local/bin/
```
### Checking
### Run 
```diff
./siesta
```
from Obj folder
### OR
```diff
sudo ./siesta
```
### from usr/local/bin folder

## $\color{Rhodamine}{\textbf{Executing the first program }}$
### Download and unzip the files from Dr. Arun Kumar
[Download](https://drive.google.com/drive/folders/1h2PzQ2V2ALKun7PNkBC8qKw_wR59-hRW)
### Say it is in the Downloads folder, open a terminal window
```diff
cd Downloads/serb-workshop/files/gold/fcc
```
### Where we can see three files "Au.psf", "EVSLATT.sh", "gold.fdf", out of which "gold.fdf" is the input file and "EVSLATT.sh" is the executable file

### The siesta_par is to be replaced with siesta(edited file is given in the repository) in the "EVSLATT.sh" and to make it executable from terminal
```diff
chmod +x EVSLATT.sh
```
### Finally ececute the file using 
```dif
./EVSLATT.sh
```
## $\color{Violet}{\textbf{3. BoltzTraP2}}$
## $\color{Green}{\textbf{Prerequisites/ Preparing the environment}}$
[Reference](https://boltztrap2y.readthedocs.io/en/latest/BoltzTraP2.html)
```diff
pip install numpy
```
```diff
pip install scipy
```
```diff
pip install spglib
```
```diff
pip install NetCDF4
```
```diff
pip install ASE
```
```diff
pip install colorama
```
```diff
pip install pyFFTW
```
```diff
pip install vtk
```
```diff
pip install pytest
```
### All can be done together as follows(Even though NOT Recommended due to errors in troubleshooting)
```diff
pip install numpy scipy spglib NetCDF4 ASE colorama pyFFTW vtk pytest
```
```diff
sudo apt install python3-pip
```
```diff
sudo apt install cmake
```
### Install BoltzTraP2 by
```diff
pip3 install boltztrap2
```
#### Even though this method installs BoltzTraP2, a building it from [here](https://gitlab.com/sousaw/BoltzTraP2) is highly preferred
```diff
wget https://gitlab.com/sousaw/BoltzTraP2/-/archive/public/BoltzTraP2-public.tar.gz

```
## $\color{Violet}{\textbf{4. Avogadro}}$
## $\color{Green}{\textbf{Prerequisites/ Preparing the environment}}$

[Reference](https://avogadro.cc/)

[Download Qt](https://download.qt.io/archive/qt/4.8/4.8.5/)
### Qt install
```diff
sudo apt install -y libgtk2.0-dev libgtk-3-dev
sudo add-apt-repository ppa:rock-core/qt4
sudo apt update
sudo apt install qt4-dev-tools libqt4-dev libqtcore4 libqtgui4
```
### Install zlib cairo eigen libxml
```diff
sudo apt install -y zlib1g zlib1g-dev libxml2 libxml2-dev libcairo2-dev libeigen3-dev
```
### wxWidgets
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
#### $\color{Red}{\textbf{The below commands should build the openchemistry repository which has avagadro as a module}}$
#### $\color{Red}{\textbf{But this have some issues with git clone and build so this doesn't work}}$

```diff
git clone --recursive git://github.com/OpenChemistry/openchemistry.git #error
git clone --recursive https://github.com/OpenChemistry/openchemistry.git
git pull #error
git submodule update --init #error
sudo apt-get install -y cmake curl build-essential qtbase5-dev qtdeclarative5-dev zlib1g-dev libxml2-dev git libqt5svg5-dev libqt5gui5 libqt5concurrent5 rapidjson-dev
mkdir openchemistry-build
cd openchemistry-build
cmake ../openchemistry
cmake --build . --config Release
```
## or
[Download](https://www.openchemistry.org/downloads/)
#### $\color{Red}{\textbf{The below commands should install avagadro, but this too doesn't work}}$
[Download Avagadro from here](https://avogadro.cc/)
```diff
cd Downloads/avogadro-1.2.0/
mkdir build
cd build
cmake ../ -Wno-dev
make
sudo make install
```
### $\color{Green}{\textbf{Solution: Install Windows in VirtualBox and install the exe file}}$
#### Seems to be a bit weird, but still gives a solution
### Installing VirtualBox
#### The below command installs Virtualbox6.1.50
```diff
sudo apt-get install -y virtualbox virtualbox-qt
```
#### We have to install an extension pack so that we can use shared folder
[Download Extensionpack](https://download.virtualbox.org/virtualbox/6.1.50/Oracle_VM_VirtualBox_Extension_Pack-6.1.50.vbox-extpack)
#### Open virtualbox -> File -> Preferences -> Extensions -> $add the downloaded extension pack and Install
[Download WIndows10 ISO(64 bit)](https://software.download.prss.microsoft.com/dbazure/Win10_22H2_English_x64v1.iso?t=6db8adfe-bf7d-4e7c-afe7-189eedffd6e3&P1=1715931064&P2=601&P3=2&P4=j%2fkvFhLUOKzcIwr4CNjFhF%2fsKvylkZWau98LJGJb4FgFYT9Dwc68nevOe7K418Gx7JI9TTyWYBhxflx5kB4KcWhXIU0gMm9pt0m1bfmAhdzCEPSPFR%2fUWCe3FqJFAkkR3M0yyj0pNXdQWvHmf3awyruVT51lRd1RTVjfL%2bnOcXbZJhVrruV8fJ6%2fS80fjmOKU%2f%2bKfxowT%2bSupGT6owXOukZZZ5LjzCrEYWgS20MDaP2OSHW%2f3lGeYM1xQM6xQbgz7lsu2Ma19nl4EYeh98gBFul9CugHCNV5qVLFAbQLenTG6rTM7GhRpezUA3rCKXOy%2bglvO0wokRvVApX0xXHrWg%3d%3d)
#### This is the official iso file but doesn't have a product key, still we can use it. But some modifications are needed so that we can use Windows as a virtual machine.
#### Open virtualbox > Give a #name > add the ISO file
#### Set Base Memory little below half the available memory(We are having 8GB)
#### Create a virtual disk (50GB) and Finish the setup
#### $\color{Red}{\textbf{Do not Start the VM yet}}$
#### Go to Settings > System > Uncheck the "Floppy"
#### Go to Settings > Display > set "Video Memory" to 128 MB(default), check "Enable 3D Acceleration"
#### Go to Settings > USB > Check the "USB 1,1(OHCI) Controller"
#### Go to Settings > Shared Folders > 
#### Refer [Video](https://youtu.be/GZBiyKfSTA4?si=64l5kUknL0VBp9bj) for shared folders
#### Download the "AvogadroOrca4.2.1.current.exe" from this repository and install in Windows


## $\color{Violet}{\textbf{5. ORCA}}$
[Reference](https://orcaforum.kofo.mpg.de/app.php/dlext/?sid=214e8ecd094649b921d2ca62bad3a384)
### Just extract the files, that will do
## $\color{Violet}{\textbf{6. WIEN2k}}$
[Reference](http://susi.theochem.tuwien.ac.at/)
### This is a paid platform

