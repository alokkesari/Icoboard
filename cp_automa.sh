set -e
present=`pwd`
echo 'Type the name of the module:'
read modname
mkdir `echo $present`/`echo $modname`
echo -n 'module ' >> `echo $present`/`echo $modname`/`echo $modname`.v
echo -n `echo $modname` >> `echo $present`/`echo $modname`/`echo $modname`.v
echo '(); //Inputs and Outputs to be mentioned between the round brackets.' >> `echo $present`/`echo $modname`/`echo $modname`.v    
echo >> `echo $present`/`echo $modname`/`echo $modname`.v  
echo >> `echo $present`/`echo $modname`/`echo $modname`.v  
echo '//Hardware description here' >> `echo $present`/`echo $modname`/`echo $modname`.v  
echo >> `echo $present`/`echo $modname`/`echo $modname`.v  
echo >> `echo $present`/`echo $modname`/`echo $modname`.v  
echo 'endmodule' >> `echo $present`/`echo $modname`/`echo $modname`.v  
echo '#Type your input and output constraints here. The general format is: ' >> `echo $present`/`echo $modname`/`echo $modname`.pcf
echo '#set_io DummyOutputPin DummyPhysicalPin' >> `echo $present`/`echo $modname`/`echo $modname`.pcf
echo '#set_io DummyInputPin DummyPhysicalPin' >> `echo $present`/`echo $modname`/`echo $modname`.pcf
sudo chmod +x -R `echo $present`/`echo $modname`
echo 'Stopping this terminal process while editing the Verilog code will kill the Geany editor process.' 
echo 'Open another terminal to run other commands while still editing.'
echo 'For bitstream generation of this module stop this process after saving the edited codes.'
echo 'Read the manual.'
sudo geany `echo $present`/`echo $modname`/`echo $modname`.pcf `echo $present`/`echo $modname`/`echo $modname`.v  
exec bash
