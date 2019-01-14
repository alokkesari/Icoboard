# Digital Design using **Icoboard**

1. Clone this repository onto your system/RaspberryPi by:
  ```
  cd $HOME
  git clone https://www.github.com/alokkesari/Icoboard
  ```

2. Run `sudo chmod a+x -R Icoboard && cd Icoboard`.

3. **depinstall.sh**: Run this script file to install all the dependencies. This script file will take about 30 minutes, if the dependencies are not installed already.
  ```
  sudo ./depinstall.sh
  ```

4. **cp_automa.sh**: For creating a new project, run this script file and type in the name of the project module when prompted.
  ```
  sudo ./cp_automa.sh
  ```

5. **automa.sh**: For running synthesis, implementation, bitstream generation and flashing the FPGA runs, run this script file. Type in the name of the project when prompted. When the script prompts for the name of the top module, type in the name of the top module of your project. If the name of any other module is given as input to this prompt, it would only affect the schematic generation of the module, which can be found as a PDF file in the project directory created inside *Icoboard* directory, and not the flashing of the module onto the FPGA.
  ```
  sudo ./automa.sh
  ```

## Note:

* Running *cp_automa.sh* creates a project directory inside the Icoboard folder and opens up the verilog file and the physical constraints file for the project in a Geany editor window.

* Running *automa.sh*, apart from synthesis and implementation runs as mentioned above, generates the RTL schematic pdf file in the project directory.

* Example projects are also provided in the Icoboard repository. They can be run using the above mentioned procedures. Make sure that the project name and the module name that you're typing when prompted are same as that given in the example projects.

> *Contact ARK for doubts, queries, suggestions, etc., at arkesari@iith.ac.in or alok.kesari@yahoo.co.in.*
