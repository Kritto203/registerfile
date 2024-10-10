module MUX8_1_16bit(
	input wire [2:0]select,
	input logic [15:0] in [7:0],
	output reg [15:0] out
);
always @(*) begin 
	case (select)
		3'b000: out = in[0];
		3'b001: out = in[1];
		3'b010: out = in[2];
		3'b011: out = in[3];
		3'b100: out = in[4];
		3'b101: out = in[5];
		3'b110: out = in[6];
		3'b111: out = in[7];
		default: out = 16'b0; 
	endcase
end
endmodule 
/* other method
module MUX8_1_16bit_array(
	input wire [2:0] select,       // 3-bit select signal to choose between 8 inputs
	input wire [15:0] in [7:0],    // 2D array for 8 inputs, each 16 bits wide
	output reg [15:0] out          // 16-bit output
);

always @(*) begin 
	out = in[select];   // Output is selected input from the array
end

endmodule
*/