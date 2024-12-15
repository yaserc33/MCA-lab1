module ALU #(parameter ALU_WIDTH = 16) (
    input  logic [ALU_WIDTH-1:0] A,      
    input  logic [ALU_WIDTH-1:0] B,      
    input  logic [1:0] sel,                
    output logic [ALU_WIDTH-1:0] result   
);
    
always_comb  begin : ALU
    result = {ALU_WIDTH{1'b0}}; 
    case (sel)
        2'b00: result =  A + B;
        2'b01: result =  A - B;
        2'b10: result =  A & B;
        2'b11: result =  A | B;
    endcase

end
endmodule
