// -------------------------------------------------
// Copyright(c) LUBIS EDA GmbH, All rights reserved
// Contact: contact@lubis-eda.com
// -------------------------------------------------// -------------------------------------------------
// Copyright(c) LUBIS EDA GmbH, All rights reserved
// Contact: contact@lubis-eda.com
// -------------------------------------------------


module fv_hdmi_test_blk
#(
    parameter VIDEO_ID_CODE             = 1,
    parameter IT_CONTENT                = 1'b1,
    parameter BIT_WIDTH                 = VIDEO_ID_CODE < 4 ? 10 : VIDEO_ID_CODE == 4 ? 11 : 12,
    parameter BIT_HEIGHT                = VIDEO_ID_CODE == 16 ? 11: 10,
    parameter DVI_OUTPUT                = 1'b0,
    parameter VIDEO_REFRESH_RATE        = 59.94,
    parameter AUDIO_RATE                = 44100,
    parameter AUDIO_BIT_WIDTH           = 16,
    parameter VENDOR_NAME               = {"Unknown", 8'd0},
    parameter PRODUCT_DESCRIPTION       = {"FPGA", 96'd0},
    parameter SOURCE_DEVICE_INFORMATION = 8'h00,
    parameter START_X                   = 0,
    parameter START_Y                   = 0,
    //#$localparams
    localparam NUM_CHANNELS = 3,
    localparam VIDEO_RATE   = (VIDEO_ID_CODE == 1 ? 25.2E6 : VIDEO_ID_CODE == 2 || VIDEO_ID_CODE == 3 ? 27.027E6 : VIDEO_ID_CODE == 4 ? 74.25E6 : VIDEO_ID_CODE == 16 ? 148.5E6 : VIDEO_ID_CODE == 17 || VIDEO_ID_CODE == 18 ? 27E6 : VIDEO_ID_CODE == 19 ? 74.25E6 : VIDEO_ID_CODE == 34 ? 74.25E6 : VIDEO_ID_CODE == 95 || VIDEO_ID_CODE == 105 || VIDEO_ID_CODE == 97 || VIDEO_ID_CODE == 107 ? 594E6 : 0) * (VIDEO_REFRESH_RATE == 59.94 || VIDEO_REFRESH_RATE == 29.97 ? 1000.0/1001.0 : 1)
    //$#//
) (
    //#$ports
    input logic                       pi_clk_pixel_x5,
    input logic                       pi_clk_pixel,
    input logic                       pi_clk_audio,
    input logic                       pi_reset,
    input logic [23:0]                pi_rgb,
    input logic [AUDIO_BIT_WIDTH-1:0] pi_audio_sample_word[1:0],
    input logic [2:0]                 po_tmds,
    input logic                       po_tmds_clock,
    input logic [BIT_WIDTH-1:0]       po_cx,
    input logic [BIT_HEIGHT-1:0]      po_cy,
    input logic [BIT_WIDTH-1:0]       po_frame_width,
    input logic [BIT_HEIGHT-1:0]      po_frame_height,
    input logic [BIT_WIDTH-1:0]       po_screen_width,
    input logic [BIT_HEIGHT-1:0]      po_screen_height
    //$#//
);

endmodule


bind hdmi fv_hdmi_test_blk #(
    //#$bind
    .VIDEO_ID_CODE (VIDEO_ID_CODE),
    .IT_CONTENT (IT_CONTENT),
    .BIT_WIDTH (BIT_WIDTH),
    .BIT_HEIGHT (BIT_HEIGHT),
    .DVI_OUTPUT (DVI_OUTPUT),
    .VIDEO_REFRESH_RATE (VIDEO_REFRESH_RATE),
    .AUDIO_RATE (AUDIO_RATE),
    .AUDIO_BIT_WIDTH (AUDIO_BIT_WIDTH),
    .VENDOR_NAME (VENDOR_NAME),
    .PRODUCT_DESCRIPTION (PRODUCT_DESCRIPTION),
    .SOURCE_DEVICE_INFORMATION (SOURCE_DEVICE_INFORMATION),
    .START_X (START_X),
    .START_Y (START_Y)
) fv_hdmi_test_blk_i (
    .pi_clk_pixel_x5 (clk_pixel_x5),
    .pi_clk_pixel (clk_pixel),
    .pi_clk_audio (clk_audio),
    .pi_reset (reset),
    .pi_rgb (rgb),
    .pi_audio_sample_word (audio_sample_word),
    .po_tmds (tmds),
    .po_tmds_clock (tmds_clock),
    .po_cx (cx),
    .po_cy (cy),
    .po_frame_width (frame_width),
    .po_frame_height (frame_height),
    .po_screen_width (screen_width),
    .po_screen_height (screen_height)
    //$#//
);