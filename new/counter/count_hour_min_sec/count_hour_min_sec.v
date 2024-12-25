module count_hour_min_sec (
    input rst_n,
    input ena, ena_5hz, 
    input ena_up, ena_dw,
    input  [1:0] select_mode,
    output [5:0] hour, min, sec
);
    count_hour hours (.rst_n(rst_n), .ena(ena), .ena_5hz(ena_5hz), .ena_up(ena_up), .ena_dw(ena_dw), .select_mode(select_mode), .min(min), .sec(sec), .hour(hour));
    count_min  mins  (.rst_n(rst_n), .ena(ena), .ena_5hz(ena_5hz), .ena_up(ena_up), .ena_dw(ena_dw), .select_mode(select_mode), .sec(sec), .min(min));
    count_sec  secs  (.rst_n(rst_n), .ena(ena), .ena_5hz(ena_5hz), .ena_up(ena_up), .ena_dw(ena_dw), .select_mode(select_mode), .sec(sec));

endmodule