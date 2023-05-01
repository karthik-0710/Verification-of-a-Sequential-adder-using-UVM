`include "uvm_macros.svh"
import uvm_pkg::*;

`include "seqitem.sv"
`include "seq.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module tb();
	seq_if sif();

	initial begin
		sif.clk=0;
		sif.rst=0;
	end

	always #10 sif.clk=~sif.clk;
	
	seq_adder dut(.clk(sif.clk),.rst(sif.rst),.a(sif.a),.b(sif.b),.sum(sif.sum));

	initial begin
		uvm_config_db #(virtual seq_if)::set(null,"uvm_test_top.e.a*","sif",sif);
		run_test("test");
	end

endmodule : tb

interface seq_if();
	logic clk;
	logic rst;
	logic [3:0] a;
	logic [3:0] b;
	logic [4:0] sum;
endinterface
