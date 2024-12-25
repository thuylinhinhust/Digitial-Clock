module frequency_division (
    input clk,
    input rst_n,
    output reg ena_1hz,
    output reg ena_5hz,
    output reg ena_20hz,
    output reg ena_50hz,
    output reg ena_100hz
);
    reg [24:0] count_1hz;
    reg [22:0] count_5hz;
    reg [20:0] count_20hz;
    reg [18:0] count_50hz;
    reg [17:0] count_100hz;

    //clk_1hz
    always @(posedge clk or negedge rst_n) begin
      if (!rst_n) begin
        count_1hz <= 0;
        ena_1hz   <= 0;
      end
      else begin
        if (count_1hz == 24_999_999) begin
                count_1hz <= 0;
                ena_1hz   <= ~ena_1hz;
        end
        else begin
                count_1hz <= count_1hz + 1;
                ena_1hz   <= ena_1hz;
        end      
      end
    end

    //clk_5hz
    always @(posedge clk or negedge rst_n) begin
      if (!rst_n) begin
        count_5hz <= 0;
        ena_5hz   <= 0;
      end
      else begin
        if (count_5hz == 4_999_999) begin
                count_5hz <= 0;
                ena_5hz   <= ~ena_5hz;
        end
        else begin
                count_5hz <= count_5hz + 1;
                ena_5hz   <= ena_5hz;
        end      
      end
    end

    //clk_20hz
    always @(posedge clk or negedge rst_n) begin
      if (!rst_n) begin
        count_20hz <= 0;
        ena_20hz   <= 0;
      end
      else begin
        if (count_20hz == 1_249_999) begin
                count_20hz <= 0;
                ena_20hz   <= ~ena_20hz;
        end
        else begin
                count_20hz <= count_20hz + 1;
                ena_20hz   <= ena_20hz;
        end      
      end
    end

    //clk_50hz
    always @(posedge clk or negedge rst_n) begin
      if (!rst_n) begin
        count_50hz <= 0;
        ena_50hz   <= 0;
      end
      else begin
        if (count_50hz == 499_999) begin
                count_50hz <= 0;
                ena_50hz   <= ~ena_50hz;
        end
        else begin
                count_50hz <= count_50hz + 1;
                ena_50hz   <= ena_50hz;
        end      
      end
    end

    //clk_100hz
    always @(posedge clk or negedge rst_n) begin
      if (!rst_n) begin
        count_100hz <= 0;
        ena_100hz   <= 0;
      end
      else begin
        if (count_100hz == 249_999) begin
                count_100hz <= 0;
                ena_100hz   <= ~ena_100hz;
        end
        else begin
                count_100hz <= count_100hz + 1;
                ena_100hz   <= ena_100hz;
        end      
      end
    end

endmodule