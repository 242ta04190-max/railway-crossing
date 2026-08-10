`timescale 1ns/1ps

module railway_crossing_controller_tb;

reg clk;
reg reset;
reg train_detect;
reg train_clear;

wire gate_open;
wire gate_close;
wire warning;

railway_crossing_controller uut (
    .clk(clk),
    .reset(reset),
    .train_detect(train_detect),
    .train_clear(train_clear),
    .gate_open(gate_open),
    .gate_close(gate_close),
    .warning(warning)
);

always #5 clk = ~clk;

initial begin

    $monitor(
        "Time=%0t | Train Detect=%b | Train Clear=%b | Gate Open=%b | Gate Close=%b | Warning=%b",
        $time,
        train_detect,
        train_clear,
        gate_open,
        gate_close,
        warning
    );

    clk = 0;
    reset = 1;
    train_detect = 0;
    train_clear = 0;

    #10;

    reset = 0;

    // Normal condition
    #20;

    // Train approaches
    train_detect = 1;
    #10;
    train_detect = 0;

    // Train is crossing
    #30;

    // Train has passed
    train_clear = 1;
    #10;
    train_clear = 0;

    // Return to normal
    #20;

    $display("Simulation completed successfully.");
    $finish;

end

endmodule