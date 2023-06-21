class scoreboard;
   
  //creating mailbox handle
  mailbox mon2scb;
  
  //used to count the number of transactions
  int no_transactions;
  
  //constructor
  function new(mailbox mon2scb);
    //getting the mailbox handles from  environment 
    this.mon2scb = mon2scb;
  endfunction
  
  //Compares the Actual result with the expected result
  // ASSUMPTION: first cycle has htrans = IDLE
  task main;
    transaction trans, prev;
    prev.hsel <= 0;
    prev.haddr <= 0;
    prev.hwrite <= 0;
    hsize <= 0;
    prev.hprot <= 0;
    prev.htrans <= 0;
    prev.hmastlock <= 0;
    prev.hready <= 1'b1;
    prev.hwdata <= 0;
    prev.hburst <= 0;
    prev.hreadyout <= 1'b1;
    prev.hresp <= 0;
    prev.hrdata <= 0;

    forever begin
      mon2scb.get(trans);
      if (trans.hrans != 2'b00 && trans.htrans != 2'b01) begin // Do nothing if Transcation is IDLE or BUSY
        case (trans.hburst)
          3'b000: // Single transfer
          3'b001: // INCR
          3'b010: // WRAP4
          3'b011: // INCR4
          3'b100: // WRAP8
          3'b101: // INCR8
          3'b110: // WRAP16
          3'b111: // INCR16
          default: ;
        endcase
      end;
      no_transactions++;
      trans.display("[ Scoreboard ]");
      prev = trans;
    end
  endtask

  function single_transfer(transaction prev, transaction trans);
    ;
    
  endfunction
  
endclass