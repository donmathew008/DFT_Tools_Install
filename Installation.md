# Installation of different DFT Tools in Ubuntu(here Ubuntu 22.04)



## $\color{Violet}{\textbf{1. BURAI}}$
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
### It should open the GUI
#### $\color{Red}{\textbf{Possible error: No structure visualisation is shown. NB: Run this iff no structure is shown else go to next step creating Desktop shortcut}}$
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
## $\color{Green}{\textbf{Prerequisites/ Preparing the environment}}$
```diff
sudo apt-get install openjdk-8-jdk
```
```diff
sudo apt-get install openjfx
```


[Reference](https://docs.siesta-project.org/projects/siesta/en/latest/installation/legacy-build.html)
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

## $\color{Violet}{\textbf{4. ORCA}}$
## $\color{Violet}{\textbf{5. WIEN2k}}$


