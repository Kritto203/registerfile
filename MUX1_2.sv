module MUX1_2(
	input wire select,
	input wire in0,
    input wire in1,
	output reg out
);
always @(*) begin 
	case (select)
		1'b0: out = in0;
		1'b1: out = in1;
		default: out = 1'b0; 
	endcase
end
endmodule 