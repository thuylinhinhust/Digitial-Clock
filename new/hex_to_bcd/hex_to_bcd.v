module hex_to_bcd (
    input  [5:0] sec, min, hour,
    output [3:0] sec_tens, sec_units,
    output [3:0] min_tens, min_units,
    output [3:0] hour_tens, hour_units
);
    hex_to_bcd_6bit secs  (.hex(sec),  .tens(sec_tens),  .units(sec_units));
    hex_to_bcd_6bit mins  (.hex(min),  .tens(min_tens),  .units(min_units));
    hex_to_bcd_6bit hours (.hex(hour), .tens(hour_tens), .units(hour_units));

endmodule