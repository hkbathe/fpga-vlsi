`timescale 1ns / 1ps
 
module mux4_1(
    input A,
    input B,
    input C,
    input D,
    input [1:0] Select,
    output Y
    );
assign Y=Select[1]?(Select[0]?D:C):(Select[0]?B:A);
endmodule
