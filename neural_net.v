`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: neural_net
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
`include "defs.v"
module neural_net #(parameter C_S_AXI_DATA_WIDTH=32,C_S_AXI_ADDR_WIDTH=5)(
    input clk,
    input reset_n,
    //axis stream interface
    input [`DATA_WIDTH-1:0] axis_data_in,
    input axis_data_in_valid,
    output axis_data_in_ready,
    //AXI lite interface
	input [C_S_AXI_ADDR_WIDTH-1 : 0] s_axi_awaddr,
	// Write channel Protection type. This signal indicates the
    // privilege and security level of the transaction, and whether
    // the transaction is a data access or an instruction access.
	input wire [2 : 0] s_axi_awprot,
	// Write address valid. This signal indicates that the master signaling
   	// valid write address and control information.
	input wire  s_axi_awvalid,
	// Write address ready. This signal indicates that the slave is ready
   	// to accept an address and associated control signals.
	output wire  s_axi_awready,
	// Write data (issued by master, acceped by Slave) 
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] s_axi_wdata,
	// Write strobes. This signal indicates which byte lanes hold
    // valid data. There is one write strobe bit for each eight
   	// bits of the write data bus.    
	input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] s_axi_wstrb,
	// Write valid. This signal indicates that valid write
    // data and strobes are available.
	input wire  s_axi_wvalid,
	// Write ready. This signal indicates that the slave
    // can accept the write data.
	output wire  s_axi_wready,
	// Write response. This signal indicates the status
    // of the write transaction.
	output wire [1 : 0] s_axi_bresp,
	// Write response valid. This signal indicates that the channel
   	// is signaling a valid write response.
	output wire  s_axi_bvalid,
	// Response ready. This signal indicates that the master
   	// can accept a write response.
	input wire  s_axi_bready,
	// Read address (issued by master, acceped by Slave)
	input wire [C_S_AXI_ADDR_WIDTH-1 : 0] s_axi_araddr,
	// Protection type. This signal indicates the privilege
   	// and security level of the transaction, and whether the
   	// transaction is a data access or an instruction access.
	input wire [2 : 0] s_axi_arprot,
	// Read address valid. This signal indicates that the channel
   	// is signaling valid read address and control information.
	input wire  s_axi_arvalid,
	// Read address ready. This signal indicates that the slave is
    // ready to accept an address and associated control signals.
	output wire  s_axi_arready,
	// Read data (issued by slave)
	output wire [C_S_AXI_DATA_WIDTH-1 : 0] s_axi_rdata,
    // Read response. This signal indicates the status of the
    // read transfer.
	output wire [1 : 0] s_axi_rresp,
	// Read valid. This signal indicates that the channel is
    // signaling the required read data.
	output wire  s_axi_rvalid,
	// Read ready. This signal indicates that the master can
    // accept the read data and response information.
	input wire  s_axi_rready,
	// Interrupt interface
	output wire intr
);
    localparam IDLE='d0,
    SEND='d1;
    
    wire [31:0]  config_layer_id;
    wire [31:0]  config_neuron_id;
    wire [31:0] weight_value;
    wire [31:0] bias_value;
    wire weight_valid;
    wire bias_valid;
    wire axi_rd_en;
    wire [31:0] axi_rd_data;
    wire soft_reset;

    wire [`NEURONS_NUM_L1-1:0] data_outs_valid_1;
    wire [`NEURONS_NUM_L1*`DATA_WIDTH-1:0] data_outs_1;
    reg [`NEURONS_NUM_L1*`DATA_WIDTH-1:0] hold_reg_1;
    reg [`DATA_WIDTH-1:0] data_out_1;
    reg data_out_valid_1;
    reg state_1;
    integer count_1;
    wire [`NEURONS_NUM_L2-1:0] data_outs_valid_2;
    wire [`NEURONS_NUM_L2*`DATA_WIDTH-1:0] data_outs_2;
    reg [`NEURONS_NUM_L2*`DATA_WIDTH-1:0] hold_reg_2;
    reg [`DATA_WIDTH-1:0] data_out_2;
    reg data_out_valid_2;
    reg state_2;
    integer count_2;
    wire [`NEURONS_NUM_L3-1:0] data_outs_valid_3;
    wire [`NEURONS_NUM_L3*`DATA_WIDTH-1:0] data_outs_3;
    reg [`NEURONS_NUM_L3*`DATA_WIDTH-1:0] hold_reg_3;
    reg [`DATA_WIDTH-1:0] data_out_3;
    reg data_out_valid_3; 
    reg state_3;
    integer count_3;
    wire [`NEURONS_NUM_L4-1:0] data_outs_valid_4;
    wire [`NEURONS_NUM_L4*`DATA_WIDTH-1:0] data_outs_4;
    reg [`NEURONS_NUM_L4*`DATA_WIDTH-1:0] hold_reg_4;
    reg [`DATA_WIDTH-1:0] data_out_4;
    reg data_out_valid_4;
    reg state_4;
    integer count_4;

    reg [`NEURONS_NUM_L4*`DATA_WIDTH-1:0] hold_reg_5;

    wire [31:0] max_finder_data_out;
    wire max_finder_data_out_valid;

///
    assign axis_data_in_ready=1;
    assign intr = max_finder_data_out_valid;
    assign runtime_reset_n = reset_n && !soft_reset;
    assign axi_rd_data = hold_reg_5[`DATA_WIDTH-1:0];
