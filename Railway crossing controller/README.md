Features
Train detection
Automatic gate control
Warning signal control
Safe gate operation
Synchronous digital design
Testbench-based simulation
Inputs
Input	Description
clk	Clock signal
reset	Resets the controller
train_detect	Indicates that a train is approaching
train_clear	Indicates that the train has passed
Outputs
Output	Description
gate_open	Indicates that the railway gate is open
gate_close	Indicates that the railway gate is closed
warning	Activates the warning signal
Working Principle

When a train is detected, the controller activates the warning signal and closes the railway gate. After the train has completely passed and the train_clear signal is received, the warning signal is deactivated and the gate is opened.

Project Files
railway_crossing_controller.v - Main Verilog design
railway_crossing_controller_tb.v - Testbench
expected_output.txt - Expected simulation output
Simulation

Using Icarus Verilog:

iverilog -o railway_sim railway_crossing_controller.v railway_crossing_controller_tb.v
vvp railway_sim
Applications
Railway level crossings
Automated railway gates
Railway safety systems
Industrial control systems