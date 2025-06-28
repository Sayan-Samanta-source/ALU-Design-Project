/////4 bit alu////
module alu_4bit (A,B,ALU_Sel,ALU_Out,CarryOut,Zero);
input  [3:0] A, B;
input  [2:0] ALU_Sel;
output reg [3:0] ALU_Out;
output reg CarryOut;
output Zero;
assign Zero = (ALU_Out == 4'b0000);
always @(*) begin
case (ALU_Sel)
3'b000: {CarryOut, ALU_Out} = A + B;      
3'b001: {CarryOut, ALU_Out} = A - B;         
3'b010: ALU_Out = A & B;                     
3'b011: ALU_Out = A | B;                  
3'b100: ALU_Out = A ^ B;                 
3'b101: ALU_Out = ~A;                        
3'b110: ALU_Out = B << 1;              
3'b111: ALU_Out = B >> 1;          
default: ALU_Out = 4'b0000;
endcase
end
endmodule
//////test bench /////
module tb_alu_4bit();
reg  [3:0] A, B;
reg  [2:0] ALU_Sel;
wire [3:0] ALU_Out;
wire CarryOut;
wire Zero;
alu_4bit a1 (A,B,ALU_Sel,ALU_Out,CarryOut,Zero);
initial begin
A = 4'b0011; B = 4'b0101; ALU_Sel = 3'b000; #10; 
A = 4'b1000; B = 4'b0011; ALU_Sel = 3'b001; #10; 
A = 4'b1100; B = 4'b1010; ALU_Sel = 3'b010; #10; 
A = 4'b1100; B = 4'b1010; ALU_Sel = 3'b011; #10;
A = 4'b1100; B = 4'b1010; ALU_Sel = 3'b100; #10; 
A = 4'b1100; B = 4'b0000; ALU_Sel = 3'b101; #10; 
A = 4'b0000; B = 4'b0011; ALU_Sel = 3'b110; #10;
A = 4'b0000; B = 4'b1000; ALU_Sel = 3'b111;
end
endmodule
