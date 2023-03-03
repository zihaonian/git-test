`timescale  1ns/1ns
module  tb_complex_fsm();
reg     sys_clk     ;
reg     sys_rst_n   ;
reg     pi_one      ;
reg     pi_half     ;
reg     random      ;

wire    po_cola     ; 
wire    po_half     ;

wire    [4:0] state =complex_fsm_inst.state     ;
wire    [1:0] pi_money =complex_fsm_inst.pi_money     ;
  
initial
    begin
        sys_clk     =   1'b1;
        sys_rst_n   <=  1'b0;
        #20
        sys_rst_n   <=  1'b1;    
    end
always #10 sys_clk  =   ~sys_clk;

always@(posedge sys_clk or  negedge sys_rst_n)
    if(sys_rst_n   ==  1'b0)
        random  <=  1'b0;
    else
        random  <=  {$random}%2;

always@(posedge sys_clk or  negedge sys_rst_n)
    if(sys_rst_n   ==  1'b0)
        pi_one  <=  1'b0;
    else
        pi_one  <=  random;
        
always@(posedge sys_clk or  negedge sys_rst_n)
    if(sys_rst_n   ==  1'b0)
        pi_half  <=  1'b0;
    else
        pi_half  <=  ~random;
complex_fsm complex_fsm_inst
(
    .sys_clk   (sys_clk) ,
    .sys_rst_n (sys_rst_n) ,
    .pi_half   (pi_half) ,
    .pi_one    (pi_one) ,
    .po_cola   (po_cola) ,
    .po_half   (po_half)
);
endmodule