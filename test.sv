
class test extends uvm_test;
	`uvm_component_utils(test)
	seq sq;
	env e;

	function new(string name="test",uvm_component parent=null);
		super.new(name,parent);
	endfunction : new

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		e=env::type_id::create("e",this);
		sq=seq::type_id::create("sq");
	endfunction : build_phase

	virtual task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		sq.start(e.a.seqr);
		phase.drop_objection(this);
	endtask : run_phase

endclass : test
