module registerfile (
    input wire clk,          
    input wire [15:0] D, 
    input wire [2:0] addre_wr,
    input wire [2:0] addre_rdA,
    input wire [2:0] addre_rdB,   
    input wire we, //ghi,doc       
    output reg [15:0] QA,
    output reg [15:0] QB     
);

wire [7:0] c;//wire connect output decoder with enreg
logic [15:0] t[7:0];//wire connect output reg with MUX
decoder3_8 d(.en(we), .A(addre_wr), .Y(c));
register r0(.clk(clk), .en(c[0]), .D(D), .Q(t[0]));
register r1(.clk(clk), .en(c[1]), .D(D), .Q(t[1]));
register r2(.clk(clk), .en(c[2]), .D(D), .Q(t[2]));
register r3(.clk(clk), .en(c[3]), .D(D), .Q(t[3]));
register r4(.clk(clk), .en(c[4]), .D(D), .Q(t[4]));
register r5(.clk(clk), .en(c[5]), .D(D), .Q(t[5]));
register r6(.clk(clk), .en(c[6]), .D(D), .Q(t[6]));
register r7(.clk(clk), .en(c[7]), .D(D), .Q(t[7]));
MUX8_1_16bit M0(.select(addre_rdA), .in(t), .out(QA));
MUX8_1_16bit M1(.select(addre_rdB), .in(t), .out(QB));

endmodule 