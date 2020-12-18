`timescale 1ns/10ps

module	rflp256x52mx4 (DO, CLK, NCE, NWRT, RA, CA, DI);

output	[52-1:0]	DO				;

input				CLK				;
input				NCE				;
input				NWRT			;
input	[6-1:0]		RA				;
input	[2-1:0]		CA				;
input	[52-1:0]	DI				;
    
reg					r_nwrt			;
reg					r_nce			;
reg		[52-1:0]	r_din			;
reg		[8-1:0]		r_addr			;
reg		[52-1:0]	array[256-1:0]	;
    
event				write			;
event				read			;
integer				i				;
    
reg		[52-1:0]	temp_reg		;
reg		[52-1:0]	write_data		;
reg		[52-1:0]	do_reg			;
wire	[8-1:0]		A				;
    
wire	[52-1:0]	BDO				;
    
buf(BDO[ 0], do_reg[ 0]);
buf(BDO[ 1], do_reg[ 1]);
buf(BDO[ 2], do_reg[ 2]);
buf(BDO[ 3], do_reg[ 3]);
buf(BDO[ 4], do_reg[ 4]);
buf(BDO[ 5], do_reg[ 5]);
buf(BDO[ 6], do_reg[ 6]);
buf(BDO[ 7], do_reg[ 7]);
buf(BDO[ 8], do_reg[ 8]);
buf(BDO[ 9], do_reg[ 9]);
buf(BDO[10], do_reg[10]);
buf(BDO[11], do_reg[11]);
buf(BDO[12], do_reg[12]);
buf(BDO[13], do_reg[13]);
buf(BDO[14], do_reg[14]);
buf(BDO[15], do_reg[15]);
buf(BDO[16], do_reg[16]);
buf(BDO[17], do_reg[17]);
buf(BDO[18], do_reg[18]);
buf(BDO[19], do_reg[19]);
buf(BDO[20], do_reg[20]);
buf(BDO[21], do_reg[21]);
buf(BDO[22], do_reg[22]);
buf(BDO[23], do_reg[23]);
buf(BDO[24], do_reg[24]);
buf(BDO[25], do_reg[25]);
buf(BDO[26], do_reg[26]);
buf(BDO[27], do_reg[27]);
buf(BDO[28], do_reg[28]);
buf(BDO[29], do_reg[29]);
buf(BDO[30], do_reg[30]);
buf(BDO[31], do_reg[31]);
buf(BDO[32], do_reg[32]);
buf(BDO[33], do_reg[33]);
buf(BDO[34], do_reg[34]);
buf(BDO[35], do_reg[35]);
buf(BDO[36], do_reg[36]);
buf(BDO[37], do_reg[37]);
buf(BDO[38], do_reg[38]);
buf(BDO[39], do_reg[39]);
buf(BDO[40], do_reg[40]);
buf(BDO[41], do_reg[41]);
buf(BDO[42], do_reg[42]);
buf(BDO[43], do_reg[43]);
buf(BDO[44], do_reg[44]);
buf(BDO[45], do_reg[45]);
buf(BDO[46], do_reg[46]);
buf(BDO[47], do_reg[47]);
buf(BDO[48], do_reg[48]);
buf(BDO[49], do_reg[49]);
buf(BDO[50], do_reg[50]);
buf(BDO[51], do_reg[51]);

bufif1(DO[ 0], BDO[ 0], 1'b1);
bufif1(DO[ 1], BDO[ 1], 1'b1);
bufif1(DO[ 2], BDO[ 2], 1'b1);
bufif1(DO[ 3], BDO[ 3], 1'b1);
bufif1(DO[ 4], BDO[ 4], 1'b1);
bufif1(DO[ 5], BDO[ 5], 1'b1);
bufif1(DO[ 6], BDO[ 6], 1'b1);
bufif1(DO[ 7], BDO[ 7], 1'b1);
bufif1(DO[ 8], BDO[ 8], 1'b1);
bufif1(DO[ 9], BDO[ 9], 1'b1);
bufif1(DO[10], BDO[10], 1'b1);
bufif1(DO[11], BDO[11], 1'b1);
bufif1(DO[12], BDO[12], 1'b1);
bufif1(DO[13], BDO[13], 1'b1);
bufif1(DO[14], BDO[14], 1'b1);
bufif1(DO[15], BDO[15], 1'b1);
bufif1(DO[16], BDO[16], 1'b1);
bufif1(DO[17], BDO[17], 1'b1);
bufif1(DO[18], BDO[18], 1'b1);
bufif1(DO[19], BDO[19], 1'b1);
bufif1(DO[20], BDO[20], 1'b1);
bufif1(DO[21], BDO[21], 1'b1);
bufif1(DO[22], BDO[22], 1'b1);
bufif1(DO[23], BDO[23], 1'b1);
bufif1(DO[24], BDO[24], 1'b1);
bufif1(DO[25], BDO[25], 1'b1);
bufif1(DO[26], BDO[26], 1'b1);
bufif1(DO[27], BDO[27], 1'b1);
bufif1(DO[28], BDO[28], 1'b1);
bufif1(DO[29], BDO[29], 1'b1);
bufif1(DO[30], BDO[30], 1'b1);
bufif1(DO[31], BDO[31], 1'b1);
bufif1(DO[32], BDO[32], 1'b1);
bufif1(DO[33], BDO[33], 1'b1);
bufif1(DO[34], BDO[34], 1'b1);
bufif1(DO[35], BDO[35], 1'b1);
bufif1(DO[36], BDO[36], 1'b1);
bufif1(DO[37], BDO[37], 1'b1);
bufif1(DO[38], BDO[38], 1'b1);
bufif1(DO[39], BDO[39], 1'b1);
bufif1(DO[40], BDO[40], 1'b1);
bufif1(DO[41], BDO[41], 1'b1);
bufif1(DO[42], BDO[42], 1'b1);
bufif1(DO[43], BDO[43], 1'b1);
bufif1(DO[44], BDO[44], 1'b1);
bufif1(DO[45], BDO[45], 1'b1);
bufif1(DO[46], BDO[46], 1'b1);
bufif1(DO[47], BDO[47], 1'b1);
bufif1(DO[48], BDO[48], 1'b1);
bufif1(DO[49], BDO[49], 1'b1);
bufif1(DO[50], BDO[50], 1'b1);
bufif1(DO[51], BDO[51], 1'b1);


assign A = {RA, CA};

always@(posedge CLK)
	begin
		r_nwrt <= NWRT;
		r_nce <= NCE;
		r_din <= DI;
		r_addr <= A;
            
		#0.1
		if(!r_nce && !r_nwrt)
			-> write;
		if(!r_nce && r_nwrt)
			-> read;
	end
           
always@(write)
	begin
		temp_reg = array[r_addr];
		write_data = r_din;
		array[r_addr] = write_data;
	end
 
always@(read)
	begin
		#0.1
		do_reg = array[r_addr];
	end
        
reg			FLAG_X;
initial		FLAG_X = 1'b0;

always@(FLAG_X)
begin
	for(i=0; i<(256); i=i+1)
		begin
         //array[i] = {52{1'bx}};
     	end
	$display("INSUFFICIENT SETUP/HOLD TIME - POTENTIAL MEMORY DATA CORRUPTION");
end
 
specify
	specparam
		tCLK	= 3,			// Clock Cycle Time
		tCH		= 0.4*tCLK,		// Clock High-Level Width
		tCL		= 0.4*tCLK,		// Clock Low-level Width
		tDH		= 0.0,			// Data-in Hold Time
		tDS		= 0.40,			// Data-in Setup Time
		tAH		= 0.0,			// address Hold Time
		tAS		= 0.60,			// address Setup Time
		tPHL	= 0.8,			// Propagation Delay High to Low
		tPLH	= 0.8,			// Propagation Delay Low to High
		tEH		= 0.0,			// control signal Hold Time
		tES		= 0.40;			// control signal Setup Time
		$width(posedge CLK, tCH);
		$width(negedge CLK, tCL); 
		$period(negedge CLK, tCLK);
		$period(posedge CLK, tCLK);
		$setuphold(posedge CLK, posedge NWRT, tES, tEH);
		$setuphold(posedge CLK, posedge NCE, tES, tEH);
		$setuphold(posedge CLK, posedge DI[ 0], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[ 1], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[ 2], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[ 3], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[ 4], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[ 5], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[ 6], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[ 7], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[ 8], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[ 9], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[10], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[11], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[12], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[13], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[14], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[15], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[16], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[17], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[18], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[19], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[20], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[21], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[22], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[23], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[24], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[25], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[26], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[27], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[28], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[29], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[30], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[31], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[32], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[33], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[34], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[35], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[36], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[37], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[38], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[39], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[40], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[41], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[42], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[43], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[44], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[45], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[46], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[47], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[48], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[49], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[50], tDS, tDH);
		$setuphold(posedge CLK, posedge DI[51], tDS, tDH);
		
		(CLK => DO[ 0]) = (tPLH, tPHL);
		(CLK => DO[ 1]) = (tPLH, tPHL);
		(CLK => DO[ 2]) = (tPLH, tPHL);
		(CLK => DO[ 3]) = (tPLH, tPHL);
		(CLK => DO[ 4]) = (tPLH, tPHL);
		(CLK => DO[ 5]) = (tPLH, tPHL);
		(CLK => DO[ 6]) = (tPLH, tPHL);
		(CLK => DO[ 7]) = (tPLH, tPHL);
		(CLK => DO[ 8]) = (tPLH, tPHL);
		(CLK => DO[ 9]) = (tPLH, tPHL);
		(CLK => DO[10]) = (tPLH, tPHL);
		(CLK => DO[11]) = (tPLH, tPHL);
		(CLK => DO[12]) = (tPLH, tPHL);
		(CLK => DO[13]) = (tPLH, tPHL);
		(CLK => DO[14]) = (tPLH, tPHL);
		(CLK => DO[15]) = (tPLH, tPHL);
		(CLK => DO[16]) = (tPLH, tPHL);
		(CLK => DO[17]) = (tPLH, tPHL);
		(CLK => DO[18]) = (tPLH, tPHL);
		(CLK => DO[19]) = (tPLH, tPHL);
		(CLK => DO[20]) = (tPLH, tPHL);
		(CLK => DO[21]) = (tPLH, tPHL);
		(CLK => DO[22]) = (tPLH, tPHL);
		(CLK => DO[23]) = (tPLH, tPHL); 
		(CLK => DO[24]) = (tPLH, tPHL);
		(CLK => DO[25]) = (tPLH, tPHL);
		(CLK => DO[26]) = (tPLH, tPHL);
		(CLK => DO[27]) = (tPLH, tPHL);
		(CLK => DO[28]) = (tPLH, tPHL);
		(CLK => DO[29]) = (tPLH, tPHL);
		(CLK => DO[30]) = (tPLH, tPHL);
		(CLK => DO[31]) = (tPLH, tPHL);
		(CLK => DO[32]) = (tPLH, tPHL);
		(CLK => DO[33]) = (tPLH, tPHL);
		(CLK => DO[34]) = (tPLH, tPHL);
		(CLK => DO[35]) = (tPLH, tPHL);
		(CLK => DO[36]) = (tPLH, tPHL);
		(CLK => DO[37]) = (tPLH, tPHL);
		(CLK => DO[38]) = (tPLH, tPHL);
		(CLK => DO[39]) = (tPLH, tPHL);
		(CLK => DO[40]) = (tPLH, tPHL);
		(CLK => DO[41]) = (tPLH, tPHL);
		(CLK => DO[42]) = (tPLH, tPHL);
		(CLK => DO[43]) = (tPLH, tPHL);
		(CLK => DO[44]) = (tPLH, tPHL);
		(CLK => DO[45]) = (tPLH, tPHL);
		(CLK => DO[46]) = (tPLH, tPHL);
		(CLK => DO[47]) = (tPLH, tPHL);
		(CLK => DO[48]) = (tPLH, tPHL);
		(CLK => DO[49]) = (tPLH, tPHL);
		(CLK => DO[50]) = (tPLH, tPHL);
		(CLK => DO[51]) = (tPLH, tPHL);
		
		$setuphold(posedge CLK, posedge RA[0], tDS, tDH, FLAG_X);
		$setuphold(posedge CLK, posedge RA[1], tDS, tDH, FLAG_X);
		$setuphold(posedge CLK, posedge RA[2], tDS, tDH, FLAG_X);
		$setuphold(posedge CLK, posedge RA[3], tDS, tDH, FLAG_X);
		$setuphold(posedge CLK, posedge RA[4], tDS, tDH, FLAG_X);
		$setuphold(posedge CLK, posedge RA[5], tDS, tDH, FLAG_X);
		 
		$setuphold(posedge CLK, posedge CA[0], tDS, tDH, FLAG_X);
		$setuphold(posedge CLK, posedge CA[1], tDS, tDH, FLAG_X);
		 
		$setuphold(posedge CLK, negedge NWRT, tES, tEH);
		$setuphold(posedge CLK, negedge NCE , tES, tEH);
		        
		
		$setuphold(posedge CLK, negedge DI[ 0], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[ 1], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[ 2], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[ 3], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[ 4], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[ 5], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[ 6], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[ 7], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[ 8], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[ 9], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[10], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[11], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[12], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[13], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[14], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[15], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[16], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[17], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[18], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[19], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[20], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[21], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[22], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[23], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[24], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[25], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[26], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[27], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[28], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[29], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[30], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[31], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[32], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[33], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[34], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[35], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[36], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[37], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[38], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[39], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[40], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[41], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[42], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[43], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[44], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[45], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[46], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[47], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[48], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[49], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[50], tDS, tDH);
		$setuphold(posedge CLK, negedge DI[51], tDS, tDH);
		
		$setuphold(posedge CLK, negedge RA[0], tDS, tDH, FLAG_X);
		$setuphold(posedge CLK, negedge RA[1], tDS, tDH, FLAG_X);
		$setuphold(posedge CLK, negedge RA[2], tDS, tDH, FLAG_X);
		$setuphold(posedge CLK, negedge RA[3], tDS, tDH, FLAG_X);
		$setuphold(posedge CLK, negedge RA[4], tDS, tDH, FLAG_X);
		$setuphold(posedge CLK, negedge RA[5], tDS, tDH, FLAG_X);
		
		$setuphold(posedge CLK, negedge CA[0], tDS, tDH, FLAG_X);
		$setuphold(posedge CLK, negedge CA[1], tDS, tDH, FLAG_X);
	endspecify
		     
endmodule
