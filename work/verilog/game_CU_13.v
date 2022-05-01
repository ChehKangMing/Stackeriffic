/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module game_CU_13 (
    input clk,
    input rst,
    input [15:0] regfiledatab,
    input [15:0] regfiledataa,
    input button,
    input [2:0] speedSel,
    input updateSpeed,
    output reg [5:0] alufn,
    output reg [2:0] asel,
    output reg [2:0] bsel,
    output reg [1:0] wdsel,
    output reg we,
    output reg [3:0] regfile_write_address,
    output reg [3:0] regfile_read_address_a,
    output reg [3:0] regfile_read_address_b,
    output reg [15:0] state,
    output reg [2:0] readSpeed
  );
  
  
  
  wire [1-1:0] M_frame_counter_out;
  reg [1-1:0] M_frame_counter_in;
  edge_detector_4 frame_counter (
    .clk(clk),
    .in(M_frame_counter_in),
    .out(M_frame_counter_out)
  );
  
  localparam SLOWCLOCK_SIZE = 5'h16;
  
  wire [22-1:0] M_frame_rate_value;
  counter_21 frame_rate (
    .clk(clk),
    .rst(rst),
    .value(M_frame_rate_value)
  );
  
  localparam SLOWCLOCK_SIZE2 = 5'h17;
  
  wire [23-1:0] M_frame_rate2_value;
  counter_22 frame_rate2 (
    .clk(clk),
    .rst(rst),
    .value(M_frame_rate2_value)
  );
  
  localparam SLOWCLOCK_SIZE3 = 5'h17;
  
  wire [23-1:0] M_frame_rate3_value;
  counter_22 frame_rate3 (
    .clk(clk),
    .rst(rst),
    .value(M_frame_rate3_value)
  );
  
  localparam SLOWCLOCK_SIZE4 = 5'h18;
  
  wire [24-1:0] M_frame_rate4_value;
  counter_23 frame_rate4 (
    .clk(clk),
    .rst(rst),
    .value(M_frame_rate4_value)
  );
  
  localparam SLOWCLOCK_SIZE5 = 5'h18;
  
  wire [24-1:0] M_frame_rate5_value;
  counter_23 frame_rate5 (
    .clk(clk),
    .rst(rst),
    .value(M_frame_rate5_value)
  );
  
  localparam DEBUG_game_fsm = 6'd0;
  localparam IDLE_game_fsm = 6'd1;
  localparam SETSTART_game_fsm = 6'd2;
  localparam RESET2_game_fsm = 6'd3;
  localparam RESET3_game_fsm = 6'd4;
  localparam RESET4_game_fsm = 6'd5;
  localparam RESET5_game_fsm = 6'd6;
  localparam RESET6_game_fsm = 6'd7;
  localparam RESET7_game_fsm = 6'd8;
  localparam RESET8_game_fsm = 6'd9;
  localparam INCREASELINE_game_fsm = 6'd10;
  localparam DETERMINENEXT_game_fsm = 6'd11;
  localparam LINE1_game_fsm = 6'd12;
  localparam LINE2_game_fsm = 6'd13;
  localparam LINE3_game_fsm = 6'd14;
  localparam LINE4_game_fsm = 6'd15;
  localparam LINE5_game_fsm = 6'd16;
  localparam LINE6_game_fsm = 6'd17;
  localparam LINE7_game_fsm = 6'd18;
  localparam LINE8_game_fsm = 6'd19;
  localparam CHECK2_game_fsm = 6'd20;
  localparam CHECK3_game_fsm = 6'd21;
  localparam CHECK4_game_fsm = 6'd22;
  localparam CHECK5_game_fsm = 6'd23;
  localparam CHECK6_game_fsm = 6'd24;
  localparam CHECK7_game_fsm = 6'd25;
  localparam CHECK8_game_fsm = 6'd26;
  localparam SHIFTL1_game_fsm = 6'd27;
  localparam SHIFTL2_game_fsm = 6'd28;
  localparam SHIFTL3_game_fsm = 6'd29;
  localparam SHIFTL4_game_fsm = 6'd30;
  localparam SHIFTL5_game_fsm = 6'd31;
  localparam SHIFTL6_game_fsm = 6'd32;
  localparam SHIFTL7_game_fsm = 6'd33;
  localparam SHIFTL8_game_fsm = 6'd34;
  localparam SHIFTR1_game_fsm = 6'd35;
  localparam SHIFTR2_game_fsm = 6'd36;
  localparam SHIFTR3_game_fsm = 6'd37;
  localparam SHIFTR4_game_fsm = 6'd38;
  localparam SHIFTR5_game_fsm = 6'd39;
  localparam SHIFTR6_game_fsm = 6'd40;
  localparam SHIFTR7_game_fsm = 6'd41;
  localparam SHIFTR8_game_fsm = 6'd42;
  localparam LOSE_game_fsm = 6'd43;
  localparam LEVELUP_game_fsm = 6'd44;
  localparam RESETLINE_game_fsm = 6'd45;
  localparam INCREASESCORE_game_fsm = 6'd46;
  localparam CHECKLOSE_game_fsm = 6'd47;
  localparam MINUS8_game_fsm = 6'd48;
  localparam UPDATELINE_game_fsm = 6'd49;
  
  reg [5:0] M_game_fsm_d, M_game_fsm_q = DEBUG_game_fsm;
  reg [15:0] M_state_counter_d, M_state_counter_q = 1'h0;
  reg [2:0] M_level_reg_d, M_level_reg_q = 1'h0;
  reg [7:0] M_line_counter_d, M_line_counter_q = 1'h0;
  
  always @* begin
    M_game_fsm_d = M_game_fsm_q;
    M_level_reg_d = M_level_reg_q;
    M_line_counter_d = M_line_counter_q;
    M_state_counter_d = M_state_counter_q;
    
    readSpeed = M_level_reg_q;
    if (updateSpeed == 1'h1) begin
      M_level_reg_d = speedSel;
    end
    if (M_level_reg_q >= 3'h5) begin
      M_level_reg_d = 3'h4;
    end
    M_frame_counter_in = 1'h0;
    if (M_level_reg_q == 3'h4) begin
      M_frame_counter_in = M_frame_rate_value[21+0-:1];
    end else begin
      if (M_level_reg_q == 2'h3) begin
        M_frame_counter_in = M_frame_rate2_value[22+0-:1];
      end else begin
        if (M_level_reg_q == 2'h2) begin
          M_frame_counter_in = M_frame_rate3_value[22+0-:1];
        end else begin
          if (M_level_reg_q == 1'h1) begin
            M_frame_counter_in = M_frame_rate4_value[23+0-:1];
          end else begin
            if (M_level_reg_q == 1'h0) begin
              M_frame_counter_in = M_frame_rate5_value[23+0-:1];
            end
          end
        end
      end
    end
    alufn = 1'h0;
    asel = 1'h0;
    bsel = 1'h0;
    we = 1'h0;
    wdsel = 1'h0;
    regfile_write_address = 1'h0;
    regfile_read_address_a = 1'h0;
    regfile_read_address_b = 1'h0;
    state = M_state_counter_q;
    if (rst) begin
      M_game_fsm_d = IDLE_game_fsm;
    end else begin
      
      case (M_game_fsm_q)
        DEBUG_game_fsm: begin
          we = 1'h0;
        end
        IDLE_game_fsm: begin
          regfile_write_address = 4'hb;
          wdsel = 2'h1;
          we = 1'h1;
          M_line_counter_d = 16'h0000;
          regfile_read_address_a = 4'hb;
          M_state_counter_d = 1'h0;
          if (button) begin
            M_game_fsm_d = SETSTART_game_fsm;
          end else begin
            M_game_fsm_d = IDLE_game_fsm;
          end
        end
        SETSTART_game_fsm: begin
          regfile_write_address = 4'h9;
          we = 1'h1;
          wdsel = 2'h2;
          M_state_counter_d = 1'h1;
          regfile_read_address_a = 4'hb;
          M_game_fsm_d = RESET2_game_fsm;
        end
        RESET2_game_fsm: begin
          regfile_write_address = 4'h2;
          wdsel = 2'h1;
          we = 1'h1;
          regfile_read_address_a = 4'hb;
          M_state_counter_d = 2'h2;
          M_game_fsm_d = RESET3_game_fsm;
        end
        RESET3_game_fsm: begin
          regfile_write_address = 4'h3;
          wdsel = 2'h1;
          we = 1'h1;
          regfile_read_address_a = 4'hb;
          M_state_counter_d = 2'h3;
          M_game_fsm_d = RESET4_game_fsm;
        end
        RESET4_game_fsm: begin
          regfile_write_address = 4'h4;
          wdsel = 2'h1;
          we = 1'h1;
          regfile_read_address_a = 4'hb;
          M_state_counter_d = 3'h4;
          M_game_fsm_d = RESET5_game_fsm;
        end
        RESET5_game_fsm: begin
          regfile_write_address = 4'h5;
          wdsel = 2'h1;
          we = 1'h1;
          regfile_read_address_a = 4'hb;
          M_state_counter_d = 3'h5;
          M_game_fsm_d = RESET6_game_fsm;
        end
        RESET6_game_fsm: begin
          regfile_write_address = 4'h6;
          wdsel = 2'h1;
          we = 1'h1;
          M_state_counter_d = 3'h6;
          regfile_read_address_a = 4'hb;
          M_game_fsm_d = RESET7_game_fsm;
        end
        RESET7_game_fsm: begin
          regfile_write_address = 4'h7;
          wdsel = 1'h1;
          we = 1'h1;
          M_state_counter_d = 3'h7;
          regfile_read_address_a = 10'h3f3;
          M_game_fsm_d = RESET8_game_fsm;
        end
        RESET8_game_fsm: begin
          regfile_write_address = 4'h8;
          wdsel = 2'h1;
          we = 1'h1;
          M_state_counter_d = 4'h8;
          regfile_read_address_a = 4'hb;
          M_game_fsm_d = INCREASELINE_game_fsm;
        end
        INCREASELINE_game_fsm: begin
          regfile_read_address_a = 4'hb;
          regfile_write_address = 4'hb;
          alufn = 6'h00;
          asel = 2'h0;
          bsel = 2'h1;
          we = 1'h1;
          M_state_counter_d = 4'h9;
          M_line_counter_d = M_line_counter_q + 1'h1;
          M_game_fsm_d = DETERMINENEXT_game_fsm;
        end
        DETERMINENEXT_game_fsm: begin
          we = 1'h0;
          regfile_read_address_b = 4'hb;
          M_state_counter_d = 4'ha;
          if (regfiledatab == 16'h0001) begin
            M_game_fsm_d = LINE1_game_fsm;
          end else begin
            if (regfiledatab == 16'h0002) begin
              M_game_fsm_d = LINE2_game_fsm;
            end else begin
              if (regfiledatab == 16'h0003) begin
                M_game_fsm_d = LINE3_game_fsm;
              end else begin
                if (regfiledatab == 16'h0004) begin
                  M_game_fsm_d = LINE4_game_fsm;
                end else begin
                  if (regfiledatab == 16'h0005) begin
                    M_game_fsm_d = LINE5_game_fsm;
                  end else begin
                    if (regfiledatab == 16'h0006) begin
                      M_game_fsm_d = LINE6_game_fsm;
                    end else begin
                      if (regfiledatab == 16'h0007) begin
                        M_game_fsm_d = LINE7_game_fsm;
                      end else begin
                        if (regfiledatab == 16'h0008) begin
                          M_game_fsm_d = LINE8_game_fsm;
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
        LINE1_game_fsm: begin
          we = 1'h1;
          regfile_write_address = 4'h1;
          regfile_read_address_a = 4'h9;
          alufn = 6'h1a;
          asel = 2'h0;
          bsel = 2'h0;
          wdsel = 2'h0;
          M_state_counter_d = 4'hb;
          M_game_fsm_d = SHIFTL1_game_fsm;
        end
        LINE2_game_fsm: begin
          asel = 2'h0;
          we = 1'h1;
          regfile_write_address = 4'h2;
          regfile_read_address_a = 4'h9;
          alufn = 6'h1a;
          asel = 2'h0;
          bsel = 2'h0;
          wdsel = 2'h0;
          M_state_counter_d = 4'hc;
          if (button) begin
            M_game_fsm_d = CHECK2_game_fsm;
          end else begin
            M_game_fsm_d = SHIFTL2_game_fsm;
          end
        end
        LINE3_game_fsm: begin
          we = 1'h1;
          regfile_write_address = 4'h3;
          regfile_read_address_a = 4'h9;
          alufn = 6'h1a;
          asel = 2'h0;
          bsel = 2'h0;
          wdsel = 2'h0;
          M_state_counter_d = 4'hd;
          if (button) begin
            M_game_fsm_d = CHECK3_game_fsm;
          end else begin
            M_game_fsm_d = SHIFTL3_game_fsm;
          end
        end
        LINE4_game_fsm: begin
          alufn = 6'h1a;
          asel = 2'h0;
          bsel = 2'h0;
          wdsel = 2'h0;
          we = 1'h1;
          regfile_write_address = 4'h4;
          regfile_read_address_a = 4'h9;
          M_state_counter_d = 4'he;
          if (button) begin
            M_game_fsm_d = CHECK4_game_fsm;
          end else begin
            M_game_fsm_d = SHIFTL4_game_fsm;
          end
        end
        LINE5_game_fsm: begin
          we = 1'h1;
          regfile_write_address = 4'h5;
          regfile_read_address_a = 4'h9;
          alufn = 6'h1a;
          asel = 2'h0;
          bsel = 2'h0;
          wdsel = 2'h0;
          M_state_counter_d = 4'hf;
          if (button) begin
            M_game_fsm_d = CHECK5_game_fsm;
          end else begin
            M_game_fsm_d = SHIFTL5_game_fsm;
          end
        end
        LINE6_game_fsm: begin
          alufn = 6'h1a;
          asel = 2'h0;
          bsel = 2'h0;
          wdsel = 2'h0;
          we = 1'h1;
          regfile_write_address = 4'h6;
          regfile_read_address_a = 4'h9;
          M_state_counter_d = 5'h10;
          if (button) begin
            M_game_fsm_d = CHECK6_game_fsm;
          end else begin
            M_game_fsm_d = SHIFTL6_game_fsm;
          end
        end
        LINE7_game_fsm: begin
          alufn = 6'h1a;
          asel = 2'h0;
          bsel = 2'h0;
          wdsel = 2'h0;
          we = 1'h1;
          regfile_write_address = 4'h7;
          regfile_read_address_a = 4'h9;
          M_state_counter_d = 5'h11;
          if (button) begin
            M_game_fsm_d = CHECK7_game_fsm;
          end else begin
            M_game_fsm_d = SHIFTL7_game_fsm;
          end
        end
        LINE8_game_fsm: begin
          alufn = 6'h1a;
          asel = 2'h0;
          bsel = 2'h0;
          wdsel = 2'h0;
          we = 1'h1;
          regfile_write_address = 4'h8;
          regfile_read_address_a = 4'h9;
          M_state_counter_d = 5'h12;
          if (button) begin
            M_game_fsm_d = CHECK8_game_fsm;
          end else begin
            M_game_fsm_d = SHIFTL8_game_fsm;
          end
        end
        LOSE_game_fsm: begin
          wdsel = 2'h1;
          regfile_write_address = 4'h0;
          we = 1'h1;
          M_state_counter_d = 5'h13;
          M_level_reg_d = 1'h0;
          if (button) begin
            M_game_fsm_d = IDLE_game_fsm;
          end else begin
            M_game_fsm_d = LOSE_game_fsm;
          end
        end
        CHECK2_game_fsm: begin
          alufn = 6'h18;
          regfile_read_address_a = 4'h2;
          regfile_read_address_b = 4'h1;
          regfile_write_address = 4'h9;
          we = 1'h1;
          asel = 2'h0;
          bsel = 2'h0;
          M_state_counter_d = 5'h14;
          M_game_fsm_d = CHECKLOSE_game_fsm;
        end
        CHECK3_game_fsm: begin
          alufn = 6'h18;
          regfile_read_address_a = 4'h3;
          regfile_read_address_b = 4'h2;
          regfile_write_address = 4'h9;
          we = 1'h1;
          asel = 2'h0;
          bsel = 2'h0;
          M_state_counter_d = 5'h15;
          M_game_fsm_d = CHECKLOSE_game_fsm;
        end
        CHECK4_game_fsm: begin
          alufn = 6'h18;
          regfile_read_address_a = 4'h4;
          regfile_read_address_b = 4'h3;
          regfile_write_address = 4'h9;
          we = 1'h1;
          asel = 2'h0;
          bsel = 2'h0;
          M_state_counter_d = 5'h16;
          M_game_fsm_d = CHECKLOSE_game_fsm;
        end
        CHECK5_game_fsm: begin
          alufn = 6'h18;
          regfile_read_address_a = 4'h5;
          regfile_read_address_b = 4'h4;
          regfile_write_address = 4'h9;
          we = 1'h1;
          asel = 2'h0;
          bsel = 2'h0;
          M_state_counter_d = 5'h17;
          M_game_fsm_d = CHECKLOSE_game_fsm;
        end
        CHECK6_game_fsm: begin
          alufn = 6'h18;
          regfile_read_address_a = 4'h6;
          regfile_read_address_b = 4'h5;
          regfile_write_address = 4'h9;
          we = 1'h1;
          asel = 2'h0;
          bsel = 2'h0;
          M_state_counter_d = 5'h18;
          M_game_fsm_d = CHECKLOSE_game_fsm;
        end
        CHECK7_game_fsm: begin
          alufn = 6'h18;
          regfile_read_address_a = 4'h7;
          regfile_read_address_b = 4'h6;
          regfile_write_address = 4'h9;
          we = 1'h1;
          asel = 2'h0;
          bsel = 2'h0;
          M_state_counter_d = 5'h19;
          M_game_fsm_d = CHECKLOSE_game_fsm;
        end
        CHECK8_game_fsm: begin
          alufn = 6'h18;
          regfile_read_address_a = 4'h8;
          regfile_read_address_b = 4'h7;
          regfile_write_address = 4'h9;
          we = 1'h1;
          asel = 2'h0;
          bsel = 2'h0;
          M_state_counter_d = 5'h1a;
          M_game_fsm_d = CHECKLOSE_game_fsm;
        end
        CHECKLOSE_game_fsm: begin
          regfile_read_address_b = 4'h9;
          regfile_read_address_a = 4'hb;
          if (regfiledatab == 16'h0000) begin
            M_game_fsm_d = LOSE_game_fsm;
          end else begin
            if (regfiledataa == 16'h0008) begin
              M_game_fsm_d = LEVELUP_game_fsm;
            end else begin
              M_game_fsm_d = UPDATELINE_game_fsm;
            end
          end
          M_state_counter_d = 5'h1b;
        end
        SHIFTL1_game_fsm: begin
          regfile_read_address_b = 4'h1;
          M_state_counter_d = 5'h1c;
          if (button) begin
            M_game_fsm_d = INCREASELINE_game_fsm;
          end else begin
            if (regfiledatab[7+0-:1] == 1'h1) begin
              M_game_fsm_d = SHIFTR1_game_fsm;
            end else begin
              if (M_frame_counter_out == 1'h1) begin
                alufn = 6'h20;
                regfile_read_address_a = 4'h1;
                regfile_write_address = 4'h1;
                bsel = 2'h1;
                asel = 2'h0;
                we = 1'h1;
                M_game_fsm_d = SHIFTL1_game_fsm;
              end
            end
          end
        end
        SHIFTL2_game_fsm: begin
          regfile_read_address_b = 4'h2;
          M_state_counter_d = 5'h1d;
          if (button) begin
            M_game_fsm_d = CHECK2_game_fsm;
          end else begin
            if (regfiledatab[7+0-:1] == 1'h1) begin
              M_game_fsm_d = SHIFTR2_game_fsm;
            end else begin
              if (M_frame_counter_out == 1'h1) begin
                alufn = 6'h20;
                regfile_read_address_a = 4'h2;
                regfile_write_address = 4'h2;
                bsel = 2'h1;
                asel = 2'h0;
                we = 1'h1;
                M_game_fsm_d = SHIFTL2_game_fsm;
              end
            end
          end
        end
        SHIFTL3_game_fsm: begin
          regfile_read_address_b = 4'h3;
          M_state_counter_d = 5'h1e;
          if (button) begin
            M_game_fsm_d = CHECK3_game_fsm;
          end else begin
            if (regfiledatab[7+0-:1] == 1'h1) begin
              M_game_fsm_d = SHIFTR3_game_fsm;
            end else begin
              if (M_frame_counter_out == 1'h1) begin
                alufn = 6'h20;
                regfile_read_address_a = 4'h3;
                regfile_write_address = 4'h3;
                bsel = 2'h1;
                asel = 2'h0;
                we = 1'h1;
                M_game_fsm_d = SHIFTL3_game_fsm;
              end
            end
          end
        end
        SHIFTL4_game_fsm: begin
          regfile_read_address_b = 4'h4;
          if (button) begin
            M_game_fsm_d = CHECK4_game_fsm;
          end else begin
            if (regfiledatab[7+0-:1] == 1'h1) begin
              M_game_fsm_d = SHIFTR4_game_fsm;
            end else begin
              if (M_frame_counter_out == 1'h1) begin
                alufn = 6'h20;
                regfile_read_address_a = 4'h4;
                regfile_write_address = 4'h4;
                bsel = 2'h1;
                asel = 2'h0;
                we = 1'h1;
                M_state_counter_d = 5'h1f;
                M_game_fsm_d = SHIFTL4_game_fsm;
              end
            end
          end
        end
        SHIFTL5_game_fsm: begin
          regfile_read_address_b = 4'h5;
          M_state_counter_d = 6'h20;
          if (button) begin
            M_game_fsm_d = CHECK5_game_fsm;
          end else begin
            if (regfiledatab[7+0-:1] == 1'h1) begin
              M_game_fsm_d = SHIFTR5_game_fsm;
            end else begin
              if (M_frame_counter_out == 1'h1) begin
                alufn = 6'h20;
                regfile_read_address_a = 4'h5;
                regfile_write_address = 4'h5;
                bsel = 2'h1;
                asel = 2'h0;
                we = 1'h1;
                M_game_fsm_d = SHIFTL5_game_fsm;
              end
            end
          end
        end
        SHIFTL6_game_fsm: begin
          regfile_read_address_b = 4'h6;
          M_state_counter_d = 6'h21;
          if (button) begin
            M_game_fsm_d = CHECK6_game_fsm;
          end else begin
            if (regfiledatab[7+0-:1] == 1'h1) begin
              M_game_fsm_d = SHIFTR6_game_fsm;
            end else begin
              if (M_frame_counter_out == 1'h1) begin
                alufn = 6'h20;
                regfile_read_address_a = 4'h6;
                regfile_write_address = 4'h6;
                bsel = 2'h1;
                asel = 2'h0;
                we = 1'h1;
                M_game_fsm_d = SHIFTL6_game_fsm;
              end
            end
          end
        end
        SHIFTL7_game_fsm: begin
          regfile_read_address_b = 4'h7;
          M_state_counter_d = 6'h22;
          if (button) begin
            M_game_fsm_d = CHECK7_game_fsm;
          end else begin
            if (regfiledatab[7+0-:1] == 1'h1) begin
              M_game_fsm_d = SHIFTR7_game_fsm;
            end else begin
              if (M_frame_counter_out == 1'h1) begin
                alufn = 6'h20;
                regfile_read_address_a = 4'h7;
                regfile_write_address = 4'h7;
                bsel = 2'h1;
                asel = 2'h0;
                we = 1'h1;
                M_game_fsm_d = SHIFTL7_game_fsm;
              end
            end
          end
        end
        SHIFTL8_game_fsm: begin
          regfile_read_address_b = 10'h3e8;
          M_state_counter_d = 6'h23;
          if (button) begin
            M_game_fsm_d = CHECK8_game_fsm;
          end else begin
            if (regfiledatab[7+0-:1] == 1'h1) begin
              M_game_fsm_d = SHIFTR8_game_fsm;
            end else begin
              if (M_frame_counter_out == 1'h1) begin
                alufn = 6'h20;
                regfile_read_address_a = 4'h8;
                regfile_write_address = 4'h8;
                bsel = 2'h1;
                asel = 2'h0;
                we = 1'h1;
                M_game_fsm_d = SHIFTL8_game_fsm;
              end
            end
          end
        end
        SHIFTR1_game_fsm: begin
          regfile_read_address_b = 1'h1;
          M_state_counter_d = 6'h24;
          if (button) begin
            M_game_fsm_d = INCREASELINE_game_fsm;
          end else begin
            if (regfiledatab[0+0-:1] == 1'h1) begin
              M_game_fsm_d = SHIFTL1_game_fsm;
            end else begin
              if (M_frame_counter_out == 1'h1) begin
                alufn = 6'h21;
                regfile_read_address_a = 4'h1;
                regfile_write_address = 4'h1;
                bsel = 2'h1;
                asel = 2'h0;
                we = 1'h1;
                M_game_fsm_d = SHIFTR1_game_fsm;
              end
            end
          end
        end
        SHIFTR2_game_fsm: begin
          regfile_read_address_b = 4'h2;
          M_state_counter_d = 6'h25;
          if (button) begin
            M_game_fsm_d = CHECK2_game_fsm;
          end else begin
            if (regfiledatab[0+0-:1] == 1'h1) begin
              M_game_fsm_d = SHIFTL2_game_fsm;
            end else begin
              if (M_frame_counter_out == 1'h1) begin
                alufn = 6'h21;
                regfile_read_address_a = 4'h2;
                regfile_write_address = 4'h2;
                bsel = 2'h1;
                asel = 2'h0;
                we = 1'h1;
                M_game_fsm_d = SHIFTR2_game_fsm;
              end
            end
          end
        end
        SHIFTR3_game_fsm: begin
          regfile_read_address_b = 4'h3;
          M_state_counter_d = 6'h26;
          if (button) begin
            M_game_fsm_d = CHECK3_game_fsm;
          end else begin
            if (regfiledatab[0+0-:1] == 1'h1) begin
              M_game_fsm_d = SHIFTL3_game_fsm;
            end else begin
              if (M_frame_counter_out == 1'h1) begin
                alufn = 6'h21;
                regfile_read_address_a = 4'h3;
                regfile_write_address = 4'h3;
                bsel = 2'h1;
                asel = 2'h0;
                we = 1'h1;
                M_game_fsm_d = SHIFTR3_game_fsm;
              end
            end
          end
        end
        SHIFTR4_game_fsm: begin
          regfile_read_address_b = 7'h64;
          M_state_counter_d = 6'h27;
          if (button) begin
            M_game_fsm_d = CHECK4_game_fsm;
          end else begin
            if (regfiledatab[0+0-:1] == 1'h1) begin
              M_game_fsm_d = SHIFTL4_game_fsm;
            end else begin
              if (M_frame_counter_out == 1'h1) begin
                alufn = 6'h21;
                regfile_read_address_a = 4'h4;
                regfile_write_address = 4'h4;
                bsel = 2'h1;
                asel = 2'h0;
                we = 1'h1;
                M_game_fsm_d = SHIFTR4_game_fsm;
              end
            end
          end
        end
        SHIFTR5_game_fsm: begin
          regfile_read_address_b = 4'h5;
          M_state_counter_d = 6'h28;
          if (button) begin
            M_game_fsm_d = CHECK5_game_fsm;
          end else begin
            if (regfiledatab[0+0-:1] == 1'h1) begin
              M_game_fsm_d = SHIFTL5_game_fsm;
            end else begin
              if (M_frame_counter_out == 1'h1) begin
                alufn = 6'h21;
                regfile_read_address_a = 4'h5;
                regfile_write_address = 4'h5;
                bsel = 2'h1;
                asel = 2'h0;
                we = 1'h1;
                M_game_fsm_d = SHIFTR5_game_fsm;
              end
            end
          end
        end
        SHIFTR6_game_fsm: begin
          regfile_read_address_b = 4'h6;
          M_state_counter_d = 6'h29;
          if (button) begin
            M_game_fsm_d = CHECK6_game_fsm;
          end else begin
            if (regfiledatab[0+0-:1] == 1'h1) begin
              M_game_fsm_d = SHIFTL6_game_fsm;
            end else begin
              if (M_frame_counter_out == 1'h1) begin
                alufn = 6'h21;
                regfile_read_address_a = 4'h6;
                regfile_write_address = 4'h6;
                bsel = 2'h1;
                asel = 2'h0;
                we = 1'h1;
                M_game_fsm_d = SHIFTR6_game_fsm;
              end
            end
          end
        end
        SHIFTR7_game_fsm: begin
          regfile_read_address_b = 4'h7;
          M_state_counter_d = 6'h2a;
          if (button) begin
            M_game_fsm_d = CHECK7_game_fsm;
          end else begin
            if (regfiledatab[0+0-:1] == 1'h1) begin
              M_game_fsm_d = SHIFTL7_game_fsm;
            end else begin
              if (M_frame_counter_out == 1'h1) begin
                alufn = 6'h21;
                regfile_read_address_a = 4'h7;
                regfile_write_address = 4'h7;
                bsel = 2'h1;
                asel = 2'h0;
                we = 1'h1;
                M_game_fsm_d = SHIFTR7_game_fsm;
              end
            end
          end
        end
        SHIFTR8_game_fsm: begin
          regfile_read_address_b = 4'h8;
          M_state_counter_d = 6'h2b;
          if (button) begin
            M_game_fsm_d = CHECK8_game_fsm;
          end else begin
            if (regfiledatab[0+0-:1] == 1'h1) begin
              M_game_fsm_d = SHIFTL8_game_fsm;
            end else begin
              if (M_frame_counter_out == 1'h1) begin
                alufn = 6'h21;
                regfile_read_address_a = 4'h8;
                regfile_write_address = 4'h8;
                bsel = 2'h1;
                asel = 2'h0;
                we = 1'h1;
                M_game_fsm_d = SHIFTR8_game_fsm;
              end
            end
          end
        end
        LEVELUP_game_fsm: begin
          alufn = 6'h1a;
          regfile_read_address_a = 4'h9;
          regfile_write_address = 4'h1;
          asel = 2'h0;
          bsel = 2'h0;
          we = 1'h1;
          M_state_counter_d = 6'h2c;
          M_line_counter_d = 16'h0000;
          if (M_level_reg_q < 3'h5) begin
            M_level_reg_d = M_level_reg_q + 1'h1;
          end
          M_game_fsm_d = INCREASESCORE_game_fsm;
        end
        INCREASESCORE_game_fsm: begin
          alufn = 6'h00;
          regfile_read_address_a = 4'h0;
          regfile_write_address = 4'h0;
          asel = 2'h0;
          bsel = 2'h1;
          we = 1'h1;
          M_state_counter_d = 6'h2d;
          M_game_fsm_d = RESETLINE_game_fsm;
        end
        RESETLINE_game_fsm: begin
          regfile_write_address = 4'hb;
          wdsel = 2'h1;
          we = 1'h1;
          M_state_counter_d = 6'h2e;
          M_game_fsm_d = RESET2_game_fsm;
        end
        UPDATELINE_game_fsm: begin
          M_state_counter_d = 6'h2f;
          regfile_read_address_a = 4'h9;
          asel = 2'h0;
          bsel = 2'h0;
          alufn = 6'h1a;
          regfile_write_address = M_line_counter_q[0+3-:4];
          we = 1'h1;
          wdsel = 2'h0;
          M_game_fsm_d = INCREASELINE_game_fsm;
        end
      endcase
    end
  end
  
  always @(posedge clk) begin
    M_game_fsm_q <= M_game_fsm_d;
    
    if (rst == 1'b1) begin
      M_state_counter_q <= 1'h0;
      M_level_reg_q <= 1'h0;
      M_line_counter_q <= 1'h0;
    end else begin
      M_state_counter_q <= M_state_counter_d;
      M_level_reg_q <= M_level_reg_d;
      M_line_counter_q <= M_line_counter_d;
    end
  end
  
endmodule