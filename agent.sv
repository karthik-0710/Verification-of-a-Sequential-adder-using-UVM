
class agent extends uvm_agent;
`uvm_component_utils(agent)
monitor m;
drv d;

uvm_sequencer #(seq_item) seqr;

	function new(string name="agent",uvm_component parent=null);
		super.new(name,parent);
	endfunction : new

	virtual function void build_phase (uvm_phase phase);
		super.build_phase(phase);
		m=monitor::type_id::create("m",this);
		d=drv::type_id::create("d",this);
		seqr=new("seqr",this);
	endfunction : build_phase

	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		d.seq_item_port.connect(seqr.seq_item_export);
	endfunction : connect_phase

endclass : agent
