class transaction;
  
  //declaring the transaction items
  rand bit hsel;
  rand bit [31:0] haddr;
  rand bit hwrite;
  rand bit [2:0] hsize;
  rand bit [3:0] hprot;
  rand bit [1:0] htrans;
  rand bit hmastlock;
  rand bit hready;
  rand bit [31:0] hwdata;
  bit [2:0] hburst=3'b000;
  bit hreadyout;
  bit  hresp;
  bit  [31:0] hrdata;

  function void display(string name);
    $display("-------------------------");
    $display("- %s ",name);
    $display("-------------------------");
   // $display("- enadle = %0d, dina = %0d, dinb = %0d, addr = %0d, wr= %0d, slave_sel= %0d",enable,dina,dinb, addr,wr,slave_sel);
  //  $display("- dout = %0d",dou);
    $display("-------------------------");
  endfunction
endclass
