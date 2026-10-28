`timescale 1ns/1ps
module llapi_pad_tb;
reg CLK=0; always #5 CLK=~CLK;
reg RST_N=0,SMPC_CE=1;
wire [6:0] PDR1I,PDR2I;
reg [6:0] PDR1O=7'h7f,PDR2O=7'h7f,DDR1=7'h60,DDR2=7'h60;
reg [15:0] JOY1=16'hffff,JOY2=16'hffff;
reg [7:0] JOY1_X1=8'h12,JOY1_Y1=8'h34,JOY1_X2=0,JOY1_Y2=0;
reg [7:0] JOY2_X1=8'h56,JOY2_Y1=8'h78,JOY2_X2=0,JOY2_Y2=0;
reg [7:0] JOY1_Z1=8'ha5,JOY1_Z2=8'h3c,JOY2_Z1=8'hd2,JOY2_Z2=8'h19;
reg LLAPI1=1,LLAPI2=1;
reg [3:0] JOY1_TYPE=4,JOY2_TYPE=4;
reg [24:0] MOUSE=0; reg [15:0] MOUSE_EXT=0; reg [10:0] PS2_KEY=0; wire [2:0] PS2_LED;
reg LGUN_P1_TRIG=0,LGUN_P1_START=0,LGUN_P1_SENSOR=0,LGUN_P2_TRIG=0,LGUN_P2_START=0,LGUN_P2_SENSOR=0;
HPS2PAD dut(.*);
task phase(input [1:0] thtr,input [3:0] want1,want2);
 begin
 @(negedge CLK); PDR1O[6:5]=thtr; PDR2O[6:5]=thtr;
 @(posedge CLK); #1;
 if(PDR1I[3:0]!==want1 || PDR2I[3:0]!==want2)
  $fatal(1,"phase %b got %h/%h expected %h/%h",thtr,PDR1I[3:0],PDR2I[3:0],want1,want2);
 end
endtask
initial begin
 #12; RST_N=1;
 phase(2'b01,1,1); phase(2'b00,1,1); phase(2'b01,6,6);
 phase(2'b00,15,15); phase(2'b01,15,15);
 phase(2'b00,15,15); phase(2'b01,7,7);
 phase(2'b00,9,13); phase(2'b01,2,6);
 phase(2'b00,11,15); phase(2'b01,4,8);
 phase(2'b00,3,1); phase(2'b01,12,9);
 phase(2'b00,10,13); phase(2'b01,5,2);
 phase(2'b00,0,0); phase(2'b01,1,1);
 // The official USB trigger conversion still works without LLAPI.
 phase(2'b11,1,1); LLAPI1=0; LLAPI2=0;
 JOY1_X2=8'h7f; JOY2_X2=8'h80;
 phase(2'b01,1,1); phase(2'b00,1,1); phase(2'b01,6,6);
 phase(2'b00,15,15); phase(2'b01,15,15);
 phase(2'b00,7,15); phase(2'b01,15,7);
 // Digital pads keep independent player data.
 JOY1_TYPE=0; JOY2_TYPE=0; JOY1=16'hf0ff; JOY2=16'h0fff;
 phase(2'b00,15,15); phase(2'b01,15,0); phase(2'b10,0,15);
 $display("PASS: dual 3D pad handshake, independent analogue triggers, end-of-packet, USB trigger fallback and digital pads");
 $finish;
end
initial begin #5000; $fatal(1,"timeout"); end
endmodule
