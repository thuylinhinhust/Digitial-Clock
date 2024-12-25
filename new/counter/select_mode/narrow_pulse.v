module narrow_pulse (
    input clk, rst_n,
    input d,
    output q
);
    reg q_ff;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) q_ff <= 0;
        else        q_ff <= d;
    end

    assign q = (~q_ff) | d;

endmodule