/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module game_miniRegfiles_14 (
    input clk,
    input rst,
    input [3:0] write_address,
    input we,
    input [15:0] data,
    input [3:0] read_address_a,
    input [3:0] read_address_b,
    output reg [15:0] out_a,
    output reg [15:0] out_b,
    output reg [15:0] r1_out,
    output reg [15:0] r2_out,
    output reg [15:0] r3_out,
    output reg [15:0] r4_out,
    output reg [15:0] r5_out,
    output reg [15:0] r6_out,
    output reg [15:0] r7_out,
    output reg [15:0] r8_out,
    output reg [15:0] reg11_current_line_index,
    output reg [15:0] reg0_speed_frame_count,
    output reg [15:0] reg9_and_computation
  );
  
  
  
  reg [15:0] M_gamestate_r0_d, M_gamestate_r0_q = 1'h0;
  reg [15:0] M_line1_r1_d, M_line1_r1_q = 16'h003c;
  reg [15:0] M_line2_r2_d, M_line2_r2_q = 16'h007e;
  reg [15:0] M_line3_r3_d, M_line3_r3_q = 16'h005e;
  reg [15:0] M_line4_r4_d, M_line4_r4_q = 16'h00df;
  reg [15:0] M_line5_r5_d, M_line5_r5_q = 16'h00d6;
  reg [15:0] M_line6_r6_d, M_line6_r6_q = 16'h001f;
  reg [15:0] M_line7_r7_d, M_line7_r7_q = 16'h0031;
  reg [15:0] M_line8_r8_d, M_line8_r8_q = 16'h0063;
  reg [15:0] M_and_result_r9_d, M_and_result_r9_q = 1'h0;
  reg [15:0] M_current_line_r11_d, M_current_line_r11_q = 1'h0;
  
  always @* begin
    M_gamestate_r0_d = M_gamestate_r0_q;
    M_line1_r1_d = M_line1_r1_q;
    M_line2_r2_d = M_line2_r2_q;
    M_line5_r5_d = M_line5_r5_q;
    M_line6_r6_d = M_line6_r6_q;
    M_line3_r3_d = M_line3_r3_q;
    M_line4_r4_d = M_line4_r4_q;
    M_and_result_r9_d = M_and_result_r9_q;
    M_line7_r7_d = M_line7_r7_q;
    M_line8_r8_d = M_line8_r8_q;
    M_current_line_r11_d = M_current_line_r11_q;
    
    r1_out = M_line1_r1_q[0+7-:8];
    r2_out = M_line2_r2_q[0+7-:8];
    r3_out = M_line3_r3_q[0+7-:8];
    r4_out = M_line4_r4_q[0+7-:8];
    r5_out = M_line5_r5_q[0+7-:8];
    r6_out = M_line6_r6_q[0+7-:8];
    r7_out = M_line7_r7_q[0+7-:8];
    r8_out = M_line8_r8_q[0+7-:8];
    if (we) begin
      
      case (write_address)
        4'h0: begin
          M_gamestate_r0_d = data;
        end
        4'h1: begin
          M_line1_r1_d = data;
        end
        4'h2: begin
          M_line2_r2_d = data;
        end
        4'h3: begin
          M_line3_r3_d = data;
        end
        4'h4: begin
          M_line4_r4_d = data;
        end
        4'h5: begin
          M_line5_r5_d = data;
        end
        4'h6: begin
          M_line6_r6_d = data;
        end
        4'h7: begin
          M_line7_r7_d = data;
        end
        4'h8: begin
          M_line8_r8_d = data;
        end
        4'h9: begin
          M_and_result_r9_d = data;
        end
        4'hb: begin
          M_current_line_r11_d = data;
        end
      endcase
    end
    
    case (read_address_a)
      4'h0: begin
        out_a = M_gamestate_r0_q;
      end
      4'h1: begin
        out_a = M_line1_r1_q;
      end
      4'h2: begin
        out_a = M_line2_r2_q;
      end
      4'h3: begin
        out_a = M_line3_r3_q;
      end
      4'h4: begin
        out_a = M_line4_r4_q;
      end
      4'h5: begin
        out_a = M_line5_r5_q;
      end
      4'h6: begin
        out_a = M_line6_r6_q;
      end
      4'h7: begin
        out_a = M_line7_r7_q;
      end
      4'h8: begin
        out_a = M_line8_r8_q;
      end
      4'h9: begin
        out_a = M_and_result_r9_q;
      end
      4'hb: begin
        out_a = M_current_line_r11_q;
      end
      default: begin
        out_a = 1'h0;
      end
    endcase
    
    case (read_address_b)
      4'h0: begin
        out_b = M_gamestate_r0_q;
      end
      4'h1: begin
        out_b = M_line1_r1_q;
      end
      4'h2: begin
        out_b = M_line2_r2_q;
      end
      4'h3: begin
        out_b = M_line3_r3_q;
      end
      4'h4: begin
        out_b = M_line4_r4_q;
      end
      4'h5: begin
        out_b = M_line5_r5_q;
      end
      4'h6: begin
        out_b = M_line6_r6_q;
      end
      4'h7: begin
        out_b = M_line7_r7_q;
      end
      4'h8: begin
        out_b = M_line8_r8_q;
      end
      4'h9: begin
        out_b = M_and_result_r9_q;
      end
      4'hb: begin
        out_b = M_current_line_r11_q;
      end
      default: begin
        out_b = 1'h0;
      end
    endcase
    reg0_speed_frame_count = M_gamestate_r0_q;
    reg9_and_computation = M_and_result_r9_q;
    reg11_current_line_index = M_current_line_r11_q;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_gamestate_r0_q <= 1'h0;
    end else begin
      M_gamestate_r0_q <= M_gamestate_r0_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_line3_r3_q <= 16'h005e;
    end else begin
      M_line3_r3_q <= M_line3_r3_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_line7_r7_q <= 16'h0031;
    end else begin
      M_line7_r7_q <= M_line7_r7_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_line8_r8_q <= 16'h0063;
    end else begin
      M_line8_r8_q <= M_line8_r8_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_current_line_r11_q <= 1'h0;
    end else begin
      M_current_line_r11_q <= M_current_line_r11_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_and_result_r9_q <= 1'h0;
    end else begin
      M_and_result_r9_q <= M_and_result_r9_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_line6_r6_q <= 16'h001f;
    end else begin
      M_line6_r6_q <= M_line6_r6_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_line5_r5_q <= 16'h00d6;
    end else begin
      M_line5_r5_q <= M_line5_r5_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_line2_r2_q <= 16'h007e;
    end else begin
      M_line2_r2_q <= M_line2_r2_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_line1_r1_q <= 16'h003c;
    end else begin
      M_line1_r1_q <= M_line1_r1_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_line4_r4_q <= 16'h00df;
    end else begin
      M_line4_r4_q <= M_line4_r4_d;
    end
  end
  
endmodule
