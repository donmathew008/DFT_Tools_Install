# Installation of different DFT Tools in Ubuntu(here Ubuntu 22.04)

### Initially install Anaconda from official website after signing in
[Anaconda](https://www.anaconda.com/download)
```diff
cd Downloads
chmod +x Anaconda3-2024.02-1-Linux-x86_64.sh
./Anaconda3-2024.02-1-Linux-x86_64.sh
```

## $\color{Violet}{\textbf{1. BURAI}}$
## $\color{Green}{\textbf{Prerequisites/ Preparing the environment}}$

```diff
sudo apt install -y build-essential gfortran libopenmpi-dev openmpi-bin libblas-dev liblapack-dev libscalapack-mpi-dev libhdf5-dev libhdf5-mpi-dev libnetcdf-dev libnetcdff-dev netcdf-bin readline-common curl wget diffutils patch openjdk-8-jdk openjfx python3-pip cmake
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
#### $\color{Red}{\textbf{Possible error: No structure visualisation is shown. NB: Run this iff no structure is shown else go to next step creating Desktop shortcut}}$
```diff
java -Dprism.forceGPU=true -jar burai.jar
```
### To create a Desktop shortcut
```diff
cd ..
./makeLauncher.sh
```

## $\color{Violet}{\textbf{2. SIESTA}}$
## $\color{Green}{\textbf{Prerequisites/ Preparing the environment}}$



[Reference](https://docs.siesta-project.org/projects/siesta/en/latest/installation/legacy-build.html)
```diff
wget https://gitlab.com/siesta-project/siesta/-/releases/v4.1.5/downloads/siesta-4.1.5.tar.gz
tar xvzf siesta-4.1.5.tar.gz
cd siesta-4.1.5/Obj
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
make
cd ..
cd Util
./build_all.sh
```
### Copy siesta to usr/local/bin
```diff
cd ..
cd Obj
```
### check for "siesta"
```diff
ls si*
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
pip install numpy scipy spglib NetCDF4 ASE colorama pyFFTW vtk pytest
```
### Install BoltzTraP2 by
```diff
pip3 install boltztrap2
```
## $\color{Violet}{\textbf{4. Avogadro}}$
## $\color{Green}{\textbf{Prerequisites/ Preparing the environment}}$
### VScode(from ubuntu software) and Anaconda should be installed
[Reference](https://avogadro.cc/)

[Download Qt](https://download.qt.io/archive/qt/4.8/4.8.5/)
### Qt version 4.8.5 is required
```diff
sudo apt install libgtk2.0-dev
sudo apt install libgtk-3-dev
```
```diff
cd Downloads
```
```diff
tar -zxvf qt-everywhere-opensource-src-4.8.5
```
```diff
cd Downloads/qt-everywhere-opensource-src-4.8.5/
./configure -no-openssl
gmake
sudo gmake install

```
### Login to Qt and proceed
[Download wxWidgets](https://www.wxwidgets.org/downloads/)
```diff
tar -xf wxWidgets-3.2.4.tar.bz2
```
### Open "Visual Studio Command Prompt" window
```diff
cd Downloads/wxWidgets-3.2.4/
```
```diff
mkdir gtk-build
cd gtk-build/
../configure

make #for single core
make -j4 #for 4 core

sudo make install
sudo ldconfig


```
```diff
sudo apt install -y zlib1g zlib1g-dev libxml2 libxml2-dev libcairo2-dev
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
```diff
sudo apt install aptitude
sudo aptitude install yum-utils
sudo aptitudee 
```


[Download Eigen]([http://eigen.tuxfamily.org/index.php?title=Main_Page#Download](https://gitlab.com/libeigen/eigen/-/archive/3.2.10/eigen-3.2.10.tar.gz))
### Only use 3.2
```diff
tar -zxvf eigen-3.2.0.tar.gz 
```

```diff
cd Downloads/avogadro-1.2.0/
mkdir build
cd build
cmake ../ -Wno-dev
make
sudo make install
```
## $\color{Violet}{\textbf{5. ORCA}}$
[Reference](https://orcaforum.kofo.mpg.de/app.php/dlext/?sid=214e8ecd094649b921d2ca62bad3a384)
## $\color{Violet}{\textbf{6. WIEN2k}}$
[Reference](http://susi.theochem.tuwien.ac.at/)

