interface intf(input logic hclk,hresetn);
  
  //declaring the signals

  logic hsel;
  logic [31:0] haddr;
  logic hwrite;
  logic [2:0] hsize;
  logic [2:0] hburst;
  logic [3:0] hprot;
  logic [1:0] htrans;
  logic hmastlock;
  logic hready;
  logic [31:0] hwdata;
  logic hreadyout;
  logic  hresp;
  logic  [31:0] hrdata;

endinterface

