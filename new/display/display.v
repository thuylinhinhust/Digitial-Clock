module display (
    input  [3:0] hour_tens, hour_units,
    input  [3:0] min_tens,  min_units,
    input  [3:0] sec_tens,  sec_units,
    input  [1:0] select_mode,
    output [6:0] led7, led6, led5, led4, led1, led0
);
    wire [5:0] ena;

    mux_4to1_6bit mux_6bit (.i0(6'b11_11_11), .i1(6'b00_00_11), .i2(6'b00_11_00), .i3(6'b11_00_00), .select(select_mode), .out_mux(ena));
    led_display led (.hour_tens(hour_tens), .hour_units(hour_units), .min_tens(min_tens), .min_units(min_units), .sec_tens(sec_tens), .sec_units(sec_units), .ena(ena), .led7(led7), .led6(led6), .led5(led5), .led4(led4), .led1(led1), .led0(led0));

endmodule