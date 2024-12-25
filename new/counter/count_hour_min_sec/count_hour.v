module count_hour (
    input rst_n,
    input ena, ena_5hz,
    input ena_up, ena_dw,
    input [1:0] select_mode,
    input [5:0] min, sec,
    output reg [5:0] hour
);
    wire clk;
    assign clk = (select_mode == 2'b00) ? ena : ena_5hz;

    always @(posedge clk or negedge rst_n) begin
      if (!rst_n) hour <= 0;
      else begin
        if ((select_mode == 2'b00) && (min == 59) && (sec == 59)) begin
          if (hour == 23) hour <= 0;
          else            hour <= hour + 1;
        end
        else if (select_mode == 2'b11) begin
          if (!ena_up) begin
            if (hour == 23) hour <= 0;
            else            hour <= hour + 1;
          end
          else if (!ena_dw) begin
            if (hour == 0)  hour <= 23;
            else            hour <= hour - 1;
          end
          else hour <= hour;
        end
        else hour <= hour;
      end
    end

endmodule