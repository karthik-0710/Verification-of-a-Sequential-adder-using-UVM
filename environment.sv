
class env extends uvm_env;
`uvm_component_utils(env)
	scoreboard sc;
	agent a;
	seq_item s;

	function new(string name="env",uvm_component parent=null);
		super.new(name,parent);
	endfunction : new

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		sc=scoreboard::type_id::create("sc",this);
		a=agent::type_id::create("a",this);
		s=seq_item::type_id::create("s");
	endfunction : build_phase


	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		a.m.send.connect(sc.rec);
	endfunction : connect_phase
	
endclass : env
