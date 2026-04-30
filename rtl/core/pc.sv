`timescale 1ns/1ps
module pc (
    input logic clk,
    input logic rst_n, //active low reset
    input logic [31:0] pc_next_i,
    output logic [31:0] pc_o
);

//always_ff tells that the code is completely sequential logic
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        pc_o <= 32'b0;
    end
    else begin
        pc_o <= pc_next_i;
    end
end

endmodule