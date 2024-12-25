module hex_to_bcd_6bit (
    input  [5:0] hex,
    output [3:0] tens, units
);
    assign tens[3] = 1'b0;
    assign tens[2] = (hex[5] & hex[4] & ~hex[3]) | (hex[5] & ~hex[4] & hex[3]) | (hex[5] & hex[4] & ~hex[2]);
    assign tens[1] = (~hex[5] & hex[4] & hex[3]) | (hex[5] & ~hex[4] & ~hex[3]) | (~hex[5] & hex[4] & hex[2]);
    assign tens[0] = (hex[5] & ~hex[4] & ~hex[3]) | (hex[5] & hex[4] & hex[3] & ~hex[2]) | (hex[5] & hex[4] & ~hex[3] & hex[2]) | (~hex[5] & hex[4] & ~hex[3] & ~hex[2]) | (~hex[5] & ~hex[4] & hex[3] & hex[2]) | (hex[4] & ~hex[3] & ~hex[2] & hex[1]) | (~hex[5] & hex[3] & hex[2] & hex[1]) | (~hex[5] & ~hex[4] & hex[3] & hex[1]);

    assign units[3] = (~hex[5] & ~hex[4] & hex[3] & ~hex[2] & ~hex[1]) | (~hex[5] & hex[4] & hex[3] & hex[2] & ~hex[1]) | (~hex[5] & hex[4] & ~hex[3] & ~hex[2] & hex[1]) | (hex[5] & hex[4] & ~hex[3] & ~hex[2] & ~hex[1]) | (hex[5] & hex[4] & hex[3] & ~hex[2] & hex[1]) | (hex[5] & ~hex[4] & ~hex[3] & hex[2] & hex[1]);
    assign units[2] = (~hex[4] & ~hex[3] & hex[2] & ~hex[1]) | (hex[5] & ~hex[4] & ~hex[3] & ~hex[2] & hex[1]) | (hex[5] & hex[4] & ~hex[3] & hex[2] & hex[1]) | (hex[5] & ~hex[4] & hex[3] & hex[2]) | (~hex[5] & hex[4] & ~hex[2] & ~hex[1]) | (~hex[5] & ~hex[4] & hex[2] & hex[1]) | (hex[4] & hex[3] & ~hex[2] & ~hex[1]) | (~hex[5] & hex[4] & hex[3] & ~hex[2]);
    assign units[1] = (~hex[5] & ~hex[4] & ~hex[3] & hex[1]) | (hex[5] & ~hex[4] & hex[3] & hex[1]) | (hex[5] & ~hex[4] & ~hex[3] & ~hex[1]) | (~hex[5] & ~hex[4] & hex[3] & hex[2] & ~hex[1]) | (~hex[5] & hex[4] & hex[3] & ~hex[2] & hex[1]) | (~hex[5] & hex[4] & ~hex[3] & ~hex[2] & ~hex[1]) | (~hex[5] & hex[4] & ~hex[3] & hex[2] & hex[1]) | (hex[5] & hex[4] & hex[3] & ~hex[2] & ~hex[1]) | (hex[5] & hex[4] & ~hex[3] & hex[2] & ~hex[1]);
    assign units[0] = (~hex[2] & hex[0]) | (~hex[5] & hex[0]) | (~hex[4] & hex[0]) | (hex[4] & ~hex[3] & hex[0]);

endmodule
