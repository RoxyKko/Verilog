module	cnt10_2bit(reset, clk, cnt0, cnt1, cout0, cout1);	     	      	      
    input reset,clk;
    output reg [3:0]cnt0;
    output reg [3:0]cnt1;
    output reg cout1, cout0;
    
    always @ (posedge reset or posedge clk)
        begin
            if(reset)
                cnt0 <= 0;
            else 
                begin
                    // 跟 1 位的一样
                    if(cnt0 == 9)
                        cnt0 <= 0;
                    else
                        cnt0 <= cnt0 + 1;
                end
        end	
    
    always @ (posedge reset or posedge clk)
        begin
            if(reset)
                cout0 <= 0;
            // 到9 就输出了
            // 到 8 这里就要输出了 9 - 1 = 8
            else if(cnt0 == 8)
                cout0 <= 1;
            else
                cout0 <= 0;
        end	

    always @ (posedge reset or posedge clk)
        begin
            if(reset)
                cnt1 <= 0;
            else if(cout0 == 1)
                begin
                    if(cnt1 == 9)
                        cnt1 <= 0;
                    else
                        cnt1 <= cnt1 + 1;
                end
        end	
    
    always @ (posedge reset or posedge clk)
        begin
            if(reset)
                cout1 <= 0;
            // 总是少 1 
            // 98 = 99 - 1 时候
            else if((cnt1 == 9) && (cnt0 == 8))
                cout1 <= 1;
            else
                cout1 <= 0;
        end	
endmodule

