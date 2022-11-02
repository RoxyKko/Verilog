module div_50m  (
    clk,
    clk_50khz,
    reset
);

input clk;
output reg clk_50khz;
input reset;

reg [31:0] cnt32;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        cnt32 <= 32'd0;
    end
    else
    begin
        if(cnt32 == 32'd999)
        begin
            cnt32 <= 32'd0;
        end
        else
        begin
            cnt32 <= cnt32 + 1;
        end
    end
end

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        clk_50khz <= 1'd0;
    end
    else if(cnt32 < 32'd500)
    begin
        clk_50khz <= 1'd1;
    end
    else 
    begin
        clk_50khz <= 1'd0;
    end
end

    
endmodule