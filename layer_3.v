`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: layer_3
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module layer_3 #(parameter NEURONS_NUM=30, INPUTS_NUM=784, DATA_WIDTH=16,LAYER_ID=3,
                SIGMOID_SIZE=10, WEIGHT_INTEGER_WIDTH=4,ACT_TYPE="relu")(
    input clk,
    input reset_n,
    input i_weight_valid,
    input i_bias_valid,
    input [31:0] i_bias_value,
    input [31:0] i_weight_value,
    input [31:0] i_layer_id,
    input [31:0] i_neuron_id,
    input i_data_in_valid,
    input [DATA_WIDTH-1:0] i_data_in,
    output [NEURONS_NUM-1:0] o_data_out_valid,
    output [NEURONS_NUM*DATA_WIDTH-1:0] o_data_out
    );
    neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(0),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_3_0.mif"), .BIAS_FILE("b_3_0.mif")) neuron_inst_0
    (
        .clk(clk),
        .reset_n(reset_n),
        .i_data_in(i_data_in),
        .i_weight_valid(i_weight_valid),
        .i_bias_valid(i_bias_valid),
        .i_weight_value(i_weight_value),
        .i_bias_value(i_bias_value),
        .i_layer_id(i_layer_id),
        .i_neuron_id(i_neuron_id),
        .i_data_in_valid(i_data_in_valid),
        .o_data_out_valid(o_data_out_valid[0]),
        .o_data_out(o_data_out[0*DATA_WIDTH+:DATA_WIDTH])
    );
    neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(1),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_3_1.mif"), .BIAS_FILE("b_3_1.mif")) neuron_inst_1
    (
        .clk(clk),
        .reset_n(reset_n),
        .i_data_in(i_data_in),
        .i_weight_valid(i_weight_valid),
        .i_bias_valid(i_bias_valid),
        .i_weight_value(i_weight_value),
        .i_bias_value(i_bias_value),
        .i_layer_id(i_layer_id),
        .i_neuron_id(i_neuron_id),
        .i_data_in_valid(i_data_in_valid),
        .o_data_out_valid(o_data_out_valid[1]),
        .o_data_out(o_data_out[1*DATA_WIDTH+:DATA_WIDTH])
    );
     neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(2),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_3_2.mif"), .BIAS_FILE("b_3_2.mif")) neuron_inst_2
    (
        .clk(clk),
        .reset_n(reset_n),
        .i_data_in(i_data_in),
        .i_weight_valid(i_weight_valid),
        .i_bias_valid(i_bias_valid),
        .i_weight_value(i_weight_value),
        .i_bias_value(i_bias_value),
        .i_layer_id(i_layer_id),
        .i_neuron_id(i_neuron_id),
        .i_data_in_valid(i_data_in_valid),
        .o_data_out_valid(o_data_out_valid[2]),
        .o_data_out(o_data_out[2*DATA_WIDTH+:DATA_WIDTH])
    );
     neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(3),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_3_3.mif"), .BIAS_FILE("b_3_3.mif")) neuron_inst_3
    (
        .clk(clk),
        .reset_n(reset_n),
        .i_data_in(i_data_in),
        .i_weight_valid(i_weight_valid),
        .i_bias_valid(i_bias_valid),
        .i_weight_value(i_weight_value),
        .i_bias_value(i_bias_value),
        .i_layer_id(i_layer_id),
        .i_neuron_id(i_neuron_id),
        .i_data_in_valid(i_data_in_valid),
        .o_data_out_valid(o_data_out_valid[3]),
        .o_data_out(o_data_out[3*DATA_WIDTH+:DATA_WIDTH])
    );
     neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(4),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_3_4.mif"), .BIAS_FILE("b_3_4.mif")) neuron_inst_4
    (
        .clk(clk),
        .reset_n(reset_n),
        .i_data_in(i_data_in),
        .i_weight_valid(i_weight_valid),
        .i_bias_valid(i_bias_valid),
        .i_weight_value(i_weight_value),
        .i_bias_value(i_bias_value),
        .i_layer_id(i_layer_id),
        .i_neuron_id(i_neuron_id),
        .i_data_in_valid(i_data_in_valid),
        .o_data_out_valid(o_data_out_valid[4]),
        .o_data_out(o_data_out[4*DATA_WIDTH+:DATA_WIDTH])
    );
    neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(5),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_3_5.mif"), .BIAS_FILE("b_3_5.mif")) neuron_inst_5
    (
        .clk(clk),
        .reset_n(reset_n),
        .i_data_in(i_data_in),
        .i_weight_valid(i_weight_valid),
        .i_bias_valid(i_bias_valid),
        .i_weight_value(i_weight_value),
        .i_bias_value(i_bias_value),
        .i_layer_id(i_layer_id),
        .i_neuron_id(i_neuron_id),
        .i_data_in_valid(i_data_in_valid),
        .o_data_out_valid(o_data_out_valid[5]),
        .o_data_out(o_data_out[5*DATA_WIDTH+:DATA_WIDTH])
    );
     neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(6),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_3_6.mif"), .BIAS_FILE("b_3_6.mif")) neuron_inst_6
    (
        .clk(clk),
        .reset_n(reset_n),
        .i_data_in(i_data_in),
        .i_weight_valid(i_weight_valid),
        .i_bias_valid(i_bias_valid),
        .i_weight_value(i_weight_value),
        .i_bias_value(i_bias_value),
        .i_layer_id(i_layer_id),
        .i_neuron_id(i_neuron_id),
        .i_data_in_valid(i_data_in_valid),
        .o_data_out_valid(o_data_out_valid[6]),
        .o_data_out(o_data_out[6*DATA_WIDTH+:DATA_WIDTH])
    );
     neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(7),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_3_7.mif"), .BIAS_FILE("b_3_7.mif")) neuron_inst_7
    (
        .clk(clk),
        .reset_n(reset_n),
        .i_data_in(i_data_in),
        .i_weight_valid(i_weight_valid),
        .i_bias_valid(i_bias_valid),
        .i_weight_value(i_weight_value),
        .i_bias_value(i_bias_value),
        .i_layer_id(i_layer_id),
        .i_neuron_id(i_neuron_id),
        .i_data_in_valid(i_data_in_valid),
        .o_data_out_valid(o_data_out_valid[7]),
        .o_data_out(o_data_out[7*DATA_WIDTH+:DATA_WIDTH])
    );
     neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(8),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_3_8.mif"), .BIAS_FILE("b_3_8.mif")) neuron_inst_8
    (
        .clk(clk),
        .reset_n(reset_n),
        .i_data_in(i_data_in),
        .i_weight_valid(i_weight_valid),
        .i_bias_valid(i_bias_valid),
        .i_weight_value(i_weight_value),
        .i_bias_value(i_bias_value),
        .i_layer_id(i_layer_id),
        .i_neuron_id(i_neuron_id),
        .i_data_in_valid(i_data_in_valid),
        .o_data_out_valid(o_data_out_valid[8]),
        .o_data_out(o_data_out[8*DATA_WIDTH+:DATA_WIDTH])
    );
     neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(9),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_3_9.mif"), .BIAS_FILE("b_3_9.mif")) neuron_inst_9
    (
        .clk(clk),
        .reset_n(reset_n),
        .i_data_in(i_data_in),
        .i_weight_valid(i_weight_valid),
        .i_bias_valid(i_bias_valid),
        .i_weight_value(i_weight_value),
        .i_bias_value(i_bias_value),
        .i_layer_id(i_layer_id),
        .i_neuron_id(i_neuron_id),
        .i_data_in_valid(i_data_in_valid),
        .o_data_out_valid(o_data_out_valid[9]),
        .o_data_out(o_data_out[9*DATA_WIDTH+:DATA_WIDTH])
    );
    
endmodule
