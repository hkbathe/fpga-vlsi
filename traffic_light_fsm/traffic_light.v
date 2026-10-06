`timescale 1ns / 1ps

module traffic_light_tb;

    reg clk;
    reg reset;
    wire [1:0] ns_light;
    wire [1:0] ew_light;

    // Instantiate the module
    traffic_light dut (
        .clk(clk),
        .reset(reset),
        .ns_light(ns_light),
        .ew_light(ew_light)
    );

    // Clock generator: toggles every 10 ns (period = 20 ns)
    always #10 clk = ~clk;

    initial begin
        clk   = 0;
        reset = 1;

        // Release reset after 25 ns
        #25 reset = 0;

        // Print outputs on console whenever they change
        $monitor("Time=%3t | NS=%b | EW=%b (00=Green, 01=Yellow, 10=Red)", 
                 $time, ns_light, ew_light);

        // Run for 160 ns, then finish
        #160 $finish;
    end

endmodule