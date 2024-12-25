module select_mode (
    input clk, rst_n,
    input btn,
    output [1:0] select_mode
);
    wire db_tick, ena_db;

    debounce_btn button_mode (.clk(clk), .rst_n(rst_n), .btn(btn), .db_tick(db_tick));
    narrow_pulse narrowing (.clk(clk), .rst_n(rst_n), .d(db_tick), .q(ena_db));
    count_2bit counting (.clk(clk), .rst_n(rst_n), .ena_db(ena_db), .q(select_mode));

endmodule