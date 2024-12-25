module frequency_generator (
    input clk, rst_n,
    input [1:0] sw,
    output ena, ena_5hz
);
    wire ena_1hz, ena_20hz, ena_50hz, ena_100hz;

    frequency_division freq_divide (.clk(clk), .rst_n(rst_n), .ena_1hz(ena_1hz), .ena_5hz(ena_5hz), .ena_20hz(ena_20hz), .ena_50hz(ena_50hz), .ena_100hz(ena_100hz));
    mux_4to1 muxs (.i0(ena_1hz), .i1(ena_20hz), .i2(ena_50hz), .i3(ena_100hz), .select(sw), .out_mux(ena));

endmodule