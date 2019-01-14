module mdff(input clk, D, output Q);
always @(negedge clk) 
begin
Q<=D;
end
endmodule
