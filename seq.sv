
class seq extends uvm_sequence #(seq_item);
	`uvm_object_utils(seq)
	seq_item s;

	function new(string name="seq");
		super.new(name);
	endfunction : new

	virtual task body();
		s=seq_item::type_id::create("s");
		repeat(5) begin
			start_item(s);
			s.randomize();
			`uvm_info("seq",$sformatf("a=%0d | b=%0d",s.a,s.b),UVM_NONE)
			finish_item(s);
		end
	endtask : body	

endclass : seq