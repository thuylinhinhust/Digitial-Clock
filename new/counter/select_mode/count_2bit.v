module count_2bit (
    input clk, rst_n,
    input ena_db,
    output reg [1:0] q
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) q <= 0;
        else if (!ena_db) q <= q + 1;
        else q <= q;
    end    

endmodule