///
axi_lite_wrapper # ( 
    .C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
    .C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH)) axi_lite_wrapper_inst 
(
    .S_AXI_ACLK(clk),
    .S_AXI_ARESETN(reset_n),
    .S_AXI_AWADDR(s_axi_awaddr),
    .S_AXI_AWPROT(s_axi_awprot),
    .S_AXI_AWVALID(s_axi_awvalid),
    .S_AXI_AWREADY(s_axi_awready),
    .S_AXI_WDATA(s_axi_wdata),
    .S_AXI_WSTRB(s_axi_wstrb),
    .S_AXI_WVALID(s_axi_wvalid),
    .S_AXI_WREADY(s_axi_wready),
    .S_AXI_BRESP(s_axi_bresp),
    .S_AXI_BVALID(s_axi_bvalid),
    .S_AXI_BREADY(s_axi_bready),
    .S_AXI_ARADDR(s_axi_araddr),
    .S_AXI_ARPROT(s_axi_arprot),
    .S_AXI_ARVALID(s_axi_arvalid),
    .S_AXI_ARREADY(s_axi_arready),
    .S_AXI_RDATA(s_axi_rdata),
    .S_AXI_RRESP(s_axi_rresp),
    .S_AXI_RVALID(s_axi_rvalid),
    .S_AXI_RREADY(s_axi_rready),
    .layer_id(config_layer_id),
    .neuron_id(config_neuron_id),
    .weight_value(weight_value),
    .weight_valid(weight_valid),
    .bias_valid(bias_valid),
    .bias_value(bias_value),
    .nn_data_valid(max_finder_data_out_valid),
    .nn_data(max_finder_data_out),
    .axi_rd_en(axi_rd_en),
    .axi_rd_data(axi_rd_data),
    .soft_reset(soft_reset)
);

