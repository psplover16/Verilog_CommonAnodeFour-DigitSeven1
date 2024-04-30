module tt(clk,seg,way,showDigit,showNum);
input clk;// 
output reg[7:0] seg;
output reg[3:0] way; 
// 
input [3:0] showDigit; //
input [5:0] showNum;
// 
reg[13:0] frequency;
// reg [5:0] tmpshowNum;
// 
// assign way = showDigit; // 秀第幾位數
// 
always@(posedge clk)frequency=frequency+1;   
// 


always @(posedge showDigit or posedge showNum or posedge showNum[5])  begin

// 秀第幾位
    case(showDigit)
      1: way = 4'b0001;
      2: way = 4'b0010;
      3: way = 4'b0100;
      4: way = 4'b1000;
    //   0: way = 15'b000000000000001;
    //   1: way = 15'b000000000000010;
    //   2: way = 15'b000000000000100;
    //   3: way = 15'b000000000001000;
    //   4: way = 15'b000000000010000;
    //   5: way = 15'b000000000100000;
    //   6: way = 15'b000000001000000;
    //   7: way = 15'b000000010000000;
    //   8: way = 15'b000000100000000;
    //   9: way = 15'b000001000000000;
        default: way = 4'b0001; // 8.
    endcase


 // 秀數字
    case(showNum)
      0: seg = 8'b00000000;
      1: seg = 8'b01100000;
      2: seg = 8'b11011010;
      3: seg = 8'b11110010;
      4: seg = 8'b01100110;
      5: seg = 8'b10110110;
      6: seg = 8'b00111110;
      7: seg = 8'b11100100;
      8: seg = 8'b11111110;
      9: seg = 8'b11100110;
      default: seg = 8'b11111111; // 8.
    endcase

// 
if(showNum[5]==1)seg[0] = 1;

// if(way[3]==1)seg<=8'b11011010; // 2   a/b/c/d/e/f/g/.
// if(way[2]==1)seg<=8'b11111110; // 8
// if(way[1]==1)seg<=8'b11100111; // . 9
// if(way[0]==1)seg<=8'b01100001; // 1.

end
endmodule

