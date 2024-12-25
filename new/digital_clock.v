module digital_clock (
    input clk,
    input  [3:0] btn,
    input  [1:0] sw,
    output [6:0] led7, led6, led5, led4, led1, led0
);
    wire ena, ena_5hz;
    wire [1:0] select_mode;
    wire [5:0] hour, min, sec;
    wire [3:0] hour_tens, hour_units, min_tens, min_units, sec_tens, sec_units;

    frequency_generator gen_freq (.clk(clk), .rst_n(btn[0]), .sw(sw), .ena(ena), .ena_5hz(ena_5hz));
    counter count (.clk(clk), .rst_n(btn[0]), .ena(ena), .ena_5hz(ena_5hz), .btn_mode(btn[1]), .btn_up(btn[2]), .btn_dw(btn[3]), .select_mode(select_mode), .hour(hour), .min(min), .sec(sec));
    hex_to_bcd hex2bcd (.sec(sec), .min(min), .hour(hour), .sec_tens(sec_tens), .sec_units(sec_units), .min_tens(min_tens), .min_units(min_units), .hour_tens(hour_tens), .hour_units(hour_units));
    display displaying (.sec_tens(sec_tens), .sec_units(sec_units), .min_tens(min_tens), .min_units(min_units), .hour_tens(hour_tens), .hour_units(hour_units), .select_mode(select_mode), .led7(led7), .led6(led6), .led5(led5), .led4(led4), .led1(led1), .led0(led0));

endmodule