///   
layer_1 #( .NEURONS_NUM(`NEURONS_NUM_L1), .INPUTS_NUM(`INPUTS_NUM_L1),
        .DATA_WIDTH(`DATA_WIDTH),.LAYER_ID(1),
        .SIGMOID_SIZE(`SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(`WEIGHT_INTEGER_WIDTH),
        .ACT_TYPE(`ACT_TYPE_L1)) layer_1_inst(
    .clk(clk),
    .reset_n(runtime_reset_n),
    .i_weight_valid(weight_valid),
    .i_bias_valid(bias_valid),
    .i_bias_value(bias_value),
    .i_weight_value(weight_value),
    .i_layer_id(config_layer_id),
    .i_neuron_id(config_neuron_id),    

    .i_data_in_valid(axis_data_in_valid),
    .i_data_in(axis_data_in),
    .o_data_out_valid(data_outs_valid_1),
    .o_data_out(data_outs_1)
    );    

    always @(posedge clk)
    begin
        if(!runtime_reset_n)
        begin
            data_out_valid_1<=0;
            state_1<=IDLE;
            count_1<=0;
        end
        else
        begin
            case(state_1)
                IDLE:
                begin
                    count_1<=0;
                    data_out_valid_1<=0;
                    if(data_outs_valid_1[0])
                    begin
                        hold_reg_1<=data_outs_1;
                        state_1<=SEND;
                    end
                end
                SEND:
                begin
                    data_out_1<=hold_reg_1[`DATA_WIDTH-1:0];
                    hold_reg_1 <= hold_reg_1>>`DATA_WIDTH;
                    count_1<=count_1+1;
                    data_out_valid_1<=1;
                    if(count_1==`NEURONS_NUM_L1)
                    begin
                        state_1<=IDLE;
                        data_out_valid_1<=0;
                    end
                end
            endcase
        end
    end

    layer_2 #( .NEURONS_NUM(`NEURONS_NUM_L2), .INPUTS_NUM(`INPUTS_NUM_L2),
        .DATA_WIDTH(`DATA_WIDTH),.LAYER_ID(2),
        .SIGMOID_SIZE(`SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(`WEIGHT_INTEGER_WIDTH),
        .ACT_TYPE(`ACT_TYPE_L2)) layer_2_inst(
    .clk(clk),
    .reset_n(runtime_reset_n),

    .i_weight_valid(weight_valid),
    .i_bias_valid(bias_valid),
    .i_bias_value(bias_value),
    .i_weight_value(weight_value),
    .i_layer_id(config_layer_id),
    .i_neuron_id(config_neuron_id),    

    .i_data_in_valid(data_out_valid_1),
    .i_data_in(data_out_1),
    .o_data_out_valid(data_outs_valid_2),
    .o_data_out(data_outs_2)
    );    

    always @(posedge clk)
    begin
        if(!runtime_reset_n)
        begin
            data_out_valid_2<=0;
            state_2<=IDLE;
            count_2<=0;
        end
        else
        begin
            case(state_2)
                IDLE:
                begin
                    count_2<=0;
                    data_out_valid_2<=0;
                    if(data_outs_valid_2[0])
                    begin
                        hold_reg_2<=data_outs_2;
                        state_2<=SEND;
                    end
                end
                SEND:
                begin
                    data_out_2<=hold_reg_2[`DATA_WIDTH-1:0];
                    hold_reg_2 <= hold_reg_2>>`DATA_WIDTH;
                    count_2<=count_2+1;
                    data_out_valid_2<=1;
                    if(count_2==`NEURONS_NUM_L2)
                    begin
                        state_2<=IDLE;
                        data_out_valid_2<=0;
                    end
                end
            endcase
        end
    end
    
    layer_3 #( .NEURONS_NUM(`NEURONS_NUM_L3), .INPUTS_NUM(`INPUTS_NUM_L3),
        .DATA_WIDTH(`DATA_WIDTH),.LAYER_ID(3),
        .SIGMOID_SIZE(`SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(`WEIGHT_INTEGER_WIDTH),
        .ACT_TYPE(`ACT_TYPE_L3)) layer_3_inst(
    .clk(clk),
    .reset_n(runtime_reset_n),

    .i_weight_valid(weight_valid),
    .i_bias_valid(bias_valid),
    .i_bias_value(bias_value),
    .i_weight_value(weight_value),
    .i_layer_id(config_layer_id),
    .i_neuron_id(config_neuron_id),    

    .i_data_in_valid(data_out_valid_2),
    .i_data_in(data_out_2),
    .o_data_out_valid(data_outs_valid_3),
    .o_data_out(data_outs_3)
    );    
    
    always @(posedge clk)
    begin
        if(!runtime_reset_n)
        begin
            data_out_valid_3<=0;
            state_3<=IDLE;
            count_3<=0;
        end
        else
        begin
            case(state_3)
                IDLE:
                begin
                    count_3<=0;
                    data_out_valid_3<=0;
                    if(data_outs_valid_3[0])
                    begin
                        hold_reg_3<=data_outs_3;
                        state_3<=SEND;
                    end
                end
                SEND:
                begin
                    data_out_3<=hold_reg_3[`DATA_WIDTH-1:0];
                    hold_reg_3 <= hold_reg_3>>`DATA_WIDTH;
                    count_3<=count_3+1;
                    data_out_valid_3<=1;
                    if(count_3==`NEURONS_NUM_L3)
                    begin
                        state_3<=IDLE;
                        data_out_valid_3<=0;
                    end
                end
            endcase
        end
    end
   
    layer_4 #( .NEURONS_NUM(`NEURONS_NUM_L4), .INPUTS_NUM(`INPUTS_NUM_L4),
        .DATA_WIDTH(`DATA_WIDTH),.LAYER_ID(4),
        .SIGMOID_SIZE(`SIGMOID_SIZE),.WEIGHT_INTEGER_WIDTH(`WEIGHT_INTEGER_WIDTH),
        .ACT_TYPE(`ACT_TYPE_L4)) layer_4_inst(
    .clk(clk),
    .reset_n(runtime_reset_n),

    .i_weight_valid(weight_valid),
    .i_bias_valid(bias_valid),
    .i_bias_value(bias_value),
    .i_weight_value(weight_value),
    .i_layer_id(config_layer_id),
    .i_neuron_id(config_neuron_id),    

    .i_data_in_valid(data_out_valid_3),
    .i_data_in(data_out_3),
    .o_data_out_valid(data_outs_valid_4),
    .o_data_out(data_outs_4)
    );    

    always @(posedge clk)
    begin
        if(!runtime_reset_n)
        begin
            data_out_valid_4<=0;
            state_4<=IDLE;
            count_4<=0;
        end
        else
        begin
            case(state_4)
                IDLE:
                begin
                    count_4<=0;
                    data_out_valid_4<=0;
                    if(data_outs_valid_4[0])
                    begin
                        hold_reg_4<=data_outs_4;
                        state_4<=SEND;
                    end
                end
                SEND:
                begin
                    data_out_4<=hold_reg_4[`DATA_WIDTH-1:0];
                    hold_reg_4 <= hold_reg_4>>`DATA_WIDTH;
                    count_4<=count_4+1;
                    data_out_valid_4<=1;
                    if(count_4==`NEURONS_NUM_L4)
                    begin
                        state_4<=IDLE;
                        data_out_valid_4<=0;
                    end
                end
            endcase
        end
    end
    
    always @(posedge clk)
    begin
        if(data_outs_valid_4[0])
            hold_reg_5<=data_outs_4;
        else if(axi_rd_en)
            hold_reg_5 <= hold_reg_5 >> `DATA_WIDTH;
    end
    
    max_finder #(.INPUTS_NUM(`NEURONS_NUM_L4), .INPUT_WIDTH(`DATA_WIDTH)) max_finder_inst
    (
        .clk(clk),
        .reset_n(runtime_reset_n),
        .i_data_in(data_outs_4),
        .i_data_in_valid(data_outs_valid_4),
        .o_data_out(max_finder_data_out),
        .o_data_out_valid(max_finder_data_out_valid)
    );
endmodule
