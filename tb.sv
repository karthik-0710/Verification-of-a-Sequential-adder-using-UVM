module tb();
reg clk,rst;
reg [3:0] a,b;
wire [4:0] sum;

seq_adder tb(.clk(clk),.rst(rst),.a(a),.b(b),.sum(sum));

initial begin
	clk=0;
end

always #5 clk=~clk;

initial begin
	monitor("clk=%0d | rst=%0d | a=%0d | b=%0d | sum=%0d",clk,rst,a,b,sum);
	rst=0;
	#5; a=10; b=10;
	#5; a=15; b=15;
end

initial begin
	#100;
	$finish;
end

endmodule