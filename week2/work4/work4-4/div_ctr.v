module div_ctr(reset, clk_50m, d, fout);
    input reset, clk_50m;
    input [7:0] d;
    output fout;

    // 50khz timer
    reg clk_50khz;
    reg [9:0] cnt;

    always @ (negedge reset, posedge clk_50m)
        begin
            if (!reset)
                cnt <= 0;
            else
                begin
                    if (cnt == 1000 - 1)
                        cnt <= 0;
                    else
                        cnt <= cnt + 1;
                end
        end

    always @ (negedge reset, posedge clk_50m)
        begin
            if (!reset)
                clk_50khz <= 0;
            else if (cnt < 1000 / 2)
                clk_50khz <= 1;
            else
                clk_50khz <= 0;
        end

    // 数控分频器
    reg fout;
    reg cout;
    reg [7:0] cnt8;
    always @ (posedge clk_50khz)
        begin
            if (cnt8 == 8'b11111111)
                cnt8 <= d;
            else
                cnt8 <= cnt8 + 1;
        end

    always @ (posedge clk_50khz)
        begin
            if (cnt8 == 8'b11111110)
                cout <= 1;
            else
                cout <= 0;
        end

    always @ (posedge cout)
        fout <= ~fout;
endmodule

