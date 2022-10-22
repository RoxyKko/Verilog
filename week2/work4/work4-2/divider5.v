module divider5 (
    reset,
    clk,
    div5
);

input reset;
input clk;
output reg div5;

reg [2:0]cnt3;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        cnt3 <= 3'b000;
    end
    else
    begin
        if(cnt3 == 3'b100)
        begin
            cnt3 <= 3'b000;
        end
        else
        begin
            cnt3 <= cnt3 + 1;
        end
    end
end

always @(posedge reset or posedge clk)
begin
    if(reset)
    begin
        div5 <= 1'b0;
    end
    else if(cnt3 < 3'b010)
    begin
        div5 <= 1'b1;
    end
    else
    begin
        div5 <= 1'b0;
    end
end
    
endmodule