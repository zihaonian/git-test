module  counter
#(
    parameter   CNT_MAX =   25'd49_999_999
)

(
    input   wire    sys_clk,
    input   wire    sys_rst_n,
    
    output  reg     led_out
);

reg [24:0]  cnt;
reg     cnt_flag;
always@(posedge sys_clk or  negedge sys_rst_n) 
    if(sys_rst_n    ==  1'b0)
        cnt <= 25'd0;
    else    if(cnt  ==  CNT_MAX)
        cnt <= 25'd0;
    else
        cnt <= cnt+25'd1;
        
always@(posedge sys_clk or  negedge sys_rst_n) 
    if(sys_rst_n    ==  1'b0)
        cnt_flag <= 1'b0; 
    else    if(cnt  ==  CNT_MAX -   25'd1)
        cnt_flag <=   1'b1;
    else
        cnt_flag <= 1'b0;

always@(posedge sys_clk or  negedge sys_rst_n) 
    if(sys_rst_n    ==  1'b0)
        led_out <= 1'b0; 
    else    if(cnt_flag ==   1'b1)
        led_out <=  ~led_out; 
    else
        led_out <=  led_out; 
endmodule