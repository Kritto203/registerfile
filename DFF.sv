module DFF(
    input wire clk,
    input wire D,
    output reg Q,
    output reg Qn
);
    reg [1:0] c; 

    always @(posedge clk) begin
        c[1] <= ~D;  
        c[0] <= D;   
    end
    assign Q = ~(Qn & c[1]); 
    assign Qn = ~(Q & c[0]);
endmodule

