`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: layer_1
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


module layer_1 #(parameter NEURONS_NUM=30, INPUTS_NUM=784, DATA_WIDTH=16,LAYER_ID=1,
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
    .WEIGHT_FILE("w_1_0.mif"), .BIAS_FILE("b_1_0.mif")) neuron_inst_0
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
    .WEIGHT_FILE("w_1_1.mif"), .BIAS_FILE("b_1_1.mif")) neuron_inst_1
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
    .WEIGHT_FILE("w_1_2.mif"), .BIAS_FILE("b_1_2.mif")) neuron_inst_2
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
    .WEIGHT_FILE("w_1_3.mif"), .BIAS_FILE("b_1_3.mif")) neuron_inst_3
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
    .WEIGHT_FILE("w_1_4.mif"), .BIAS_FILE("b_1_4.mif")) neuron_inst_4
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
    .WEIGHT_FILE("w_1_5.mif"), .BIAS_FILE("b_1_5.mif")) neuron_inst_5
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
    .WEIGHT_FILE("w_1_6.mif"), .BIAS_FILE("b_1_6.mif")) neuron_inst_6
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
    .WEIGHT_FILE("w_1_7.mif"), .BIAS_FILE("b_1_7.mif")) neuron_inst_7
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
    .WEIGHT_FILE("w_1_8.mif"), .BIAS_FILE("b_1_8.mif")) neuron_inst_8
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
    .WEIGHT_FILE("w_1_9.mif"), .BIAS_FILE("b_1_9.mif")) neuron_inst_9
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
    
    neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(10),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_1_10.mif"), .BIAS_FILE("b_1_10.mif")) neuron_inst_10
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
        .o_data_out_valid(o_data_out_valid[10]),
        .o_data_out(o_data_out[10*DATA_WIDTH+:DATA_WIDTH])
    );
    neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(11),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_1_11.mif"), .BIAS_FILE("b_1_11.mif")) neuron_inst_11
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
        .o_data_out_valid(o_data_out_valid[11]),
        .o_data_out(o_data_out[11*DATA_WIDTH+:DATA_WIDTH])
    );
     neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(12),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_1_12.mif"), .BIAS_FILE("b_1_12.mif")) neuron_inst_12
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
        .o_data_out_valid(o_data_out_valid[12]),
        .o_data_out(o_data_out[12*DATA_WIDTH+:DATA_WIDTH])
    );
     neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(13),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_1_13.mif"), .BIAS_FILE("b_1_13.mif")) neuron_inst_13
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
        .o_data_out_valid(o_data_out_valid[13]),
        .o_data_out(o_data_out[13*DATA_WIDTH+:DATA_WIDTH])
    );
     neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(14),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_1_14.mif"), .BIAS_FILE("b_1_14.mif")) neuron_inst_14
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
        .o_data_out_valid(o_data_out_valid[14]),
        .o_data_out(o_data_out[14*DATA_WIDTH+:DATA_WIDTH])
    );
    neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(15),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_1_15.mif"), .BIAS_FILE("b_1_15.mif")) neuron_inst_15
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
        .o_data_out_valid(o_data_out_valid[15]),
        .o_data_out(o_data_out[15*DATA_WIDTH+:DATA_WIDTH])
    );
    neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(16),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_1_16.mif"), .BIAS_FILE("b_1_16.mif")) neuron_inst_16
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
        .o_data_out_valid(o_data_out_valid[16]),
        .o_data_out(o_data_out[16*DATA_WIDTH+:DATA_WIDTH])
    );
    neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(17),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_1_17.mif"), .BIAS_FILE("b_1_17.mif")) neuron_inst_17
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
        .o_data_out_valid(o_data_out_valid[17]),
        .o_data_out(o_data_out[17*DATA_WIDTH+:DATA_WIDTH])
    );
     neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(18),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_1_18.mif"), .BIAS_FILE("b_1_18.mif")) neuron_inst_18
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
        .o_data_out_valid(o_data_out_valid[18]),
        .o_data_out(o_data_out[18*DATA_WIDTH+:DATA_WIDTH])
    );
     neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(19),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_1_19.mif"), .BIAS_FILE("b_1_19.mif")) neuron_inst_19
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
        .o_data_out_valid(o_data_out_valid[19]),
        .o_data_out(o_data_out[19*DATA_WIDTH+:DATA_WIDTH])
    );
    neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(20),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_1_20.mif"), .BIAS_FILE("b_1_20.mif")) neuron_inst_20
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
        .o_data_out_valid(o_data_out_valid[20]),
        .o_data_out(o_data_out[20*DATA_WIDTH+:DATA_WIDTH])
    );
    neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(21),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_1_21.mif"), .BIAS_FILE("b_1_21.mif")) neuron_inst_21
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
        .o_data_out_valid(o_data_out_valid[21]),
        .o_data_out(o_data_out[21*DATA_WIDTH+:DATA_WIDTH])
    );
     neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(22),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_1_22.mif"), .BIAS_FILE("b_1_22.mif")) neuron_inst_22
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
        .o_data_out_valid(o_data_out_valid[22]),
        .o_data_out(o_data_out[22*DATA_WIDTH+:DATA_WIDTH])
    );
     neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(23),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_1_23.mif"), .BIAS_FILE("b_1_23.mif")) neuron_inst_23
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
        .o_data_out_valid(o_data_out_valid[23]),
        .o_data_out(o_data_out[23*DATA_WIDTH+:DATA_WIDTH])
    );
     neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(24),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_1_24.mif"), .BIAS_FILE("b_1_24.mif")) neuron_inst_24
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
        .o_data_out_valid(o_data_out_valid[24]),
        .o_data_out(o_data_out[24*DATA_WIDTH+:DATA_WIDTH])
    );
    neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(25),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_1_25.mif"), .BIAS_FILE("b_1_25.mif")) neuron_inst_25
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
        .o_data_out_valid(o_data_out_valid[25]),
        .o_data_out(o_data_out[25*DATA_WIDTH+:DATA_WIDTH])
    );
     neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(26),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_1_26.mif"), .BIAS_FILE("b_1_26.mif")) neuron_inst_26
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
        .o_data_out_valid(o_data_out_valid[26]),
        .o_data_out(o_data_out[26*DATA_WIDTH+:DATA_WIDTH])
    );
     neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(27),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_1_27.mif"), .BIAS_FILE("b_1_27.mif")) neuron_inst_27
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
        .o_data_out_valid(o_data_out_valid[27]),
        .o_data_out(o_data_out[27*DATA_WIDTH+:DATA_WIDTH])
    );
     neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(28),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_1_28.mif"), .BIAS_FILE("b_1_28.mif")) neuron_inst_28
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
        .o_data_out_valid(o_data_out_valid[28]),
        .o_data_out(o_data_out[28*DATA_WIDTH+:DATA_WIDTH])
    );
     neuron #(.INPUTS_NUM(INPUTS_NUM),.LAYER_ID(LAYER_ID),.NEURON_ID(29),.DATA_WIDTH(DATA_WIDTH),
    .SIGMOID_SIZE(SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(WEIGHT_INTEGER_WIDTH),.ACT_TYPE(ACT_TYPE),
    .WEIGHT_FILE("w_1_29.mif"), .BIAS_FILE("b_1_29.mif")) neuron_inst_29
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
        .o_data_out_valid(o_data_out_valid[29]),
        .o_data_out(o_data_out[29*DATA_WIDTH+:DATA_WIDTH])
    );
endmodule
