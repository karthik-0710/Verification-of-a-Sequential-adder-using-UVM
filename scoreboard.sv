
class scoreboard extends uvm_scoreboard #(seq_item);
`uvm_component_utils(scoreboard)
	seq_item s;
	uvm_analysis_imp #(seq_item,scoreboard) rec;

	function new(string name="scoreboard",uvm_component parent=null);
		super.new(name,parent);
	endfunction : new

	virtual function void build_phase(uvm_phase phase);
		s=seq_item::type_id::create("s");
		rec=new("rec",this);
	endfunction : build_phase

	virtual function void write(input seq_item data);
		s=data;
		`uvm_info("data recieved in sco",$sformatf("a=%0d | b=%0d | sum=%0d",s.a,s.b,s.sum),UVM_NONE)
		if(s.sum==s.a+s.b)
			`uvm_info("sco","Test Passed",UVM_NONE)
		else
			`uvm_info("sco","Test Failed",UVM_NONE)
	endfunction : write

endclass : scoreboard
