module divider(
    clk,
    d,
    fout
);

input clk;
input [7:0] d;
output reg fout;

reg cout;
reg [7:0]cnt8;

always @(posedge clk)
    begin
        if(cnt8 == 8'd11111111)
        begin
            cnt8 <= d;
        end
        else
        begin
            cnt8 <= cnt8 + 1;
        end

    end

always @(posedge cnt8)
    begin
        if(cnt8 == 8'd11111110)
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
