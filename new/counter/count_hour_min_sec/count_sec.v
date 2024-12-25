module count_sec (
    input rst_n,
    input ena, ena_5hz,
    input ena_up, ena_dw,
    input [1:0] select_mode,
    output reg [5:0] sec
);
    wire clk;
    assign clk = (select_mode == 2'b00) ? ena : ena_5hz;

    always @(posedge clk or negedge rst_n) begin
      if (!rst_n) sec <= 0;
      else begin
        if (select_mode == 2'b00) begin
          if (sec == 59) sec <= 0;
          else           sec <= sec + 1;
        end
        else if (select_mode == 2'b01) begin
          if (!ena_up) begin
            if (sec == 59) sec <= 0;
            else           sec <= sec + 1;
          end
          else if (!ena_dw) begin
            if (sec == 0)  sec <= 59;
            else           sec <= sec - 1;
          end
          else sec <= sec;
        end
        else sec <= sec;
      end
    end

endmodule