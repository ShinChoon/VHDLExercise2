Exercise Instruction
=================
Install Modelsim on Windows:
1. Go to  https://vhdlwhiz.com/free-vhdl-simulator-alternatives/
2. Choose Intel Quartus Prime Lite Edition Design Software for Windows
3. Choose Questa-Intel FPGA Edition in Individual Files
4. Install the Starter Edition
5. Create the license from: https://licensing.intel.com/psg/s/sales-signup-evaluationlicenses
6. Note: check NIC ID based on the terminal command : ipconfig /all, find the physical address which shows the Ethernet adapter Ethernet N
7. More details from https://vhdlwhiz.com/free-vhdl-simulator-alternatives/


```
cd simulations
use advms_17.1
vsim -do run_simulation.do
```