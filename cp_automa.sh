set -e
present=`pwd`
echo 'Type the name of the module:'
read modname
mkdir `echo $present`/`echo $modname`
echo '//Type your verilog code here' > `echo $present`/`echo $modname`/`echo $modname`.v  
echo '//Type your input and output constraints here' > `echo $present`/`echo $modname`/`echo $modname`.pcf
sudo cp `echo $present`/automa.sh `echo $present`/`echo $modname`/automa.sh
cd `echo $present`/`echo $modname`
echo 'Stopping this terminal process while editing the Verilog code will kill the Geany editor process. Open another terminal to run other commands while still editing.'
sudo geany `echo $present`/`echo $modname`/`echo $modname`.v `echo $present`/`echo $modname`/`echo $modname`.pcf 