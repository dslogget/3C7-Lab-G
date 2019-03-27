// Listing 4.19
module stop_watch_test
   (
    input wire clk,
    input wire up, down, clr, //added up and down
    output wire [3:0] an,
    output wire [7:0] sseg
   );

   // signal declaration
   wire [3:0]  d2, d1, d0, d3;

   // instantiate 7-seg LED display module
   disp_hex_mux disp_unit
      (.clk(clk), .reset(1'b0),
       .hex3(d3), .hex2(d2), .hex1(d1), .hex0(d0), //added d3
       .dp_in(4'b0101), .an(an), .sseg(sseg));//added 4th dp

   // instantiate stopwatch
   stop_watch_if counter_unit
      (.clk(clk), .up(up), .down(down), .clr(clr),
       .d3(d3), .d2(d2), .d1(d1), .d0(d0) );//added d3
       
   //disable the unused display by setting it to 1

endmodule
