import P::transaction;
class driver;
  
  //used to count the number of transactions
  int no_transactions;
  
  //creating virtual interface handle
  virtual intf vif;
  
  //creating mailbox handle
  mailbox gen2driv;
  
  //constructor
  function new(virtual intf vif,mailbox gen2driv);
    //getting the interface
    this.vif = vif;
    //getting the mailbox handles from  environment 
    this.gen2driv = gen2driv;
  endfunction
  
  //Reset task, Reset the Interface signals to default/initial values
  task reset;
    wait(vif.hreset);
    $display("[ DRIVER ] ----- Reset Started -----");
    vif.hsel <= 0;
    vif.haddr <= 0;
    vif.hwrite <= 0;
    vif.hsize <= 0;
    vif.hprot <= 0;
    vif.htrans <= 0;
    vif.hmastlock <= 0;
    vif.hready <= 0;
    vif.hwdata <= 0;
    vif.hburst<=0;
    
    wait(!vif.hreset);
    $display("[ DRIVER ] ----- Reset Ended   -----");
  endtask
  
  //drivers the transaction items to interface signals
  task main;
    forever begin
      transaction trans;
      gen2driv.get(trans);
      @(posedge vif.clk);
    vif.hsel <= trans.hsel;
    vif.haddr <= trans.haddr;
    vif.hwrite <= trans.hwrite;
    vif.hsize <= trans.hsize;
    vif.hprot <= trans.hprot;
    vif.htrans <= trans.htrans;
    vif.hmastlock <= trans.hmastlock;
    vif.hready <= trans.hready;
    vif.hwdata <= trans.hwdata;
    vif.hburst<=trans.hburst;

      @(posedge vif.hclk);
      trans.display("[ Driver ]");
      no_transactions++;
    end
  endtask
  
endclass
