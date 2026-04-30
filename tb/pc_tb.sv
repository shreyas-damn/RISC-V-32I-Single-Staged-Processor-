`timescale 1ns/1ps
module pc_tb;
logic clk;
logic rst_n;
logic [31:0] pc_next_i;
logic [31:0] pc_o;

pc UUT (
    .clk(clk),
    .rst_n(rst_n),
    .pc_next_i(pc_next_i),
    .pc_o(pc_o)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("sim.vcd");
    $dumpvars(0,pc_tb);
    $monitor("TIME=%0t | rst_n=%b | pc_next_i=%0d | pc_o=%0d", $time, rst_n, pc_next_i, pc_o);
    clk = 0;
    rst_n = 0;
    pc_next_i = 0;
    #5
    rst_n = 1;
    #5
    pc_next_i = 5;
    #5
    pc_next_i = 10;
    #10
    pc_next_i = 20;
    #10
    pc_next_i = 30;
    $finish;
end

endmodule