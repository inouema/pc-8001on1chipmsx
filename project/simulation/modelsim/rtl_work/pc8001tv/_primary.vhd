library verilog;
use verilog.vl_types.all;
entity pc8001tv is
    generic(
        step            : integer := 1000
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of step : constant is 1;
end pc8001tv;
