////16 bit alu////
module ALU16 (A,B,ALU_Sel,ALU_Out,Zero);
input  [15:0] A, B;
input  [3:0]  ALU_Sel;
output reg [15:0] ALU_Out;
output Zero;
assign Zero = (ALU_Out == 16'd0);
always @(*) begin
case (ALU_Sel)
4'b0000: ALU_Out = A + B;            
4'b0001: ALU_Out = A - B;           
4'b0010: ALU_Out = A & B;           
4'b0011: ALU_Out = A | B;     
4'b0100: ALU_Out = A ^ B;         
4'b0101: ALU_Out = ~A;             
4'b0110: ALU_Out = (A < B) ? 16'd1 : 16'd0; 
4'b0111: ALU_Out = A << 1;             
4'b1000: ALU_Out = A >> 1;      
default: ALU_Out = 16'd0;
endcase
end
endmodule
/////test bench////
module ALU16_tb();
reg [15:0] A, B;
reg [3:0] ALU_Sel;
wire [15:0] ALU_Out;
wire Zero;
ALU16 a1 (A,B,ALU_Sel,ALU_Out,Zero);
initial begin
A = 16'h000F; B = 16'h0001;
ALU_Sel = 4'b0000; #10; 
ALU_Sel = 4'b0001; #10; 
ALU_Sel = 4'b0010; #10;
ALU_Sel = 4'b0011; #10;
ALU_Sel = 4'b0100; #10; 
ALU_Sel = 4'b0101; #10; 
ALU_Sel = 4'b0110; #10; 
ALU_Sel = 4'b0111; #10;
ALU_Sel = 4'b1000; #10; 
A = 16'h0000; B = 16'h0000;
ALU_Sel = 4'b0000;
end
endmodule
