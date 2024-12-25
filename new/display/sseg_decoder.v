module sseg_decoder (
    input [3:0] number,
    input ena,
    output [6:0] sseg
);
    reg [6:0] sseg_tmp;

    always @(number) begin
        case (number)
            4'd0: sseg_tmp = 7'b0000001; //abcdefg  
            4'd1: sseg_tmp = 7'b1001111;
            4'd2: sseg_tmp = 7'b0010010;
            4'd3: sseg_tmp = 7'b0000110;
            4'd4: sseg_tmp = 7'b1001100;
            4'd5: sseg_tmp = 7'b0100100;
            4'd6: sseg_tmp = 7'b0100000;
            4'd7: sseg_tmp = 7'b0001111;
            4'd8: sseg_tmp = 7'b0000000;
            4'd9: sseg_tmp = 7'b0000100;
            default: sseg_tmp = 7'b1111111;
        endcase
    end

    assign sseg = (ena) ? sseg_tmp : 7'b1111111;
    
endmodule