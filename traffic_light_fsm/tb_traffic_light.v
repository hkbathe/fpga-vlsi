`timescale 1ns / 1ps

module traffic_light (
    input  wire clk,
    input  wire reset,
    output reg [1:0] ns_light, // North-South: 00=Green, 01=Yellow, 10=Red
    output reg [1:0] ew_light  // East-West:   00=Green, 01=Yellow, 10=Red
);

    // States: 4 simple steps
    parameter S0_NS_GREEN  = 2'b00;
    parameter S1_NS_YELLOW = 2'b01;
    parameter S2_EW_GREEN  = 2'b10;
    parameter S3_EW_YELLOW = 2'b11;

    reg [1:0] state;

    // State transitions on each clock tick
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S0_NS_GREEN;
        end else begin
            case (state)
                S0_NS_GREEN:  state <= S1_NS_YELLOW;
                S1_NS_YELLOW: state <= S2_EW_GREEN;
                S2_EW_GREEN:  state <= S3_EW_YELLOW;
                S3_EW_YELLOW: state <= S0_NS_GREEN;
            endcase
        end
    end

    // Light outputs based on state
    always @(*) begin
        case (state)
            S0_NS_GREEN: begin
                ns_light = 2'b00; // NS Green
                ew_light = 2'b10; // EW Red
            end
            S1_NS_YELLOW: begin
                ns_light = 2'b01; // NS Yellow
                ew_light = 2'b10; // EW Red
            end
            S2_EW_GREEN: begin
                ns_light = 2'b10; // NS Red
                ew_light = 2'b00; // EW Green
            end
            S3_EW_YELLOW: begin
                ns_light = 2'b10; // NS Red
                ew_light = 2'b01; // EW Yellow
            end
            default: begin
                ns_light = 2'b10; // Both Red
                ew_light = 2'b10;
            end
        endcase
    end

endmodule
