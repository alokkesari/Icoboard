module mux2to1(input a1, a2, sel, output o); 
assign o=sel?a2:a1;
endmodule

module mux4to1(input a, b, c, d, sel0, sel1, output out);
wire o1, o2;
mux2to1 mux1(
	.a1(a),
	.a2(b),
	.sel(sel0),
	.o(o1));
mux2to1 mux2(
	.a1(c),
	.a2(d),
	.sel(sel0),
	.o(o2));
mux2to1 mux3(
	.a1(o1),
	.a2(o2),
	.sel(sel1),
	.o(out));
endmodule



