present=`pwd`
echo 'Type the name of the Module:'
read modulename
mkdir $modulename
echo '//Type your verilog code here' > `echo $present`/`echo $modulename`/`echo $modulename`.v  
echo '//Type your input and output constraints here' > `echo $present`/`echo $modulename`/`echo $modulename`.pcf
sudo cp `echo $present`/automa.sh `echo $present`/`echo $modulename`/automa.sh
cd `echo $present`/`echo $modulename`
sudo geany `echo $modulename`.v `echo $modulename`.pcf 