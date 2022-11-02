module div_ctr (
    reset,
    clk50m,
    d,
    fout
);
input reset;
input clk50m;
input [7:0] d;
output reg fout;


//产生50khz的时钟
reg [9:0]cnt10;
reg clk50khz;
always @(posedge clk50m or negedge reset)
begin
    if(!reset)
    begin
        cnt10 <= 10'd0;
    end
    else if(cnt10 == 10'd999)
    begin
        cnt10 <= 10'd0;
    end
    else
    begin
        cnt10 <= cnt10 + 1;
    end
end

always @(posedge cnt10 or negedge reset)
begin
    if(!reset)
    begin
        clk50khz <= 1'b0;
    end
    else if(cnt10 <= 10'd499)
    begin
        clk50khz <= 1'b1;
    end
    else
    begin
        clk50khz <= 1'b0;
    end
end

//产生数控分频时钟

reg cout;
reg [7:0]cnt8;
always @(posedge clk50khz)
begin
    if(cnt8 == 8'd255)
    begin
        cnt8 <= d;
    end
    else
    begin
        cnt8 <= cnt8 + 1;
    end
end

always @(posedge clk50khz)
begin
    if(cnt8 == 8'd254)
    begin
        cout <= 1'b1;
    end
    else
    begin
        cout <= 0;
    end
end

always @(posedge cout)
begin
    fout <= ~fout;
end

endmodule