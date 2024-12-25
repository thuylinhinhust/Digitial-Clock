module led_display (
    input  [3:0] hour_tens, hour_units,
    input  [3:0] min_tens,  min_units,
    input  [3:0] sec_tens,  sec_units,
    input  [5:0] ena,
    output [6:0] led7, led6, led5, led4, led1, led0
);
    sseg_decoder hour10 (.number(hour_tens),  .ena(ena[5]), .sseg(led7));
    sseg_decoder hour1  (.number(hour_units), .ena(ena[4]), .sseg(led6));
    sseg_decoder min10  (.number(min_tens),   .ena(ena[3]), .sseg(led5));
    sseg_decoder min1   (.number(min_units),  .ena(ena[2]), .sseg(led4));
    sseg_decoder sec10  (.number(sec_tens),   .ena(ena[1]), .sseg(led1));
    sseg_decoder sec1   (.number(sec_units),  .ena(ena[0]), .sseg(led0));

endmodule