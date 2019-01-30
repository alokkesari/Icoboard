cd #HOME
sudo apt-get install geany -y

cd $HOME
git clone git://git.drogon.net/wiringPi
cd wiringPi && ./build

cd $HOME
sudo apt-get install subversion -y
svn co http://svn.clifford.at/handicraft/2015/icoprog
cd icoprog && make install

sudo apt-get install build-essential clang bison flex libreadline-dev -y
sudo apt-get install gawk tcl8.6-dev libffi-dev git mercurial graphviz -y
sudo apt-get install xdot pkg-config python python3 libftdi-dev -y

cd $HOME
git clone https://github.com/cliffordwolf/icestorm.git icestorm
cd icestorm && make && sudo make install

cd $HOME
git clone https://github.com/cseed/arachne-pnr.git arachne-pnr
cd arachne-pnr && make && sudo make install

cd $HOME
git clone https://github.com/cliffordwolf/yosys.git yosys
cd yosys && make && sudo make install
sudo chmod +x -R yosys
mkdir BitMake
