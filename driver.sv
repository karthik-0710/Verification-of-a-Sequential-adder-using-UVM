
class drv extends uvm_driver #(seq_item);
`uvm_component_utils(drv)
seq_item s;
virtual seq_if sif;

	function new(string name="drv", uvm_component parent=null);
		super.new(name,parent);
	endfunction : new

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		s=seq_item::type_id::create("s");
		if(!uvm_config_db#(virtual seq_if)::get(this,"","sif",sif)) //uvm_test_top
			`uvm_error("drv","unable to access interface")
	endfunction : build_phase

	task reset_dut();
		sif.rst<=1'b1;
		sif.a<=4'b0;
		sif.b=4'b0;
		repeat(5) @(posedge sif.clk);
		sif.rst<=1'b0;
		`uvm_info("drv","reset done",UVM_NONE)
	endtask : reset_dut

	virtual task run_phase(uvm_phase phase);
		reset_dut();
		forever begin
			seq_item_port.get_next_item(s);
			sif.a<=s.a;
			sif.b<=s.b;
			`uvm_info("drv",$sformatf("a=%0d | b=%0d",s.a,s.b),UVM_NONE)
			seq_item_port.item_done();
			repeat(2) @(posedge sif.clk);
		end

	endtask : run_phase
endclass : drv
