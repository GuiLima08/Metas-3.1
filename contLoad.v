module contLoad(
	input plus, minus,
	output reg [2:0] out,
	output alarm
);

	wire p = ~plus;
	wire m = ~minus;
	
	always @ (posedge p or posedge m)
		begin
		if (p)
			begin
				if (out != 3'b111)
					out <= out+3'b001;
				else
					out <= out;
			end
		else 
			begin
				if (out != 3'b000)
					out <= out-3'b001;
				else
					out <= out;
			end
		end

	assign alarm = out[2] & out[1] & out[0];
	
endmodule
