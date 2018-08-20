dir=`pwd`
parent=$(basename "$dir")
echo 'Type the name of the top module:'
read topmod
sudo rm `echo $parent`.asc `echo $parent`.bin `echo $parent`.blif `echo $parent`.dot `echo $parent`.pdf ascript.sh
sudo rm /root/.yosys_show.dot /root/.yosys_history /root/.yosys_show.dot.pid /root/.yosys_show.ps
cd $HOME
cd yosys
sudo rm ascript.sh
echo $dir
echo -n 'read_verilog ' >> ascript.sh 
echo -n `echo $dir` >> ascript.sh
echo -n '/' >> ascript.sh
echo -n `echo $parent` >> ascript.sh
echo '.v' >> ascript.sh
echo 'write_ilang' >> ascript.sh
echo 'proc; opt' >> ascript.sh
echo -n 'show ' >> ascript.sh
echo `echo $topmod` >> ascript.sh
echo '.PHONY: default' >> Makefile
echo 'default: prog_sram' >> Makefile
echo >> Makefile
echo '$(v_fname).blif: $(v_fname).v' >> Makefile
echo -n '	yosys -p ' >> Makefile
echo -n "'" >> Makefile 
echo -n 'synth_ice40 -blif ' >> Makefile 
echo -n "\$(v_fname).blif" >> Makefile
echo -n "' " >> Makefile
echo '$(v_fname).v' >> Makefile
echo >> Makefile
echo '$(v_fname).asc: $(v_fname).blif $(v_fname).pcf' >> Makefile
echo '	arachne-pnr -d 8k -p $(v_fname).pcf -o $(v_fname).asc $(v_fname).blif' >> Makefile
echo >> Makefile
echo '$(v_fname).bin: $(v_fname).asc' >> Makefile
echo '	icetime -d hx8k -c 25 $(v_fname).asc' >> Makefile
echo '	icepack $(v_fname).asc $(v_fname).bin' >> Makefile
echo >> Makefile
echo 'prog_sram: $(v_fname).bin' >> Makefile
echo '	icoprog -p < $(v_fname).bin' >> Makefile
sudo cp `pwd`/Makefile `echo $dir`/Makefile
sudo rm Makefile
sudo ./yosys -p 'script ascript.sh'
sudo rm test.c
echo '#include<wiringPi.h>' >> test.c
echo '#include<stdio.h>' >> test.c
echo 'int main (void)' >> test.c
echo '{' >> test.c
echo 'wiringPiSetup();' >> test.c
echo 'pinMode(27, INPUT);' >> test.c
echo 'int t;' >> test.c
echo 'for(int i=0; i<1; i++)' >> test.c
echo '{' >> test.c
echo 't=digitalRead(27);' >> test.c
echo 'if(t==HIGH)' >> test.c
echo '{' >> test.c
echo -n 'printf("<---------------------------Bitstream Upload Completed!------------------------>\n<------------------------------------------------------------------------------>\n<---------------------------FOR THE LOGIC DIAGRAM, TYPE:----------------------->\n<------------------------------------------------------------------------------>\nsudo qpdfview ' >> test.c
echo -n `echo $dir` >> test.c
echo -n '/' >> test.c
echo -n `echo $parent` >> test.c
echo -n '.pdf\n<------------------------------------------------------------------------------>\n<-----------------------------------OR CHECK:---------------------------------->\n<------------------------------------------------------------------------------>\n' >> test.c
echo -n `echo $dir` >> test.c
echo '\n<------------------------------------------------------------------------------>\n");}' >> test.c
echo 'else if(t==LOW)' >> test.c
echo '{' >> test.c
echo 'printf("<---------------------------Bitstream Upload Failed!--------------------------->\n");}' >> test.c
echo '}' >> test.c
echo 'return 0;}' >> test.c
gcc -Wall -o progtest test.c -lwiringPi
sudo rm test.c
sudo chmod +x progtest
sudo cp /root/.yosys_show.dot `echo $dir`/`echo $parent`.dot
sudo rm /root/.yosys_show.dot /root/.yosys_history /root/.yosys_show.dot.pid /root/.yosys_show.ps
set -e
cd $dir
sudo dot -T pdf `echo $parent`.dot -o `echo $parent`.pdf
sudo killall -s SIGKILL xdot
sudo make v_fname=`echo $parent`
sudo /home/pi/yosys/./progtest
sudo rm /home/pi/yosys/progtest
sudo rm `echo $parent`.asc `echo $parent`.bin `echo $parent`.blif `echo $parent`.dot Makefile
exec bash




