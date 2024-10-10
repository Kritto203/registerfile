module tb_register;

parameter CLK_HALF_PERIOD = 1;
parameter CLK_PERIOD = 2 * CLK_HALF_PERIOD;

reg clk;        
reg [15:0] D; 
reg [2:0] addre_wr;
reg [2:0] addre_rdA;
reg [2:0] addre_rdB;   
reg we; //ghi,doc       
wire [15:0] QA;
wire [15:0] QB;

registerfile DUT(
	.clk(clk), 
	.D(D), 
	.addre_wr(addre_wr), 
	.addre_rdA(addre_rdA), 
	.we(we), 
	.addre_rdB(addre_rdB), 
	.QA(QA), 
	.QB(QB)
	);

always begin : gen_clk
	#CLK_HALF_PERIOD;
	clk = !clk;
end

initial begin

	clk=0;        
	D=0; 
	addre_wr=0;
	addre_rdA=0;
	addre_rdB=0;   
	we=0; //ghi,doc 
end 

initial begin
	#(2*CLK_HALF_PERIOD);
	D= 16'd10;
	we=1;
	addre_wr=3'b001;
	#(4*CLK_PERIOD);
	D= 16'd8;
	addre_wr=3'b011;
	#(4*CLK_PERIOD);

	we=0;
	addre_rdA=3'b011;
	addre_rdB=3'b010; 
	#(4*CLK_PERIOD);

	$finish;

end
endmodule