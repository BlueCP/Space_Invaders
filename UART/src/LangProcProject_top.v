module LangProcProject_top(

	//////////// CLOCK //////////
	input 		          		ADC_CLK_10,
	input 		          		MAX10_CLK1_50,
	input 		          		MAX10_CLK2_50,

	//////////// SDRAM //////////
	output		    [12:0]		DRAM_ADDR,
	output		     [1:0]		DRAM_BA,
	output		          		DRAM_CAS_N,
	output		          		DRAM_CKE,
	output		          		DRAM_CLK,
	output		          		DRAM_CS_N,
	inout 		    [15:0]		DRAM_DQ,
	output		          		DRAM_LDQM,
	output		          		DRAM_RAS_N,
	output		          		DRAM_UDQM,
	output		          		DRAM_WE_N,

	//////////// SEG7 //////////
	output		     [7:0]		HEX0,
	output		     [7:0]		HEX1,
	output		     [7:0]		HEX2,
	output		     [7:0]		HEX3,
	output		     [7:0]		HEX4,
	output		     [7:0]		HEX5,

	//////////// KEY //////////
	input 		     [1:0]		KEY,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// SW //////////
	input 		     [9:0]		SW,

	//////////// VGA //////////
	output		     [3:0]		VGA_B,
	output		     [3:0]		VGA_G,
	output		          		VGA_HS,
	output		     [3:0]		VGA_R,
	output		          		VGA_VS,

	//////////// Accelerometer //////////
	output		          		GSENSOR_CS_N,
	input 		     [2:1]		GSENSOR_INT,
	output		          		GSENSOR_SCLK,
	inout 		          		GSENSOR_SDI,
	inout 		          		GSENSOR_SDO,

	//////////// Arduino //////////
	inout 		    [15:0]		ARDUINO_IO,
	inout 		          		ARDUINO_RESET_N,

	//////////// GPIO, GPIO connect to GPIO Default //////////
	inout 		    [35:0]		GPIO
);



	
	nios_project u0 (
		.clk_clk                                            (MAX10_CLK1_50),    //    clk.clk
		.reset_reset_n                                      (1'b1),             //    reset.reset_n
		.button_external_connection_export                  (KEY[1:0]),         //    button_external_connection.export
		.accelerometer_spi_external_interface_I2C_SDAT      (GSENSOR_SDI),      // 	accelerometer_spi_external_interface.I2C_SDAT
		.accelerometer_spi_external_interface_I2C_SCLK      (GSENSOR_SCLK),     //    .I2C_SCLK
		.accelerometer_spi_external_interface_G_SENSOR_CS_N (GSENSOR_CS_N), 		//    .G_SENSOR_CS_N
		.accelerometer_spi_external_interface_G_SENSOR_INT  (GSENSOR_INT[1]),	//    .G_SENSOR_INT0
		.led_external_connection_export                     (LEDR[9:0]),        //    led_external_connection.export
		.switch_external_connection_export                  (SW[9:0]),          //    switch_external_connection.export
		.hex0_external_connection_export                    (HEX0),             //    hex0_external_connection.export
		.hex1_external_connection_export                    (HEX1),             //    hex1_external_connection.export
		.hex2_external_connection_export                    (HEX2),             //    hex2_external_connection.export
		.hex3_external_connection_export                    (HEX3),             //    hex3_external_connection.export
		.hex4_external_connection_export                    (HEX4),             //    hex4_external_connection.export
		.hex5_external_connection_export                    (HEX5)              //    hex5_external_connection.export
	);




endmodule
