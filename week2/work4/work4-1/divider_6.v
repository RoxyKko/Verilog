//同步复位6分频器
module divider_6(
    reset,
    clk,
    div6
);
input reset;
input clk;
output reg div6;
reg cout;
reg [2:0]counter;

always @(posedge clk)
begin
    if(reset)
    begin
        counter <= 3'b000;
    end
    else if(counter == 3'd5)
    begin
        counter <= 3'b000;
    end
    else
    begin
        counter <= counter + 1;
    end
end

always @(posedge clk)
begin
    if(reset)
    begin
        div6 <= 1'b0;
    end
    else if(counter < 3'd3)
    begin
        div6 <= 1'b1;
    end
    else
    begin
        div6 <= 1'b0;
    end
end
endmodule
