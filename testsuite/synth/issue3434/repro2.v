module repro2 (input s, input [3:0] a, output reg [3:0] y);
  always @*
    (* parallel_case *) if (s)
      y = a;
    else
      y = 4'b0000;
endmodule
