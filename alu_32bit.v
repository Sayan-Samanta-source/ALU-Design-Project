////32 bit alu////
module alu32 (A,B,ALUControl,Result,Zero);
input  [31:0] A;
input  [31:0] B;
input  [2:0]  ALUControl;
output reg [31:0] Result;
output Zero;
always @(*) begin
case (ALUControl)
3'b000: Result = A & B;          
3'b001: Result = A | B;       
3'b010: Result = A + B;         
3'b110: Result = A - B;  
3'b100: Result = A ^ B;     
3'b111: Result = (A < B) ? 32'd1 : 32'd0; 
default: Result = 32'd0;
endcase
end
assign Zero = (Result == 0) ? 1 : 0;
endmodule
////test bench ////
module tb_alu32();
reg  [31:0] A, B;
reg  [2:0]  ALUControl;
wire [31:0] Result;
wire Zero;
alu32 a1 (A,B,ALUControl,Result,Zero);
initial begin
A = 32'hF0F0F0F0; B = 32'h0F0F0F0F; ALUControl = 3'b000;
#10; 
ALUControl = 3'b001;
#10; 
A = 32'd10; B = 32'd25; ALUControl = 3'b010;
#10; 
A = 32'd100; B = 32'd40; ALUControl = 3'b110;
#10; 
A = 32'd50; B = 32'd50; ALUControl = 3'b110;
#10; 
A = 32'hAAAA5555; B = 32'h5555AAAA; ALUControl = 3'b100;
#10;
A = 32'd10; B = 32'd20; ALUControl = 3'b111;
#10;
A = 32'd30; B = 32'd20; ALUControl = 3'b111;   
end
endmodule
