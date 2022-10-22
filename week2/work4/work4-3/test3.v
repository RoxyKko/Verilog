//使用分频器输出a：1hz，b：10hz验证实验3双路选择器
module test3 (
    clk,
    reset,
    clk1hz,
    clk10hz,
    switch,
    out
);
input clk;
input reset;
input switch;
output reg clk1hz;
output reg clk10hz;
output reg out;

//分频器1输出1hz
reg [25:0] cnt26;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        cnt26 <= 26'd0;
    end
    else if(cnt26 == 26'd49_999_999)
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
        clk1hz <= 1'd0;
    end
    else if(cnt26 < 26'd25_000_000)
    begin
        clk1hz <= 1'd1;
    end
    else 
    begin
        clk1hz <= 1'd0;
    end
end

//分频器2输出10hz
reg [22:0] cnt23;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        cnt23 <= 23'd0;
    end
    else if(cnt23 == 23'd4_999_999)
    begin
        cnt23 <= 23'd0;
    end
    else
    begin
        cnt23 <= cnt23 + 1;
    end
end

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        clk10hz <= 1'd0;
    end
    else if(cnt23 < 23'd2_500_000)
    begin
        clk10hz <= 1'd1;
    end
    else 
    begin
        clk10hz <= 1'd0;
    end
end

//双路选择器
assign out = switch ? clk10hz : clk1hz;
    
endmodule