module ProgramCounter #(parameter WIDTH = 4) (
    input  logic clk,                  
    input  logic reset_n,              // Active-low reset
    input  logic enable,               
    input  logic [WIDTH-1:0] load_val, 
    input  logic load,                 
    output logic [WIDTH-1:0] count     
);

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            count <= {WIDTH{1'b0}};    
        else if (load)
            count <= load_val;         
        else if (enable)
            count <= count + 1;        // Increment counter
        // Else retain the previous value
    end

endmodule
