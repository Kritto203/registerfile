module register (
    input wire clk,          
    input wire [15:0] D,     // 16-bit 
    input wire en,           
    output reg [15:0] Q     
);

    reg [15:0] Q_internal;   // Internal signal to avoid conflicts

    wire [15:0] c;           // MUX outputs

    // Connect MUXes and DFFs for each bit
    MUX1_2 M15(.select(en), .in0(Q_internal[15]), .in1(D[15]), .out(c[15]));
    DFF D15(.clk(clk), .D(c[15]), .Q(Q_internal[15]),.Qn());

    MUX1_2 M14(.select(en), .in0(Q_internal[14]), .in1(D[14]), .out(c[14]));
    DFF D14(.clk(clk), .D(c[14]), .Q(Q_internal[14]), .Qn());

    MUX1_2 M13(.select(en), .in0(Q_internal[13]), .in1(D[13]), .out(c[13]));
    DFF D13(.clk(clk), .D(c[13]), .Q(Q_internal[13]), .Qn());

    MUX1_2 M12(.select(en), .in0(Q_internal[12]), .in1(D[12]), .out(c[12]));
    DFF D12(.clk(clk), .D(c[12]), .Q(Q_internal[12]), .Qn());

    MUX1_2 M11(.select(en), .in0(Q_internal[11]), .in1(D[11]), .out(c[11]));
    DFF D11(.clk(clk), .D(c[11]), .Q(Q_internal[11]), .Qn());

    MUX1_2 M10(.select(en), .in0(Q_internal[10]), .in1(D[10]), .out(c[10]));
    DFF D10(.clk(clk), .D(c[10]), .Q(Q_internal[10]), .Qn());

    MUX1_2 M9(.select(en), .in0(Q_internal[9]), .in1(D[9]), .out(c[9]));
    DFF D9(.clk(clk), .D(c[9]), .Q(Q_internal[9]), .Qn());

    MUX1_2 M8(.select(en), .in0(Q_internal[8]), .in1(D[8]), .out(c[8]));
    DFF D8(.clk(clk), .D(c[8]), .Q(Q_internal[8]), .Qn());

    MUX1_2 M7(.select(en), .in0(Q_internal[7]), .in1(D[7]), .out(c[7]));
    DFF D7(.clk(clk), .D(c[7]), .Q(Q_internal[7]), .Qn());

    MUX1_2 M6(.select(en), .in0(Q_internal[6]), .in1(D[6]), .out(c[6]));
    DFF D6(.clk(clk), .D(c[6]), .Q(Q_internal[6]), .Qn());

    MUX1_2 M5(.select(en), .in0(Q_internal[5]), .in1(D[5]), .out(c[5]));
    DFF D5(.clk(clk), .D(c[5]), .Q(Q_internal[5]), .Qn());

    MUX1_2 M4(.select(en), .in0(Q_internal[4]), .in1(D[4]), .out(c[4]));
    DFF D4(.clk(clk), .D(c[4]), .Q(Q_internal[4]), .Qn());

    MUX1_2 M3(.select(en), .in0(Q_internal[3]), .in1(D[3]), .out(c[3]));
    DFF D3(.clk(clk), .D(c[3]), .Q(Q_internal[3]), .Qn());

    MUX1_2 M2(.select(en), .in0(Q_internal[2]), .in1(D[2]), .out(c[2]));
    DFF D2(.clk(clk), .D(c[2]), .Q(Q_internal[2]), .Qn());

    MUX1_2 M1(.select(en), .in0(Q_internal[1]), .in1(D[1]), .out(c[1]));
    DFF D1(.clk(clk), .D(c[1]), .Q(Q_internal[1]), .Qn());

    MUX1_2 M0(.select(en), .in0(Q_internal[0]), .in1(D[0]), .out(c[0]));
    DFF D0(.clk(clk), .D(c[0]), .Q(Q_internal[0]), .Qn());

    // Update Q output 
    always @(posedge clk) begin
        Q <= Q_internal;  
    end

endmodule
