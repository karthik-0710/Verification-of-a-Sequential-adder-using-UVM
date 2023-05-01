
class monitor extends uvm_monitor #(seq_item);
`uvm_component_utils(monitor)
seq_item s;
virtual seq_if sif;
uvm_analysis_port #(seq_item) send;

	function new(string name="monitor", uvm_component parent=null);
		super.new(name,parent);
	endfunction : new

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		s=seq_item::type_id::create("s");
		send=new("send",this);
		if(!uvm_config_db#(virtual seq_if)::get(this,"", "sif",sif ))
			`uvm_error("mon","unable able to access interface")
	endfunction : build_phase

	virtual task run_phase(uvm_phase phase);
		@(negedge sif.rst);
		forever begin
			repeat(2) @(posedge sif.clk);
			s.a=sif.a;
			s.b=sif.b;
			s.sum=sif.sum;
			`uvm_info("mon",$sformatf("a=%0d | b=%0d | sum=%0d",s.a,s.b,s.sum),UVM_NONE)
		end
		send.write(s);
	endtask : run_phase

endclass : monitor
