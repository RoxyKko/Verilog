module div_50m  (
    clk,
    clk_50khz,
    reset
);

input clk;
output reg clk_50khz;
input reset;

reg [25:0] cnt26;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        cnt26 <= 26'd0;
    end
    else
    begin
        cnt26 <= cnt26 + 1;
    end
end

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        clk_50khz <= 1'd0;
    end
    else if(cnt26 == 26'd49_999_999)
    begin
        clk_50khz <= 1'd1;
    end
    else 
    begin
        clk_50khz <= 1'd0;
    end
end

    
endmodule