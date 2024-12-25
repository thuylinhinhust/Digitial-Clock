module count_min (
    input rst_n,
    input ena, ena_5hz,
    input ena_up, ena_dw,
    input [1:0] select_mode,
    input [5:0] sec,
    output reg [5:0] min
);
    wire clk;
    assign clk = (select_mode == 2'b00) ? ena : ena_5hz;

    always @(posedge clk or negedge rst_n) begin
      if (!rst_n) min <= 0;
      else begin
        if ((select_mode == 2'b00) && (sec == 59)) begin
          if (min == 59) min <= 0;
          else           min <= min + 1;
        end
        else if (select_mode == 2'b10) begin
          if (!ena_up) begin
            if (min == 59) min <= 0;
            else           min <= min + 1;
          end
          else if (!ena_dw) begin
            if (min == 0)  min <= 59;
            else           min <= min - 1;
          end
          else min <= min;
        end
        else min <= min;
      end
    end

endmodule