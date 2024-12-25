module counter (
    input clk, rst_n,
    input ena, ena_5hz,
    input btn_mode, btn_up, btn_dw,
    output [1:0] select_mode,
    output [5:0] hour, min, sec
);
    wire db_up, db_dw;

    debounce_btn button_up (.clk(clk), .rst_n(rst_n), .btn(btn_up), .db_tick(db_up));
    debounce_btn button_dw (.clk(clk), .rst_n(rst_n), .btn(btn_dw), .db_tick(db_dw));
    select_mode sel (.clk(clk), .rst_n(rst_n), .btn(btn_mode), .select_mode(select_mode));
    count_hour_min_sec count (.rst_n(rst_n), .ena(ena), .ena_5hz(ena_5hz), .ena_up(db_up), .ena_dw(db_dw), .select_mode(select_mode), .hour(hour), .min(min), .sec(sec));

endmodule