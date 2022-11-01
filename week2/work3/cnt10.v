module cnt10 (
    reset,
    en,
    clk,
    q,
    count
);
    
    input reset;
    input en;
    input clk;
    output reg [3:0] q;
    output reg [3:0] count;

    always @(posedge clk or posedge reset)
    begin
        if(reset)
        begin
            q <= 4'b0000;
        end
        else if(en)
        begin
            if(q == 4'b1001)
            begin
                q <= 4'b0000;
            end
            else
            begin
                q <= q + 1;
            end
        end
    end
always @(reset or q)
begin
    if (reset)
    begin
        count <= 4'b0000;
    end
    else if (q == 4'b1001)
    begin
        count <= 1;
    end
    else
    begin
        count <= 0;
    end
end


endmodule