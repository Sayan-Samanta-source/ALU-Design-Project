/////8 bit alu////
module ALU_8bit (A,B,ALU_Sel,ALU_Out,Zero);
input [7:0] A,B;
input [2:0] ALU_Sel;
output reg [7:0] ALU_Out;
output reg Zero;
always @(*) begin
case (ALU_Sel)
3'b000: ALU_Out = A + B; 
3'b001: ALU_Out = A - B;        
3'b010: ALU_Out = A & B;    
3'b011: ALU_Out = A | B;      
3'b100: ALU_Out = A ^ B;        
3'b101: ALU_Out = ~A;           
3'b110: ALU_Out = (A == B) ? 8'b1 : 8'b0; 
3'b111: ALU_Out = 8'b00000000;  
default: ALU_Out = 8'b00000000;
endcase
Zero = (ALU_Out == 8'b00000000) ? 1 : 0;
end
endmodule
////test bench////
module ALU_8bit_tb();
reg [7:0] A, B;
reg [2:0] ALU_Sel;
wire [7:0] ALU_Out;
wire Zero;
ALU_8bit a1 (A,B,ALU_Sel,ALU_Out,Zero);
initial begin
A = 8'h0A; B = 8'h05; ALU_Sel = 3'b000; #10;
A = 8'h0A; B = 8'h03; ALU_Sel = 3'b001; #10;
A = 8'hF0; B = 8'h0F; ALU_Sel = 3'b010; #10;
A = 8'hF0; B = 8'h0F; ALU_Sel = 3'b011; #10;
A = 8'hFF; B = 8'h0F; ALU_Sel = 3'b100; #10;
A = 8'h55; B = 8'h00; ALU_Sel = 3'b101; #10;
A = 8'h0A; B = 8'h0A; ALU_Sel = 3'b110; #10;
A = 8'h00; B = 8'h00; ALU_Sel = 3'b111;
end
endmodule
