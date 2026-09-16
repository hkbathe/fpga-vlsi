    `timescale 1ns / 1ps
    `timescale 1ns / 1ps
    module testbench_mux4_1;
    
      reg A, B, C, D;
      reg [1:0] Select;
      wire Y;
    
      mux4_1 uut (
        .A(A), 
        .B(B), 
        .C(C), 
        .D(D), 
        .Select(Select), 
        .Y(Y)
  );

  initial begin
    A = 1; B = 0; C = 0; D = 0; Select = 2'b00;
    #100;
    
    A = 0; B = 1; C = 0; D = 0; Select = 2'b01;
    #100;
    
    A = 1; B = 0; C = 1; D = 0; Select = 2'b10;
    #100; 
    
    A = 0; B = 0; C = 0; D = 1; Select = 2'b11;
    #100;
    
    $finish; 
  end

endmodule
