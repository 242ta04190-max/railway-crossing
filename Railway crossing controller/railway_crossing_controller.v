module railway_crossing_controller (
    input  wire clk,
    input  wire reset,
    input  wire train_detect,
    input  wire train_clear,

    output reg gate_open,
    output reg gate_close,
    output reg warning
);

reg [1:0] state;

parameter OPEN   = 2'b00;
parameter CLOSING = 2'b01;
parameter CLOSED = 2'b10;

always @(posedge clk) begin

    if (reset) begin
        state      <= OPEN;
        gate_open  <= 1'b1;
        gate_close <= 1'b0;
        warning    <= 1'b0;
    end

    else begin

        case (state)

            OPEN: begin
                gate_open  <= 1'b1;
                gate_close <= 1'b0;
                warning    <= 1'b0;

                if (train_detect)
                    state <= CLOSING;
            end

            CLOSING: begin
                gate_open  <= 1'b0;
                gate_close <= 1'b1;
                warning    <= 1'b1;

                state <= CLOSED;
            end

            CLOSED: begin
                gate_open  <= 1'b0;
                gate_close <= 1'b1;
                warning    <= 1'b1;

                if (train_clear)
                    state <= OPEN;
            end

            default: begin
                state <= OPEN;
            end

        endcase
    end
end

endmodule