module InstructionMemory #(parameter address_width = 4, DATA_WIDTH = 11) (
    input  logic [address_width-1:0] addr,  
    output logic [DATA_WIDTH-1:0] data   
);

    logic [DATA_WIDTH-1:0] rom [8:0]; 

    initial begin
        rom[0] = 11'b00000001000;  
        rom[1] = 11'b00000101001;  
        rom[2] = 11'b00001000000;  
        rom[3] = 11'b00000100000;  
        rom[4] = 11'b01010111000;  
        rom[5] = 11'b00000000000;  
        rom[6] = 11'b00000100100;  
        rom[7] = 11'b00000000100;  
        rom[8] = 11'b10010111010;  
    end

    //wire [3:0] wrapped_addr = addr % (8+1);
    //assign data = rom[wrapped_addr];  
    // Assign the data output directly based on the wrapped address
    assign data = rom[addr];

endmodule
