dir=`pwd`
echo 'Type the name of the module:'
read parent
echo 'For cases where there are many submodules, type the name of the top module (same as module name otherwise):'
read topmod
sudo rm -f `echo $dir`/`echo $parent`/`echo $parent`.asc `echo $dir`/`echo $parent`/`echo $parent`.bin `echo $dir`/`echo $parent`/`echo $parent`.blif `echo $dir`/`echo $parent`/`echo $parent`.dot `echo $dir`/`echo $parent`/`echo $parent`.pdf 
sudo rm -f `echo $HOME`/yosys/BitMake/ascript.sh
echo -n 'read_verilog ' >> `echo $HOME`/yosys/BitMake/ascript.sh 
echo -n `echo $dir` >> `echo $HOME`/yosys/BitMake/ascript.sh
echo -n '/' >> `echo $HOME`/yosys/BitMake/ascript.sh
echo -n `echo $parent` >> `echo $HOME`/yosys/BitMake/ascript.sh
echo -n '/' >> `echo $HOME`/yosys/BitMake/ascript.sh
echo -n `echo $parent` >> `echo $HOME`/yosys/BitMake/ascript.sh
echo '.v' >> `echo $HOME`/yosys/BitMake/ascript.sh
echo 'write_ilang' >> `echo $HOME`/yosys/BitMake/ascript.sh
echo 'proc; opt' >> `echo $HOME`/yosys/BitMake/ascript.sh
echo -n 'show ' >> `echo $HOME`/yosys/BitMake/ascript.sh
echo `echo $topmod` >> `echo $HOME`/yosys/BitMake/ascript.sh
echo '.PHONY: default' >> `echo $HOME`/yosys/BitMake/Makefile
echo 'default: prog_sram' >> `echo $HOME`/yosys/BitMake/Makefile
echo >> `echo $HOME`/yosys/BitMake/Makefile
echo '$(v_fname).blif: $(v_fname).v' >> `echo $HOME`/yosys/BitMake/Makefile
echo -n '	yosys -p ' >> `echo $HOME`/yosys/BitMake/Makefile
echo -n "'" >> `echo $HOME`/yosys/BitMake/Makefile 
echo -n 'synth_ice40 -blif ' >> `echo $HOME`/yosys/BitMake/Makefile 
echo -n "\$(v_fname).blif" >> `echo $HOME`/yosys/BitMake/Makefile
echo -n "' " >> `echo $HOME`/yosys/BitMake/Makefile
echo '$(v_fname).v' >> `echo $HOME`/yosys/BitMake/Makefile
echo >> `echo $HOME`/yosys/BitMake/Makefile
echo '$(v_fname).asc: $(v_fname).blif $(v_fname).pcf' >> `echo $HOME`/yosys/BitMake/Makefile
echo '	arachne-pnr -d 8k -p $(v_fname).pcf -o $(v_fname).asc $(v_fname).blif' >> `echo $HOME`/yosys/BitMake/Makefile
echo >> `echo $HOME`/yosys/BitMake/Makefile
echo '$(v_fname).bin: $(v_fname).asc' >> `echo $HOME`/yosys/BitMake/Makefile
echo '	icetime -d hx8k -c 25 $(v_fname).asc' >> `echo $HOME`/yosys/BitMake/Makefile
echo '	icepack $(v_fname).asc $(v_fname).bin' >> `echo $HOME`/yosys/BitMake/Makefile
echo >> `echo $HOME`/yosys/BitMake/Makefile
echo 'prog_sram: $(v_fname).bin' >> `echo $HOME`/yosys/BitMake/Makefile
echo '	icoprog -p < $(v_fname).bin' >> `echo $HOME`/yosys/BitMake/Makefile
cd `echo $HOME`/yosys/BitMake
sudo `echo $HOME`/yosys/./yosys -p 'script ascript.sh'
cd `echo $dir`
sudo rm -f `echo $HOME`/yosys/BitMake/test.c
echo '#include<wiringPi.h>' >> `echo $HOME`/yosys/BitMake/test.c
echo '#include<stdio.h>' >> `echo $HOME`/yosys/BitMake/test.c
echo 'int main (void)' >> `echo $HOME`/yosys/BitMake/test.c
echo '{' >> `echo $HOME`/yosys/BitMake/test.c
echo 'wiringPiSetup();' >> `echo $HOME`/yosys/BitMake/test.c
echo 'pinMode(27, INPUT);' >> `echo $HOME`/yosys/BitMake/test.c
echo 'int t;' >> `echo $HOME`/yosys/BitMake/test.c
echo 'for(int i=0; i<1; i++)' >> `echo $HOME`/yosys/BitMake/test.c
echo '{' >> `echo $HOME`/yosys/BitMake/test.c
echo 't=digitalRead(27);' >> `echo $HOME`/yosys/BitMake/test.c
echo 'if(t==HIGH)' >> `echo $HOME`/yosys/BitMake/test.c
echo '{' >> `echo $HOME`/yosys/BitMake/test.c
echo -n 'printf("<---------------------------Bitstream Upload Completed!------------------------>\\n<------------------------------------------------------------------------------>\\n<---------------------------FOR THE LOGIC DIAGRAM, TYPE:----------------------->\\n<------------------------------------------------------------------------------>\\nsudo qpdfview ' >> `echo $HOME`/yosys/BitMake/test.c
echo -n `echo $dir` >> `echo $HOME`/yosys/BitMake/test.c
echo -n '/' >> `echo $HOME`/yosys/BitMake/test.c
echo -n `echo $parent` >> `echo $HOME`/yosys/BitMake/test.c
echo -n '/' >> `echo $HOME`/yosys/BitMake/test.c
echo -n `echo $parent` >> `echo $HOME`/yosys/BitMake/test.c
echo -n '.pdf\\n<------------------------------------------------------------------------------>\\n<-----------------------------------OR CHECK:---------------------------------->\\n<------------------------------------------------------------------------------>\\n' >> `echo $HOME`/yosys/BitMake/test.c
echo -n `echo $dir` >> `echo $HOME`/yosys/BitMake/test.c
echo -n '/' >> `echo $HOME`/yosys/BitMake/test.c
echo -n `echo $parent` >> `echo $HOME`/yosys/BitMake/test.c
echo '\\n<------------------------------------------------------------------------------>\\n");}' >> `echo $HOME`/yosys/BitMake/test.c
echo 'else if(t==LOW)' >> `echo $HOME`/yosys/BitMake/test.c
echo '{' >> `echo $HOME`/yosys/BitMake/test.c
echo 'printf("<---------------------------Bitstream Upload Failed!--------------------------->\\n");}' >> `echo $HOME`/yosys/BitMake/test.c
echo '}' >> `echo $HOME`/yosys/BitMake/test.c
echo 'return 0;}' >> `echo $HOME`/yosys/BitMake/test.c
gcc -Wall -o `echo $HOME`/yosys/BitMake/progtest `echo $HOME`/yosys/BitMake/test.c -lwiringPi
sudo rm -f `echo $HOME`/yosys/BitMake/test.c
sudo chmod +x `echo $HOME`/yosys/BitMake/progtest
sudo dot -Tpdf `echo $HOME`/.yosys_show.dot -o `echo $dir`/`echo $parent`/`echo $parent`.pdf
sudo killall -s SIGKILL xdot
cd `echo $HOME`/yosys/BitMake
sudo make v_fname=`echo $dir`/`echo $parent`/`echo $parent`
cd `echo $dir`
sudo `echo $HOME`/yosys/BitMake/./progtest
sudo rm -f `echo $HOME`/yosys/BitMake/Makefile
sudo rm -f `echo $HOME`/yosys/BitMake/progtest
sudo rm -f `echo $HOME`/yosys/BitMake/ascript.sh
sudo rm -f `echo $dir`/`echo $parent`/`echo $parent`.asc `echo $dir`/`echo $parent`/`echo $parent`.bin `echo $dir`/`echo $parent`/`echo $parent`.blif `echo $dir`/`echo $parent`/`echo $parent`.dot 
sudo rm -f `echo $HOME`/.yosys_show.dot `echo $HOME`/.yosys_history `echo $HOME`/.yosys_show.dot.pid `echo $HOME`/.yosys_show.ps
exec bash




