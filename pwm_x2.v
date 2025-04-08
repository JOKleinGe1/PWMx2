module pwm_x2 (input clock , input [7:0] pwm_control_register, input [31:0] pwm_prescaler, input [7:0] pwm_pulse_width_1, 
		input [7:0] pwm_pulse_width_2, output pwm_out1, output pwm_out2);
	reg [7:0] counter = 8'd0 ;
	reg [31:0] prescaler_counter = 32'd0 ;
	
	wire pwm_enable1 = pwm_control_register[0]; 
	wire pwm_enable2 = pwm_control_register[1]; 
	always @ (posedge clock) if (pwm_enable1 | pwm_enable2) prescaler_counter <= (prescaler_counter + 1) % pwm_prescaler;
	always @ (posedge clock)
		if (pwm_enable1 | pwm_enable2) counter <= (counter + !(|prescaler_counter)) ;
		else  counter <= 8'd0 ;
	assign pwm_out1 = pwm_enable1 & (pwm_pulse_width_1 > counter );
	assign pwm_out2 = pwm_enable2 & (pwm_pulse_width_2 > counter );
endmodule
