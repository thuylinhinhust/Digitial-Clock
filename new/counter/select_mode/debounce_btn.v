module debounce_btn #(parameter MAX = 1_000_000) (
  input clk, rst_n,
  input btn,
  output reg db_tick
);
  parameter [1:0] ZERO = 2'b00, WAIT1 = 2'b01, ONE = 2'b10, WAIT0 = 2'b11;
  reg [1:0] cs, ns;
  reg [19:0] count;

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      count <= 0;
      cs <= ONE;
    end
    else begin
      cs <= ns; 
      if ((cs == WAIT0 || cs == WAIT1) && (count < MAX)) count <= count + 1;
      else count <= 0;
    end
  end

  always @(cs or btn or count) begin
    case (cs)
      ZERO: begin
        db_tick = 0;
        if (btn) ns = WAIT1;
        else     ns = ZERO;
      end
      WAIT1: begin
        db_tick = 0;
        if (btn && (count == MAX - 1)) begin 
          ns = ONE;
        end
        else if (!btn && (count == MAX - 1)) begin 
          ns = ZERO;
        end
        else ns = WAIT1;
      end
      ONE: begin
        db_tick = 1;
        if (!btn) ns = WAIT0;
        else      ns = ONE;
      end 
      WAIT0: begin
        db_tick = 1;
        if (!btn && (count == MAX - 1)) begin
          ns = ZERO;
        end
        else if (btn && (count == MAX - 1)) begin 
          ns = ONE;
        end
        else ns = WAIT0;
      end
      default: begin
        db_tick = 1; 
        ns = ONE;
      end
    endcase   
  end

endmodule