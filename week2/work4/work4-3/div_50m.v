module div_50m  (
    clk,
    clk_50khz,
    reset
);

input clk;
output reg clk_50khz;
input reset;

reg [9:0] cnt10;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        cnt10 <= 20'd0;
    end
    else
    begin
        if(cnt10 == 9'd999)
        begin
            cnt10 <= 10'd0;
        end
        else
        begin
            cnt10 <= cnt10 + 1;
        end
    end
end

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        clk_50khz <= 1'd0;
    end
    else if(cnt10 < 10'd500)
    begin
        clk_50khz <= 1'd1;
    end
    else 
    begin
        clk_50khz <= 1'd0;
    end
end

    
endmodule