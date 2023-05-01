module seq_adder(clk,rst,a,b,sum);
input clk,rst;
input [3:0] a,b;
output reg [4:0] sum;

	always @(posedge clk) begin
		if(rst==1)
			sum<=4'b0;
		else
			sum<=a+b;
	end
endmodule


