module mux_4to1_6bit (
    input [5:0] i0, i1, i2, i3,
    input [1:0] select,
    output reg [5:0] out_mux 
);
    always @(i0, i1, i2, i3, select) begin
        case (select)
            2'b00: out_mux = i0;
            2'b01: out_mux = i1;
            2'b10: out_mux = i2;
            2'b11: out_mux = i3;
            default: out_mux = i0;
        endcase
    end
endmodule