module register_file #(parameter WIDTH = 16) (
    input  logic clk,                               
    input  logic [1:0] rs1, rs2, rd,                
    input  logic [WIDTH-1:0] write_data,           
    input  logic write_enable,                    
    output logic [WIDTH-1:0] out1, out2          

    // Declare the register file with 4 registers (x0 to x3)
    logic [WIDTH-1:0] registers [3:0];

    //  Load the register file 
    initial begin
        $readmemh("rom_image_hex.mem", registers); // Load data from hex file
      //$readmemh("rom_image_bin.mem", registers); // Load data from bin file
    end

    // Read Logic: Simultaneously read two registers
    always_comb begin
        out1 = (rs1 == 2'b00) ? {WIDTH{1'b0}} : registers[rs1]; // x0 is always 0
        out2 = (rs2 == 2'b00) ? {WIDTH{1'b0}} : registers[rs2];
    end

    // Write Logic: Write data on the positive edge of the clock
    always_ff @(posedge clk) begin
        if (write_enable && rd != 2'b00) begin
            registers[rd] <= write_data; // Prevent writes to x0
        end
    end

endmodule

