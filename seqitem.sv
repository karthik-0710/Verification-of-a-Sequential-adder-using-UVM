
class seq_item extends uvm_sequence_item;
	rand bit [3:0] a;
	rand bit [3:0] b;
	bit[4:0] sum;

	`uvm_object_utils_begin(seq_item)
	`uvm_field_int(a,UVM_DEFAULT)
	`uvm_field_int(b,UVM_DEFAULT)
	`uvm_field_int(sum,UVM_DEFAULT)
	`uvm_object_utils_end

	function new(string name="seq_item");
		super.new(name);
	endfunction : new
endclass:seq_item
