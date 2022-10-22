//1.5分频的分频器
//上课有讲过，小数分频，先将时钟2倍频，在进行奇数分频
//2倍频的方法也很简单，同时对一个周期内时钟的上升沿和下降沿都计数即可
//1.5 = 3/2 故倍频2倍后分频3即可得到1.5分频
//以此类推 N.5 = (2N+1)/2 , N为整数， N.5分频器倍频2后分频2N+1即可得到N.5分频
module divider_1dot5 (
    clk,
    reset,
    div1d5,//div1d5 == clkN || clkP
    clkR,//上升沿
    clkD,//下降沿
);

input clk;
input reset;
output reg div1d5;
output reg clkR;
output reg clkD;

reg [2:0]cnt3_1;
reg [2:0]cnt3_2;

//上升沿计数3分频
always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        cnt3_1 <= 3'b000;
    end
    else if(clk)
    begin
        if(cnt3_1 == 3'd2)
        begin
            cnt3_1 <= 3'd0;
        end
        else
        begin
            cnt3_1 <= cnt3_1 + 1;
        end
    end
end

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        clkR <= 1'b0;
    end
    else if(cnt3_1 == 3'd0)
    begin
        clkR <= 1'b1;
    end
    else
    begin
        clkR <= 1'b0;
    end
end

//下降沿计数3分频
always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        cnt3_2 <= 3'b000;
    end
    else if(!clk)
    begin
        if(cnt3_2 == 3'd2)
        begin
            cnt3_2 <= 3'd0;
        end
        else
        begin
            cnt3_2 <= cnt3_2 + 1;
        end
    end
end

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        clkD <= 1'b0;
    end
    else if(cnt3_2 == 3'd1)
    begin
        clkD <= 1'b1;
    end
    else
    begin
        clkD <= 1'b0;
    end
end

//1.5分频
assign div1d5 = clkR | clkD;

    
endmodule