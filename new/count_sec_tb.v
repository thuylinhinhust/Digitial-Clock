module count_sec_tb ();
    reg clk, rst_n;
    reg ena, ena_5hz;
    reg ena_up, ena_dw;
    reg  [1:0] select_mode;
    wire [5:0] sec;

    count_sec dut (.clk(clk), .rst_n(rst_n), .ena(ena), .ena_5hz(ena_5hz), .ena_up(ena_up), .ena_dw(ena_dw), .select_mode(select_mode), .sec(sec));

    initial begin
      clk = 0;
      forever #1 clk = ~clk;
    end

    initial begin
      ena = 0;
      forever #10 ena = ~ena;
    end

    initial begin
      ena_5hz = 0;
      forever #2 ena_5hz = ~ena_5hz;
    end

    initial begin
        rst_n = 0;
        #12 rst_n = 1;
    end

    initial begin
      select_mode = 2'b00;
      #200 select_mode = 2'b10;
      #200 select_mode = 2'b01; ena_dw = 1;
      #1000 $finish;
    end

endmodule