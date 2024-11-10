library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use STD.textio.all;
use work.toplevel_globals.all;

entity toplevel_interconn is

  port (
    socket_lsu_i1_data : out std_logic_vector(3 downto 0);
    socket_lsu_i1_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_lsu_o1_data0 : in std_logic_vector(31 downto 0);
    socket_lsu_o1_bus_cntrl : in std_logic_vector(12 downto 0);
    socket_lsu_i2_data : out std_logic_vector(31 downto 0);
    socket_lsu_i2_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_RF_i1_data : out std_logic_vector(31 downto 0);
    socket_RF_i1_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_RF_o1_data0 : in std_logic_vector(31 downto 0);
    socket_RF_o1_bus_cntrl : in std_logic_vector(12 downto 0);
    socket_bool_i1_data : out std_logic_vector(0 downto 0);
    socket_bool_i1_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_bool_o1_data0 : in std_logic_vector(0 downto 0);
    socket_bool_o1_bus_cntrl : in std_logic_vector(12 downto 0);
    socket_gcu_i1_data : out std_logic_vector(IMEMADDRWIDTH-1 downto 0);
    socket_gcu_i1_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_gcu_i2_data : out std_logic_vector(IMEMADDRWIDTH-1 downto 0);
    socket_gcu_i2_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_gcu_o1_data0 : in std_logic_vector(IMEMADDRWIDTH-1 downto 0);
    socket_gcu_o1_bus_cntrl : in std_logic_vector(12 downto 0);
    socket_ALU_i1_data : out std_logic_vector(31 downto 0);
    socket_ALU_i1_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_ALU_i2_data : out std_logic_vector(31 downto 0);
    socket_ALU_i2_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_ALU_o1_data0 : in std_logic_vector(31 downto 0);
    socket_ALU_o1_bus_cntrl : in std_logic_vector(12 downto 0);
    socket_ADDSH_i1_data : out std_logic_vector(31 downto 0);
    socket_ADDSH_i1_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_ADDSH_i2_data : out std_logic_vector(31 downto 0);
    socket_ADDSH_i2_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_ADDSH_o1_data0 : in std_logic_vector(31 downto 0);
    socket_ADDSH_o1_bus_cntrl : in std_logic_vector(12 downto 0);
    socket_MUL_i1_data : out std_logic_vector(31 downto 0);
    socket_MUL_i1_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_MUL_i2_data : out std_logic_vector(31 downto 0);
    socket_MUL_i2_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_MUL_o1_data0 : in std_logic_vector(31 downto 0);
    socket_MUL_o1_bus_cntrl : in std_logic_vector(12 downto 0);
    socket_RF_1_o1_data0 : in std_logic_vector(31 downto 0);
    socket_RF_1_o1_bus_cntrl : in std_logic_vector(12 downto 0);
    socket_RF_1_i1_data : out std_logic_vector(31 downto 0);
    socket_RF_1_i1_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_RF_2_o1_data0 : in std_logic_vector(31 downto 0);
    socket_RF_2_o1_bus_cntrl : in std_logic_vector(12 downto 0);
    socket_RF_2_i1_data : out std_logic_vector(31 downto 0);
    socket_RF_2_i1_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_ADDSH_1_i1_data : out std_logic_vector(31 downto 0);
    socket_ADDSH_1_i1_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_ADDSH_1_i2_data : out std_logic_vector(31 downto 0);
    socket_ADDSH_1_i2_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_ADDSH_1_o1_data0 : in std_logic_vector(31 downto 0);
    socket_ADDSH_1_o1_bus_cntrl : in std_logic_vector(12 downto 0);
    socket_MUL_1_i1_data : out std_logic_vector(31 downto 0);
    socket_MUL_1_i1_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_MUL_1_i2_data : out std_logic_vector(31 downto 0);
    socket_MUL_1_i2_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_MUL_1_o1_data0 : in std_logic_vector(31 downto 0);
    socket_MUL_1_o1_bus_cntrl : in std_logic_vector(12 downto 0);
    socket_RF_1_1_o1_data0 : in std_logic_vector(31 downto 0);
    socket_RF_1_1_o1_bus_cntrl : in std_logic_vector(12 downto 0);
    socket_RF_1_1_i1_data : out std_logic_vector(31 downto 0);
    socket_RF_1_1_i1_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_ADDSH_2_i1_data : out std_logic_vector(31 downto 0);
    socket_ADDSH_2_i1_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_ADDSH_2_i2_data : out std_logic_vector(31 downto 0);
    socket_ADDSH_2_i2_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_ADDSH_2_o1_data0 : in std_logic_vector(31 downto 0);
    socket_ADDSH_2_o1_bus_cntrl : in std_logic_vector(12 downto 0);
    socket_ADDSH_1_1_i1_data : out std_logic_vector(31 downto 0);
    socket_ADDSH_1_1_i1_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_ADDSH_1_1_i2_data : out std_logic_vector(31 downto 0);
    socket_ADDSH_1_1_i2_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_ADDSH_1_1_o1_data0 : in std_logic_vector(31 downto 0);
    socket_ADDSH_1_1_o1_bus_cntrl : in std_logic_vector(12 downto 0);
    socket_shl_shr_i1_data : out std_logic_vector(4 downto 0);
    socket_shl_shr_i1_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_shl_shr_i2_data : out std_logic_vector(31 downto 0);
    socket_shl_shr_i2_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_shl_shr_o1_data0 : in std_logic_vector(31 downto 0);
    socket_shl_shr_o1_bus_cntrl : in std_logic_vector(12 downto 0);
    socket_RF_1_2_o1_data0 : in std_logic_vector(31 downto 0);
    socket_RF_1_2_o1_bus_cntrl : in std_logic_vector(12 downto 0);
    socket_RF_1_2_i1_data : out std_logic_vector(31 downto 0);
    socket_RF_1_2_i1_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_ADDSH_1_1_1_i1_data : out std_logic_vector(31 downto 0);
    socket_ADDSH_1_1_1_i1_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_ADDSH_1_1_1_i2_data : out std_logic_vector(31 downto 0);
    socket_ADDSH_1_1_1_i2_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_ADDSH_1_1_1_o1_data0 : in std_logic_vector(31 downto 0);
    socket_ADDSH_1_1_1_o1_bus_cntrl : in std_logic_vector(12 downto 0);
    socket_fifo_u8_stream_out_fifo_u8_stream_out_status_i1_data : out std_logic_vector(7 downto 0);
    socket_fifo_u8_stream_out_fifo_u8_stream_out_status_i1_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_fifo_u8_stream_out_fifo_u8_stream_out_status_o1_data0 : in std_logic_vector(7 downto 0);
    socket_fifo_u8_stream_out_fifo_u8_stream_out_status_o1_bus_cntrl : in std_logic_vector(12 downto 0);
    socket_fifo_u8_stream_in_fifo_u8_stream_in_status_i1_data : out std_logic_vector(7 downto 0);
    socket_fifo_u8_stream_in_fifo_u8_stream_in_status_i1_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_fifo_u8_stream_in_fifo_u8_stream_in_status_o1_data0 : in std_logic_vector(7 downto 0);
    socket_fifo_u8_stream_in_fifo_u8_stream_in_status_o1_bus_cntrl : in std_logic_vector(12 downto 0);
    socket_fifo_u8_stream_in_fifo_u8_stream_in_status_o2_data0 : in std_logic_vector(7 downto 0);
    socket_fifo_u8_stream_in_fifo_u8_stream_in_status_o2_bus_cntrl : in std_logic_vector(12 downto 0);
    socket_RF_1_2_1_o1_data0 : in std_logic_vector(31 downto 0);
    socket_RF_1_2_1_o1_bus_cntrl : in std_logic_vector(12 downto 0);
    socket_RF_1_2_1_i1_data : out std_logic_vector(31 downto 0);
    socket_RF_1_2_1_i1_bus_cntrl : in std_logic_vector(3 downto 0);
    socket_RF_1_2_2_o1_data0 : in std_logic_vector(31 downto 0);
    socket_RF_1_2_2_o1_bus_cntrl : in std_logic_vector(12 downto 0);
    socket_RF_1_2_2_i1_data : out std_logic_vector(31 downto 0);
    socket_RF_1_2_2_i1_bus_cntrl : in std_logic_vector(3 downto 0);
    simm_B1 : in std_logic_vector(31 downto 0);
    simm_cntrl_B1 : in std_logic_vector(0 downto 0);
    simm_B1_1 : in std_logic_vector(31 downto 0);
    simm_cntrl_B1_1 : in std_logic_vector(0 downto 0);
    simm_B1_2 : in std_logic_vector(31 downto 0);
    simm_cntrl_B1_2 : in std_logic_vector(0 downto 0);
    simm_B1_3 : in std_logic_vector(31 downto 0);
    simm_cntrl_B1_3 : in std_logic_vector(0 downto 0);
    simm_B1_3_1 : in std_logic_vector(31 downto 0);
    simm_cntrl_B1_3_1 : in std_logic_vector(0 downto 0);
    simm_B1_3_2 : in std_logic_vector(31 downto 0);
    simm_cntrl_B1_3_2 : in std_logic_vector(0 downto 0);
    simm_B1_3_3 : in std_logic_vector(31 downto 0);
    simm_cntrl_B1_3_3 : in std_logic_vector(0 downto 0);
    simm_B1_3_4 : in std_logic_vector(31 downto 0);
    simm_cntrl_B1_3_4 : in std_logic_vector(0 downto 0);
    simm_B1_3_4_1 : in std_logic_vector(31 downto 0);
    simm_cntrl_B1_3_4_1 : in std_logic_vector(0 downto 0);
    simm_B1_3_4_1_1 : in std_logic_vector(31 downto 0);
    simm_cntrl_B1_3_4_1_1 : in std_logic_vector(0 downto 0);
    simm_B1_3_4_1_2 : in std_logic_vector(31 downto 0);
    simm_cntrl_B1_3_4_1_2 : in std_logic_vector(0 downto 0);
    simm_B1_3_4_1_3 : in std_logic_vector(31 downto 0);
    simm_cntrl_B1_3_4_1_3 : in std_logic_vector(0 downto 0);
    simm_B1_3_4_1_4 : in std_logic_vector(31 downto 0);
    simm_cntrl_B1_3_4_1_4 : in std_logic_vector(0 downto 0));

end toplevel_interconn;

architecture comb_andor of toplevel_interconn is

  signal databus_B1 : std_logic_vector(31 downto 0);
  signal databus_B1_alt0 : std_logic_vector(31 downto 0);
  signal databus_B1_alt1 : std_logic_vector(31 downto 0);
  signal databus_B1_alt2 : std_logic_vector(31 downto 0);
  signal databus_B1_alt3 : std_logic_vector(31 downto 0);
  signal databus_B1_alt4 : std_logic_vector(31 downto 0);
  signal databus_B1_alt5 : std_logic_vector(31 downto 0);
  signal databus_B1_alt6 : std_logic_vector(31 downto 0);
  signal databus_B1_alt7 : std_logic_vector(31 downto 0);
  signal databus_B1_alt8 : std_logic_vector(31 downto 0);
  signal databus_B1_alt9 : std_logic_vector(31 downto 0);
  signal databus_B1_alt10 : std_logic_vector(31 downto 0);
  signal databus_B1_alt11 : std_logic_vector(31 downto 0);
  signal databus_B1_alt12 : std_logic_vector(31 downto 0);
  signal databus_B1_alt13 : std_logic_vector(31 downto 0);
  signal databus_B1_alt14 : std_logic_vector(31 downto 0);
  signal databus_B1_alt15 : std_logic_vector(31 downto 0);
  signal databus_B1_alt16 : std_logic_vector(31 downto 0);
  signal databus_B1_alt17 : std_logic_vector(31 downto 0);
  signal databus_B1_alt18 : std_logic_vector(31 downto 0);
  signal databus_B1_alt19 : std_logic_vector(31 downto 0);
  signal databus_B1_alt20 : std_logic_vector(31 downto 0);
  signal databus_B1_alt21 : std_logic_vector(31 downto 0);
  signal databus_B1_simm : std_logic_vector(31 downto 0);
  signal databus_B1_1 : std_logic_vector(31 downto 0);
  signal databus_B1_1_alt0 : std_logic_vector(31 downto 0);
  signal databus_B1_1_alt1 : std_logic_vector(31 downto 0);
  signal databus_B1_1_alt2 : std_logic_vector(31 downto 0);
  signal databus_B1_1_alt3 : std_logic_vector(31 downto 0);
  signal databus_B1_1_alt4 : std_logic_vector(31 downto 0);
  signal databus_B1_1_alt5 : std_logic_vector(31 downto 0);
  signal databus_B1_1_alt6 : std_logic_vector(31 downto 0);
  signal databus_B1_1_alt7 : std_logic_vector(31 downto 0);
  signal databus_B1_1_alt8 : std_logic_vector(31 downto 0);
  signal databus_B1_1_alt9 : std_logic_vector(31 downto 0);
  signal databus_B1_1_alt10 : std_logic_vector(31 downto 0);
  signal databus_B1_1_alt11 : std_logic_vector(31 downto 0);
  signal databus_B1_1_alt12 : std_logic_vector(31 downto 0);
  signal databus_B1_1_alt13 : std_logic_vector(31 downto 0);
  signal databus_B1_1_alt14 : std_logic_vector(31 downto 0);
  signal databus_B1_1_alt15 : std_logic_vector(31 downto 0);
  signal databus_B1_1_alt16 : std_logic_vector(31 downto 0);
  signal databus_B1_1_alt17 : std_logic_vector(31 downto 0);
  signal databus_B1_1_alt18 : std_logic_vector(31 downto 0);
  signal databus_B1_1_alt19 : std_logic_vector(31 downto 0);
  signal databus_B1_1_alt20 : std_logic_vector(31 downto 0);
  signal databus_B1_1_alt21 : std_logic_vector(31 downto 0);
  signal databus_B1_1_simm : std_logic_vector(31 downto 0);
  signal databus_B1_2 : std_logic_vector(31 downto 0);
  signal databus_B1_2_alt0 : std_logic_vector(31 downto 0);
  signal databus_B1_2_alt1 : std_logic_vector(31 downto 0);
  signal databus_B1_2_alt2 : std_logic_vector(31 downto 0);
  signal databus_B1_2_alt3 : std_logic_vector(31 downto 0);
  signal databus_B1_2_alt4 : std_logic_vector(31 downto 0);
  signal databus_B1_2_alt5 : std_logic_vector(31 downto 0);
  signal databus_B1_2_alt6 : std_logic_vector(31 downto 0);
  signal databus_B1_2_alt7 : std_logic_vector(31 downto 0);
  signal databus_B1_2_alt8 : std_logic_vector(31 downto 0);
  signal databus_B1_2_alt9 : std_logic_vector(31 downto 0);
  signal databus_B1_2_alt10 : std_logic_vector(31 downto 0);
  signal databus_B1_2_alt11 : std_logic_vector(31 downto 0);
  signal databus_B1_2_alt12 : std_logic_vector(31 downto 0);
  signal databus_B1_2_alt13 : std_logic_vector(31 downto 0);
  signal databus_B1_2_alt14 : std_logic_vector(31 downto 0);
  signal databus_B1_2_alt15 : std_logic_vector(31 downto 0);
  signal databus_B1_2_alt16 : std_logic_vector(31 downto 0);
  signal databus_B1_2_alt17 : std_logic_vector(31 downto 0);
  signal databus_B1_2_alt18 : std_logic_vector(31 downto 0);
  signal databus_B1_2_alt19 : std_logic_vector(31 downto 0);
  signal databus_B1_2_alt20 : std_logic_vector(31 downto 0);
  signal databus_B1_2_alt21 : std_logic_vector(31 downto 0);
  signal databus_B1_2_simm : std_logic_vector(31 downto 0);
  signal databus_B1_3 : std_logic_vector(31 downto 0);
  signal databus_B1_3_alt0 : std_logic_vector(31 downto 0);
  signal databus_B1_3_alt1 : std_logic_vector(31 downto 0);
  signal databus_B1_3_alt2 : std_logic_vector(31 downto 0);
  signal databus_B1_3_alt3 : std_logic_vector(31 downto 0);
  signal databus_B1_3_alt4 : std_logic_vector(31 downto 0);
  signal databus_B1_3_alt5 : std_logic_vector(31 downto 0);
  signal databus_B1_3_alt6 : std_logic_vector(31 downto 0);
  signal databus_B1_3_alt7 : std_logic_vector(31 downto 0);
  signal databus_B1_3_alt8 : std_logic_vector(31 downto 0);
  signal databus_B1_3_alt9 : std_logic_vector(31 downto 0);
  signal databus_B1_3_alt10 : std_logic_vector(31 downto 0);
  signal databus_B1_3_alt11 : std_logic_vector(31 downto 0);
  signal databus_B1_3_alt12 : std_logic_vector(31 downto 0);
  signal databus_B1_3_alt13 : std_logic_vector(31 downto 0);
  signal databus_B1_3_alt14 : std_logic_vector(31 downto 0);
  signal databus_B1_3_alt15 : std_logic_vector(31 downto 0);
  signal databus_B1_3_alt16 : std_logic_vector(31 downto 0);
  signal databus_B1_3_alt17 : std_logic_vector(31 downto 0);
  signal databus_B1_3_alt18 : std_logic_vector(31 downto 0);
  signal databus_B1_3_alt19 : std_logic_vector(31 downto 0);
  signal databus_B1_3_alt20 : std_logic_vector(31 downto 0);
  signal databus_B1_3_alt21 : std_logic_vector(31 downto 0);
  signal databus_B1_3_simm : std_logic_vector(31 downto 0);
  signal databus_B1_3_1 : std_logic_vector(31 downto 0);
  signal databus_B1_3_1_alt0 : std_logic_vector(31 downto 0);
  signal databus_B1_3_1_alt1 : std_logic_vector(31 downto 0);
  signal databus_B1_3_1_alt2 : std_logic_vector(31 downto 0);
  signal databus_B1_3_1_alt3 : std_logic_vector(31 downto 0);
  signal databus_B1_3_1_alt4 : std_logic_vector(31 downto 0);
  signal databus_B1_3_1_alt5 : std_logic_vector(31 downto 0);
  signal databus_B1_3_1_alt6 : std_logic_vector(31 downto 0);
  signal databus_B1_3_1_alt7 : std_logic_vector(31 downto 0);
  signal databus_B1_3_1_alt8 : std_logic_vector(31 downto 0);
  signal databus_B1_3_1_alt9 : std_logic_vector(31 downto 0);
  signal databus_B1_3_1_alt10 : std_logic_vector(31 downto 0);
  signal databus_B1_3_1_alt11 : std_logic_vector(31 downto 0);
  signal databus_B1_3_1_alt12 : std_logic_vector(31 downto 0);
  signal databus_B1_3_1_alt13 : std_logic_vector(31 downto 0);
  signal databus_B1_3_1_alt14 : std_logic_vector(31 downto 0);
  signal databus_B1_3_1_alt15 : std_logic_vector(31 downto 0);
  signal databus_B1_3_1_alt16 : std_logic_vector(31 downto 0);
  signal databus_B1_3_1_alt17 : std_logic_vector(31 downto 0);
  signal databus_B1_3_1_alt18 : std_logic_vector(31 downto 0);
  signal databus_B1_3_1_alt19 : std_logic_vector(31 downto 0);
  signal databus_B1_3_1_alt20 : std_logic_vector(31 downto 0);
  signal databus_B1_3_1_alt21 : std_logic_vector(31 downto 0);
  signal databus_B1_3_1_simm : std_logic_vector(31 downto 0);
  signal databus_B1_3_2 : std_logic_vector(31 downto 0);
  signal databus_B1_3_2_alt0 : std_logic_vector(31 downto 0);
  signal databus_B1_3_2_alt1 : std_logic_vector(31 downto 0);
  signal databus_B1_3_2_alt2 : std_logic_vector(31 downto 0);
  signal databus_B1_3_2_alt3 : std_logic_vector(31 downto 0);
  signal databus_B1_3_2_alt4 : std_logic_vector(31 downto 0);
  signal databus_B1_3_2_alt5 : std_logic_vector(31 downto 0);
  signal databus_B1_3_2_alt6 : std_logic_vector(31 downto 0);
  signal databus_B1_3_2_alt7 : std_logic_vector(31 downto 0);
  signal databus_B1_3_2_alt8 : std_logic_vector(31 downto 0);
  signal databus_B1_3_2_alt9 : std_logic_vector(31 downto 0);
  signal databus_B1_3_2_alt10 : std_logic_vector(31 downto 0);
  signal databus_B1_3_2_alt11 : std_logic_vector(31 downto 0);
  signal databus_B1_3_2_alt12 : std_logic_vector(31 downto 0);
  signal databus_B1_3_2_alt13 : std_logic_vector(31 downto 0);
  signal databus_B1_3_2_alt14 : std_logic_vector(31 downto 0);
  signal databus_B1_3_2_alt15 : std_logic_vector(31 downto 0);
  signal databus_B1_3_2_alt16 : std_logic_vector(31 downto 0);
  signal databus_B1_3_2_alt17 : std_logic_vector(31 downto 0);
  signal databus_B1_3_2_alt18 : std_logic_vector(31 downto 0);
  signal databus_B1_3_2_alt19 : std_logic_vector(31 downto 0);
  signal databus_B1_3_2_alt20 : std_logic_vector(31 downto 0);
  signal databus_B1_3_2_alt21 : std_logic_vector(31 downto 0);
  signal databus_B1_3_2_simm : std_logic_vector(31 downto 0);
  signal databus_B1_3_3 : std_logic_vector(31 downto 0);
  signal databus_B1_3_3_alt0 : std_logic_vector(31 downto 0);
  signal databus_B1_3_3_alt1 : std_logic_vector(31 downto 0);
  signal databus_B1_3_3_alt2 : std_logic_vector(31 downto 0);
  signal databus_B1_3_3_alt3 : std_logic_vector(31 downto 0);
  signal databus_B1_3_3_alt4 : std_logic_vector(31 downto 0);
  signal databus_B1_3_3_alt5 : std_logic_vector(31 downto 0);
  signal databus_B1_3_3_alt6 : std_logic_vector(31 downto 0);
  signal databus_B1_3_3_alt7 : std_logic_vector(31 downto 0);
  signal databus_B1_3_3_alt8 : std_logic_vector(31 downto 0);
  signal databus_B1_3_3_alt9 : std_logic_vector(31 downto 0);
  signal databus_B1_3_3_alt10 : std_logic_vector(31 downto 0);
  signal databus_B1_3_3_alt11 : std_logic_vector(31 downto 0);
  signal databus_B1_3_3_alt12 : std_logic_vector(31 downto 0);
  signal databus_B1_3_3_alt13 : std_logic_vector(31 downto 0);
  signal databus_B1_3_3_alt14 : std_logic_vector(31 downto 0);
  signal databus_B1_3_3_alt15 : std_logic_vector(31 downto 0);
  signal databus_B1_3_3_alt16 : std_logic_vector(31 downto 0);
  signal databus_B1_3_3_alt17 : std_logic_vector(31 downto 0);
  signal databus_B1_3_3_alt18 : std_logic_vector(31 downto 0);
  signal databus_B1_3_3_alt19 : std_logic_vector(31 downto 0);
  signal databus_B1_3_3_alt20 : std_logic_vector(31 downto 0);
  signal databus_B1_3_3_alt21 : std_logic_vector(31 downto 0);
  signal databus_B1_3_3_simm : std_logic_vector(31 downto 0);
  signal databus_B1_3_4 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_alt0 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_alt1 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_alt2 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_alt3 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_alt4 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_alt5 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_alt6 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_alt7 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_alt8 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_alt9 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_alt10 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_alt11 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_alt12 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_alt13 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_alt14 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_alt15 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_alt16 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_alt17 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_alt18 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_alt19 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_alt20 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_alt21 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_simm : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_alt0 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_alt1 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_alt2 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_alt3 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_alt4 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_alt5 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_alt6 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_alt7 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_alt8 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_alt9 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_alt10 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_alt11 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_alt12 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_alt13 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_alt14 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_alt15 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_alt16 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_alt17 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_alt18 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_alt19 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_alt20 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_alt21 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_simm : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_1 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_1_alt0 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_1_alt1 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_1_alt2 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_1_alt3 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_1_alt4 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_1_alt5 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_1_alt6 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_1_alt7 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_1_alt8 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_1_alt9 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_1_alt10 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_1_alt11 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_1_alt12 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_1_alt13 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_1_alt14 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_1_alt15 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_1_alt16 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_1_alt17 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_1_alt18 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_1_alt19 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_1_alt20 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_1_alt21 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_1_simm : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_2 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_2_alt0 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_2_alt1 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_2_alt2 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_2_alt3 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_2_alt4 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_2_alt5 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_2_alt6 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_2_alt7 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_2_alt8 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_2_alt9 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_2_alt10 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_2_alt11 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_2_alt12 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_2_alt13 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_2_alt14 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_2_alt15 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_2_alt16 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_2_alt17 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_2_alt18 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_2_alt19 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_2_alt20 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_2_alt21 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_2_simm : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_3 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_3_alt0 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_3_alt1 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_3_alt2 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_3_alt3 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_3_alt4 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_3_alt5 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_3_alt6 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_3_alt7 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_3_alt8 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_3_alt9 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_3_alt10 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_3_alt11 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_3_alt12 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_3_alt13 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_3_alt14 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_3_alt15 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_3_alt16 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_3_alt17 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_3_alt18 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_3_alt19 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_3_alt20 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_3_alt21 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_3_simm : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_4 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_4_alt0 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_4_alt1 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_4_alt2 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_4_alt3 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_4_alt4 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_4_alt5 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_4_alt6 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_4_alt7 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_4_alt8 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_4_alt9 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_4_alt10 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_4_alt11 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_4_alt12 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_4_alt13 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_4_alt14 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_4_alt15 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_4_alt16 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_4_alt17 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_4_alt18 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_4_alt19 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_4_alt20 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_4_alt21 : std_logic_vector(31 downto 0);
  signal databus_B1_3_4_1_4_simm : std_logic_vector(31 downto 0);

  component toplevel_input_socket_cons_13
    generic (
      BUSW_0 : integer := 32;
      BUSW_1 : integer := 32;
      BUSW_2 : integer := 32;
      BUSW_3 : integer := 32;
      BUSW_4 : integer := 32;
      BUSW_5 : integer := 32;
      BUSW_6 : integer := 32;
      BUSW_7 : integer := 32;
      BUSW_8 : integer := 32;
      BUSW_9 : integer := 32;
      BUSW_10 : integer := 32;
      BUSW_11 : integer := 32;
      BUSW_12 : integer := 32;
      DATAW : integer := 32);
    port (
      databus0 : in std_logic_vector(BUSW_0-1 downto 0);
      databus1 : in std_logic_vector(BUSW_1-1 downto 0);
      databus2 : in std_logic_vector(BUSW_2-1 downto 0);
      databus3 : in std_logic_vector(BUSW_3-1 downto 0);
      databus4 : in std_logic_vector(BUSW_4-1 downto 0);
      databus5 : in std_logic_vector(BUSW_5-1 downto 0);
      databus6 : in std_logic_vector(BUSW_6-1 downto 0);
      databus7 : in std_logic_vector(BUSW_7-1 downto 0);
      databus8 : in std_logic_vector(BUSW_8-1 downto 0);
      databus9 : in std_logic_vector(BUSW_9-1 downto 0);
      databus10 : in std_logic_vector(BUSW_10-1 downto 0);
      databus11 : in std_logic_vector(BUSW_11-1 downto 0);
      databus12 : in std_logic_vector(BUSW_12-1 downto 0);
      data : out std_logic_vector(DATAW-1 downto 0);
      databus_cntrl : in std_logic_vector(3 downto 0));
  end component;

  component toplevel_output_socket_cons_13_1
    generic (
      BUSW_0 : integer := 32;
      BUSW_1 : integer := 32;
      BUSW_2 : integer := 32;
      BUSW_3 : integer := 32;
      BUSW_4 : integer := 32;
      BUSW_5 : integer := 32;
      BUSW_6 : integer := 32;
      BUSW_7 : integer := 32;
      BUSW_8 : integer := 32;
      BUSW_9 : integer := 32;
      BUSW_10 : integer := 32;
      BUSW_11 : integer := 32;
      BUSW_12 : integer := 32;
      DATAW_0 : integer := 32);
    port (
      databus0_alt : out std_logic_vector(BUSW_0-1 downto 0);
      databus1_alt : out std_logic_vector(BUSW_1-1 downto 0);
      databus2_alt : out std_logic_vector(BUSW_2-1 downto 0);
      databus3_alt : out std_logic_vector(BUSW_3-1 downto 0);
      databus4_alt : out std_logic_vector(BUSW_4-1 downto 0);
      databus5_alt : out std_logic_vector(BUSW_5-1 downto 0);
      databus6_alt : out std_logic_vector(BUSW_6-1 downto 0);
      databus7_alt : out std_logic_vector(BUSW_7-1 downto 0);
      databus8_alt : out std_logic_vector(BUSW_8-1 downto 0);
      databus9_alt : out std_logic_vector(BUSW_9-1 downto 0);
      databus10_alt : out std_logic_vector(BUSW_10-1 downto 0);
      databus11_alt : out std_logic_vector(BUSW_11-1 downto 0);
      databus12_alt : out std_logic_vector(BUSW_12-1 downto 0);
      data0 : in std_logic_vector(DATAW_0-1 downto 0);
      databus_cntrl : in std_logic_vector(12 downto 0));
  end component;

  component toplevel_output_socket_cons_1_1
    generic (
      BUSW_0 : integer := 32;
      DATAW_0 : integer := 32);
    port (
      databus0_alt : out std_logic_vector(BUSW_0-1 downto 0);
      data0 : in std_logic_vector(DATAW_0-1 downto 0);
      databus_cntrl : in std_logic_vector(0 downto 0));
  end component;


begin -- comb_andor

  lsu_i1 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 4)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_lsu_i1_data,
      databus_cntrl => socket_lsu_i1_bus_cntrl);

  lsu_o1 : toplevel_output_socket_cons_13_1
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_alt0,
      databus1_alt => databus_B1_1_alt0,
      databus2_alt => databus_B1_2_alt0,
      databus3_alt => databus_B1_3_alt0,
      databus4_alt => databus_B1_3_1_alt0,
      databus5_alt => databus_B1_3_2_alt0,
      databus6_alt => databus_B1_3_3_alt0,
      databus7_alt => databus_B1_3_4_alt0,
      databus8_alt => databus_B1_3_4_1_alt0,
      databus9_alt => databus_B1_3_4_1_1_alt0,
      databus10_alt => databus_B1_3_4_1_2_alt0,
      databus11_alt => databus_B1_3_4_1_3_alt0,
      databus12_alt => databus_B1_3_4_1_4_alt0,
      data0 => socket_lsu_o1_data0,
      databus_cntrl => socket_lsu_o1_bus_cntrl);

  lsu_i2 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_lsu_i2_data,
      databus_cntrl => socket_lsu_i2_bus_cntrl);

  RF_i1 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_RF_i1_data,
      databus_cntrl => socket_RF_i1_bus_cntrl);

  RF_o1 : toplevel_output_socket_cons_13_1
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_alt17,
      databus1_alt => databus_B1_1_alt17,
      databus2_alt => databus_B1_2_alt17,
      databus3_alt => databus_B1_3_alt17,
      databus4_alt => databus_B1_3_1_alt17,
      databus5_alt => databus_B1_3_2_alt17,
      databus6_alt => databus_B1_3_3_alt17,
      databus7_alt => databus_B1_3_4_alt17,
      databus8_alt => databus_B1_3_4_1_alt17,
      databus9_alt => databus_B1_3_4_1_1_alt17,
      databus10_alt => databus_B1_3_4_1_2_alt17,
      databus11_alt => databus_B1_3_4_1_3_alt17,
      databus12_alt => databus_B1_3_4_1_4_alt17,
      data0 => socket_RF_o1_data0,
      databus_cntrl => socket_RF_o1_bus_cntrl);

  bool_i1 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 1)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_bool_i1_data,
      databus_cntrl => socket_bool_i1_bus_cntrl);

  bool_o1 : toplevel_output_socket_cons_13_1
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW_0 => 1)
    port map (
      databus0_alt => databus_B1_alt16,
      databus1_alt => databus_B1_1_alt16,
      databus2_alt => databus_B1_2_alt16,
      databus3_alt => databus_B1_3_alt16,
      databus4_alt => databus_B1_3_1_alt16,
      databus5_alt => databus_B1_3_2_alt16,
      databus6_alt => databus_B1_3_3_alt16,
      databus7_alt => databus_B1_3_4_alt16,
      databus8_alt => databus_B1_3_4_1_alt16,
      databus9_alt => databus_B1_3_4_1_1_alt16,
      databus10_alt => databus_B1_3_4_1_2_alt16,
      databus11_alt => databus_B1_3_4_1_3_alt16,
      databus12_alt => databus_B1_3_4_1_4_alt16,
      data0 => socket_bool_o1_data0,
      databus_cntrl => socket_bool_o1_bus_cntrl);

  gcu_i1 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => IMEMADDRWIDTH)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_gcu_i1_data,
      databus_cntrl => socket_gcu_i1_bus_cntrl);

  gcu_i2 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => IMEMADDRWIDTH)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_gcu_i2_data,
      databus_cntrl => socket_gcu_i2_bus_cntrl);

  gcu_o1 : toplevel_output_socket_cons_13_1
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW_0 => IMEMADDRWIDTH)
    port map (
      databus0_alt => databus_B1_alt6,
      databus1_alt => databus_B1_1_alt6,
      databus2_alt => databus_B1_2_alt6,
      databus3_alt => databus_B1_3_alt6,
      databus4_alt => databus_B1_3_1_alt6,
      databus5_alt => databus_B1_3_2_alt6,
      databus6_alt => databus_B1_3_3_alt6,
      databus7_alt => databus_B1_3_4_alt6,
      databus8_alt => databus_B1_3_4_1_alt6,
      databus9_alt => databus_B1_3_4_1_1_alt6,
      databus10_alt => databus_B1_3_4_1_2_alt6,
      databus11_alt => databus_B1_3_4_1_3_alt6,
      databus12_alt => databus_B1_3_4_1_4_alt6,
      data0 => socket_gcu_o1_data0,
      databus_cntrl => socket_gcu_o1_bus_cntrl);

  ALU_i1 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_ALU_i1_data,
      databus_cntrl => socket_ALU_i1_bus_cntrl);

  ALU_i2 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_ALU_i2_data,
      databus_cntrl => socket_ALU_i2_bus_cntrl);

  ALU_o1 : toplevel_output_socket_cons_13_1
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_alt1,
      databus1_alt => databus_B1_1_alt1,
      databus2_alt => databus_B1_2_alt1,
      databus3_alt => databus_B1_3_alt1,
      databus4_alt => databus_B1_3_1_alt1,
      databus5_alt => databus_B1_3_2_alt1,
      databus6_alt => databus_B1_3_3_alt1,
      databus7_alt => databus_B1_3_4_alt1,
      databus8_alt => databus_B1_3_4_1_alt1,
      databus9_alt => databus_B1_3_4_1_1_alt1,
      databus10_alt => databus_B1_3_4_1_2_alt1,
      databus11_alt => databus_B1_3_4_1_3_alt1,
      databus12_alt => databus_B1_3_4_1_4_alt1,
      data0 => socket_ALU_o1_data0,
      databus_cntrl => socket_ALU_o1_bus_cntrl);

  ADDSH_i1 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_ADDSH_i1_data,
      databus_cntrl => socket_ADDSH_i1_bus_cntrl);

  ADDSH_i2 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_ADDSH_i2_data,
      databus_cntrl => socket_ADDSH_i2_bus_cntrl);

  ADDSH_o1 : toplevel_output_socket_cons_13_1
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_alt21,
      databus1_alt => databus_B1_1_alt21,
      databus2_alt => databus_B1_2_alt21,
      databus3_alt => databus_B1_3_alt21,
      databus4_alt => databus_B1_3_1_alt21,
      databus5_alt => databus_B1_3_2_alt21,
      databus6_alt => databus_B1_3_3_alt21,
      databus7_alt => databus_B1_3_4_alt21,
      databus8_alt => databus_B1_3_4_1_alt21,
      databus9_alt => databus_B1_3_4_1_1_alt21,
      databus10_alt => databus_B1_3_4_1_2_alt21,
      databus11_alt => databus_B1_3_4_1_3_alt21,
      databus12_alt => databus_B1_3_4_1_4_alt21,
      data0 => socket_ADDSH_o1_data0,
      databus_cntrl => socket_ADDSH_o1_bus_cntrl);

  MUL_i1 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_MUL_i1_data,
      databus_cntrl => socket_MUL_i1_bus_cntrl);

  MUL_i2 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_MUL_i2_data,
      databus_cntrl => socket_MUL_i2_bus_cntrl);

  MUL_o1 : toplevel_output_socket_cons_13_1
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_alt20,
      databus1_alt => databus_B1_1_alt20,
      databus2_alt => databus_B1_2_alt20,
      databus3_alt => databus_B1_3_alt20,
      databus4_alt => databus_B1_3_1_alt20,
      databus5_alt => databus_B1_3_2_alt20,
      databus6_alt => databus_B1_3_3_alt20,
      databus7_alt => databus_B1_3_4_alt20,
      databus8_alt => databus_B1_3_4_1_alt20,
      databus9_alt => databus_B1_3_4_1_1_alt20,
      databus10_alt => databus_B1_3_4_1_2_alt20,
      databus11_alt => databus_B1_3_4_1_3_alt20,
      databus12_alt => databus_B1_3_4_1_4_alt20,
      data0 => socket_MUL_o1_data0,
      databus_cntrl => socket_MUL_o1_bus_cntrl);

  RF_1_o1 : toplevel_output_socket_cons_13_1
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_alt19,
      databus1_alt => databus_B1_1_alt19,
      databus2_alt => databus_B1_2_alt19,
      databus3_alt => databus_B1_3_alt19,
      databus4_alt => databus_B1_3_1_alt19,
      databus5_alt => databus_B1_3_2_alt19,
      databus6_alt => databus_B1_3_3_alt19,
      databus7_alt => databus_B1_3_4_alt19,
      databus8_alt => databus_B1_3_4_1_alt19,
      databus9_alt => databus_B1_3_4_1_1_alt19,
      databus10_alt => databus_B1_3_4_1_2_alt19,
      databus11_alt => databus_B1_3_4_1_3_alt19,
      databus12_alt => databus_B1_3_4_1_4_alt19,
      data0 => socket_RF_1_o1_data0,
      databus_cntrl => socket_RF_1_o1_bus_cntrl);

  RF_1_i1 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_RF_1_i1_data,
      databus_cntrl => socket_RF_1_i1_bus_cntrl);

  RF_2_o1 : toplevel_output_socket_cons_13_1
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_alt18,
      databus1_alt => databus_B1_1_alt18,
      databus2_alt => databus_B1_2_alt18,
      databus3_alt => databus_B1_3_alt18,
      databus4_alt => databus_B1_3_1_alt18,
      databus5_alt => databus_B1_3_2_alt18,
      databus6_alt => databus_B1_3_3_alt18,
      databus7_alt => databus_B1_3_4_alt18,
      databus8_alt => databus_B1_3_4_1_alt18,
      databus9_alt => databus_B1_3_4_1_1_alt18,
      databus10_alt => databus_B1_3_4_1_2_alt18,
      databus11_alt => databus_B1_3_4_1_3_alt18,
      databus12_alt => databus_B1_3_4_1_4_alt18,
      data0 => socket_RF_2_o1_data0,
      databus_cntrl => socket_RF_2_o1_bus_cntrl);

  RF_2_i1 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_RF_2_i1_data,
      databus_cntrl => socket_RF_2_i1_bus_cntrl);

  ADDSH_1_i1 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_ADDSH_1_i1_data,
      databus_cntrl => socket_ADDSH_1_i1_bus_cntrl);

  ADDSH_1_i2 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_ADDSH_1_i2_data,
      databus_cntrl => socket_ADDSH_1_i2_bus_cntrl);

  ADDSH_1_o1 : toplevel_output_socket_cons_13_1
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_alt15,
      databus1_alt => databus_B1_1_alt15,
      databus2_alt => databus_B1_2_alt15,
      databus3_alt => databus_B1_3_alt15,
      databus4_alt => databus_B1_3_1_alt15,
      databus5_alt => databus_B1_3_2_alt15,
      databus6_alt => databus_B1_3_3_alt15,
      databus7_alt => databus_B1_3_4_alt15,
      databus8_alt => databus_B1_3_4_1_alt15,
      databus9_alt => databus_B1_3_4_1_1_alt15,
      databus10_alt => databus_B1_3_4_1_2_alt15,
      databus11_alt => databus_B1_3_4_1_3_alt15,
      databus12_alt => databus_B1_3_4_1_4_alt15,
      data0 => socket_ADDSH_1_o1_data0,
      databus_cntrl => socket_ADDSH_1_o1_bus_cntrl);

  MUL_1_i1 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_MUL_1_i1_data,
      databus_cntrl => socket_MUL_1_i1_bus_cntrl);

  MUL_1_i2 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_MUL_1_i2_data,
      databus_cntrl => socket_MUL_1_i2_bus_cntrl);

  MUL_1_o1 : toplevel_output_socket_cons_13_1
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_alt14,
      databus1_alt => databus_B1_1_alt14,
      databus2_alt => databus_B1_2_alt14,
      databus3_alt => databus_B1_3_alt14,
      databus4_alt => databus_B1_3_1_alt14,
      databus5_alt => databus_B1_3_2_alt14,
      databus6_alt => databus_B1_3_3_alt14,
      databus7_alt => databus_B1_3_4_alt14,
      databus8_alt => databus_B1_3_4_1_alt14,
      databus9_alt => databus_B1_3_4_1_1_alt14,
      databus10_alt => databus_B1_3_4_1_2_alt14,
      databus11_alt => databus_B1_3_4_1_3_alt14,
      databus12_alt => databus_B1_3_4_1_4_alt14,
      data0 => socket_MUL_1_o1_data0,
      databus_cntrl => socket_MUL_1_o1_bus_cntrl);

  RF_1_1_o1 : toplevel_output_socket_cons_13_1
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_alt13,
      databus1_alt => databus_B1_1_alt13,
      databus2_alt => databus_B1_2_alt13,
      databus3_alt => databus_B1_3_alt13,
      databus4_alt => databus_B1_3_1_alt13,
      databus5_alt => databus_B1_3_2_alt13,
      databus6_alt => databus_B1_3_3_alt13,
      databus7_alt => databus_B1_3_4_alt13,
      databus8_alt => databus_B1_3_4_1_alt13,
      databus9_alt => databus_B1_3_4_1_1_alt13,
      databus10_alt => databus_B1_3_4_1_2_alt13,
      databus11_alt => databus_B1_3_4_1_3_alt13,
      databus12_alt => databus_B1_3_4_1_4_alt13,
      data0 => socket_RF_1_1_o1_data0,
      databus_cntrl => socket_RF_1_1_o1_bus_cntrl);

  RF_1_1_i1 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_RF_1_1_i1_data,
      databus_cntrl => socket_RF_1_1_i1_bus_cntrl);

  ADDSH_2_i1 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_ADDSH_2_i1_data,
      databus_cntrl => socket_ADDSH_2_i1_bus_cntrl);

  ADDSH_2_i2 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_ADDSH_2_i2_data,
      databus_cntrl => socket_ADDSH_2_i2_bus_cntrl);

  ADDSH_2_o1 : toplevel_output_socket_cons_13_1
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_alt12,
      databus1_alt => databus_B1_1_alt12,
      databus2_alt => databus_B1_2_alt12,
      databus3_alt => databus_B1_3_alt12,
      databus4_alt => databus_B1_3_1_alt12,
      databus5_alt => databus_B1_3_2_alt12,
      databus6_alt => databus_B1_3_3_alt12,
      databus7_alt => databus_B1_3_4_alt12,
      databus8_alt => databus_B1_3_4_1_alt12,
      databus9_alt => databus_B1_3_4_1_1_alt12,
      databus10_alt => databus_B1_3_4_1_2_alt12,
      databus11_alt => databus_B1_3_4_1_3_alt12,
      databus12_alt => databus_B1_3_4_1_4_alt12,
      data0 => socket_ADDSH_2_o1_data0,
      databus_cntrl => socket_ADDSH_2_o1_bus_cntrl);

  ADDSH_1_1_i1 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_ADDSH_1_1_i1_data,
      databus_cntrl => socket_ADDSH_1_1_i1_bus_cntrl);

  ADDSH_1_1_i2 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_ADDSH_1_1_i2_data,
      databus_cntrl => socket_ADDSH_1_1_i2_bus_cntrl);

  ADDSH_1_1_o1 : toplevel_output_socket_cons_13_1
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_alt11,
      databus1_alt => databus_B1_1_alt11,
      databus2_alt => databus_B1_2_alt11,
      databus3_alt => databus_B1_3_alt11,
      databus4_alt => databus_B1_3_1_alt11,
      databus5_alt => databus_B1_3_2_alt11,
      databus6_alt => databus_B1_3_3_alt11,
      databus7_alt => databus_B1_3_4_alt11,
      databus8_alt => databus_B1_3_4_1_alt11,
      databus9_alt => databus_B1_3_4_1_1_alt11,
      databus10_alt => databus_B1_3_4_1_2_alt11,
      databus11_alt => databus_B1_3_4_1_3_alt11,
      databus12_alt => databus_B1_3_4_1_4_alt11,
      data0 => socket_ADDSH_1_1_o1_data0,
      databus_cntrl => socket_ADDSH_1_1_o1_bus_cntrl);

  shl_shr_i1 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 5)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_shl_shr_i1_data,
      databus_cntrl => socket_shl_shr_i1_bus_cntrl);

  shl_shr_i2 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_shl_shr_i2_data,
      databus_cntrl => socket_shl_shr_i2_bus_cntrl);

  shl_shr_o1 : toplevel_output_socket_cons_13_1
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_alt10,
      databus1_alt => databus_B1_1_alt10,
      databus2_alt => databus_B1_2_alt10,
      databus3_alt => databus_B1_3_alt10,
      databus4_alt => databus_B1_3_1_alt10,
      databus5_alt => databus_B1_3_2_alt10,
      databus6_alt => databus_B1_3_3_alt10,
      databus7_alt => databus_B1_3_4_alt10,
      databus8_alt => databus_B1_3_4_1_alt10,
      databus9_alt => databus_B1_3_4_1_1_alt10,
      databus10_alt => databus_B1_3_4_1_2_alt10,
      databus11_alt => databus_B1_3_4_1_3_alt10,
      databus12_alt => databus_B1_3_4_1_4_alt10,
      data0 => socket_shl_shr_o1_data0,
      databus_cntrl => socket_shl_shr_o1_bus_cntrl);

  RF_1_2_o1 : toplevel_output_socket_cons_13_1
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_alt9,
      databus1_alt => databus_B1_1_alt9,
      databus2_alt => databus_B1_2_alt9,
      databus3_alt => databus_B1_3_alt9,
      databus4_alt => databus_B1_3_1_alt9,
      databus5_alt => databus_B1_3_2_alt9,
      databus6_alt => databus_B1_3_3_alt9,
      databus7_alt => databus_B1_3_4_alt9,
      databus8_alt => databus_B1_3_4_1_alt9,
      databus9_alt => databus_B1_3_4_1_1_alt9,
      databus10_alt => databus_B1_3_4_1_2_alt9,
      databus11_alt => databus_B1_3_4_1_3_alt9,
      databus12_alt => databus_B1_3_4_1_4_alt9,
      data0 => socket_RF_1_2_o1_data0,
      databus_cntrl => socket_RF_1_2_o1_bus_cntrl);

  RF_1_2_i1 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_RF_1_2_i1_data,
      databus_cntrl => socket_RF_1_2_i1_bus_cntrl);

  ADDSH_1_1_1_i1 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_ADDSH_1_1_1_i1_data,
      databus_cntrl => socket_ADDSH_1_1_1_i1_bus_cntrl);

  ADDSH_1_1_1_i2 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_ADDSH_1_1_1_i2_data,
      databus_cntrl => socket_ADDSH_1_1_1_i2_bus_cntrl);

  ADDSH_1_1_1_o1 : toplevel_output_socket_cons_13_1
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_alt8,
      databus1_alt => databus_B1_1_alt8,
      databus2_alt => databus_B1_2_alt8,
      databus3_alt => databus_B1_3_alt8,
      databus4_alt => databus_B1_3_1_alt8,
      databus5_alt => databus_B1_3_2_alt8,
      databus6_alt => databus_B1_3_3_alt8,
      databus7_alt => databus_B1_3_4_alt8,
      databus8_alt => databus_B1_3_4_1_alt8,
      databus9_alt => databus_B1_3_4_1_1_alt8,
      databus10_alt => databus_B1_3_4_1_2_alt8,
      databus11_alt => databus_B1_3_4_1_3_alt8,
      databus12_alt => databus_B1_3_4_1_4_alt8,
      data0 => socket_ADDSH_1_1_1_o1_data0,
      databus_cntrl => socket_ADDSH_1_1_1_o1_bus_cntrl);

  fifo_u8_stream_out_fifo_u8_stream_out_status_i1 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 8)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_fifo_u8_stream_out_fifo_u8_stream_out_status_i1_data,
      databus_cntrl => socket_fifo_u8_stream_out_fifo_u8_stream_out_status_i1_bus_cntrl);

  fifo_u8_stream_out_fifo_u8_stream_out_status_o1 : toplevel_output_socket_cons_13_1
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW_0 => 8)
    port map (
      databus0_alt => databus_B1_alt7,
      databus1_alt => databus_B1_1_alt7,
      databus2_alt => databus_B1_2_alt7,
      databus3_alt => databus_B1_3_alt7,
      databus4_alt => databus_B1_3_1_alt7,
      databus5_alt => databus_B1_3_2_alt7,
      databus6_alt => databus_B1_3_3_alt7,
      databus7_alt => databus_B1_3_4_alt7,
      databus8_alt => databus_B1_3_4_1_alt7,
      databus9_alt => databus_B1_3_4_1_1_alt7,
      databus10_alt => databus_B1_3_4_1_2_alt7,
      databus11_alt => databus_B1_3_4_1_3_alt7,
      databus12_alt => databus_B1_3_4_1_4_alt7,
      data0 => socket_fifo_u8_stream_out_fifo_u8_stream_out_status_o1_data0,
      databus_cntrl => socket_fifo_u8_stream_out_fifo_u8_stream_out_status_o1_bus_cntrl);

  fifo_u8_stream_in_fifo_u8_stream_in_status_i1 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 8)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_fifo_u8_stream_in_fifo_u8_stream_in_status_i1_data,
      databus_cntrl => socket_fifo_u8_stream_in_fifo_u8_stream_in_status_i1_bus_cntrl);

  fifo_u8_stream_in_fifo_u8_stream_in_status_o1 : toplevel_output_socket_cons_13_1
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW_0 => 8)
    port map (
      databus0_alt => databus_B1_alt5,
      databus1_alt => databus_B1_1_alt5,
      databus2_alt => databus_B1_2_alt5,
      databus3_alt => databus_B1_3_alt5,
      databus4_alt => databus_B1_3_1_alt5,
      databus5_alt => databus_B1_3_2_alt5,
      databus6_alt => databus_B1_3_3_alt5,
      databus7_alt => databus_B1_3_4_alt5,
      databus8_alt => databus_B1_3_4_1_alt5,
      databus9_alt => databus_B1_3_4_1_1_alt5,
      databus10_alt => databus_B1_3_4_1_2_alt5,
      databus11_alt => databus_B1_3_4_1_3_alt5,
      databus12_alt => databus_B1_3_4_1_4_alt5,
      data0 => socket_fifo_u8_stream_in_fifo_u8_stream_in_status_o1_data0,
      databus_cntrl => socket_fifo_u8_stream_in_fifo_u8_stream_in_status_o1_bus_cntrl);

  fifo_u8_stream_in_fifo_u8_stream_in_status_o2 : toplevel_output_socket_cons_13_1
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW_0 => 8)
    port map (
      databus0_alt => databus_B1_alt4,
      databus1_alt => databus_B1_1_alt4,
      databus2_alt => databus_B1_2_alt4,
      databus3_alt => databus_B1_3_alt4,
      databus4_alt => databus_B1_3_1_alt4,
      databus5_alt => databus_B1_3_2_alt4,
      databus6_alt => databus_B1_3_3_alt4,
      databus7_alt => databus_B1_3_4_alt4,
      databus8_alt => databus_B1_3_4_1_alt4,
      databus9_alt => databus_B1_3_4_1_1_alt4,
      databus10_alt => databus_B1_3_4_1_2_alt4,
      databus11_alt => databus_B1_3_4_1_3_alt4,
      databus12_alt => databus_B1_3_4_1_4_alt4,
      data0 => socket_fifo_u8_stream_in_fifo_u8_stream_in_status_o2_data0,
      databus_cntrl => socket_fifo_u8_stream_in_fifo_u8_stream_in_status_o2_bus_cntrl);

  RF_1_2_1_o1 : toplevel_output_socket_cons_13_1
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_alt3,
      databus1_alt => databus_B1_1_alt3,
      databus2_alt => databus_B1_2_alt3,
      databus3_alt => databus_B1_3_alt3,
      databus4_alt => databus_B1_3_1_alt3,
      databus5_alt => databus_B1_3_2_alt3,
      databus6_alt => databus_B1_3_3_alt3,
      databus7_alt => databus_B1_3_4_alt3,
      databus8_alt => databus_B1_3_4_1_alt3,
      databus9_alt => databus_B1_3_4_1_1_alt3,
      databus10_alt => databus_B1_3_4_1_2_alt3,
      databus11_alt => databus_B1_3_4_1_3_alt3,
      databus12_alt => databus_B1_3_4_1_4_alt3,
      data0 => socket_RF_1_2_1_o1_data0,
      databus_cntrl => socket_RF_1_2_1_o1_bus_cntrl);

  RF_1_2_1_i1 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_RF_1_2_1_i1_data,
      databus_cntrl => socket_RF_1_2_1_i1_bus_cntrl);

  RF_1_2_2_o1 : toplevel_output_socket_cons_13_1
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_alt2,
      databus1_alt => databus_B1_1_alt2,
      databus2_alt => databus_B1_2_alt2,
      databus3_alt => databus_B1_3_alt2,
      databus4_alt => databus_B1_3_1_alt2,
      databus5_alt => databus_B1_3_2_alt2,
      databus6_alt => databus_B1_3_3_alt2,
      databus7_alt => databus_B1_3_4_alt2,
      databus8_alt => databus_B1_3_4_1_alt2,
      databus9_alt => databus_B1_3_4_1_1_alt2,
      databus10_alt => databus_B1_3_4_1_2_alt2,
      databus11_alt => databus_B1_3_4_1_3_alt2,
      databus12_alt => databus_B1_3_4_1_4_alt2,
      data0 => socket_RF_1_2_2_o1_data0,
      databus_cntrl => socket_RF_1_2_2_o1_bus_cntrl);

  RF_1_2_2_i1 : toplevel_input_socket_cons_13
    generic map (
      BUSW_0 => 32,
      BUSW_1 => 32,
      BUSW_2 => 32,
      BUSW_3 => 32,
      BUSW_4 => 32,
      BUSW_5 => 32,
      BUSW_6 => 32,
      BUSW_7 => 32,
      BUSW_8 => 32,
      BUSW_9 => 32,
      BUSW_10 => 32,
      BUSW_11 => 32,
      BUSW_12 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      databus1 => databus_B1_1,
      databus2 => databus_B1_2,
      databus3 => databus_B1_3,
      databus4 => databus_B1_3_1,
      databus5 => databus_B1_3_2,
      databus6 => databus_B1_3_3,
      databus7 => databus_B1_3_4,
      databus8 => databus_B1_3_4_1,
      databus9 => databus_B1_3_4_1_1,
      databus10 => databus_B1_3_4_1_2,
      databus11 => databus_B1_3_4_1_3,
      databus12 => databus_B1_3_4_1_4,
      data => socket_RF_1_2_2_i1_data,
      databus_cntrl => socket_RF_1_2_2_i1_bus_cntrl);

  simm_socket_B1 : toplevel_output_socket_cons_1_1
    generic map (
      BUSW_0 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_simm,
      data0 => simm_B1,
      databus_cntrl => simm_cntrl_B1);

  simm_socket_B1_1 : toplevel_output_socket_cons_1_1
    generic map (
      BUSW_0 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_1_simm,
      data0 => simm_B1_1,
      databus_cntrl => simm_cntrl_B1_1);

  simm_socket_B1_2 : toplevel_output_socket_cons_1_1
    generic map (
      BUSW_0 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_2_simm,
      data0 => simm_B1_2,
      databus_cntrl => simm_cntrl_B1_2);

  simm_socket_B1_3 : toplevel_output_socket_cons_1_1
    generic map (
      BUSW_0 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_3_simm,
      data0 => simm_B1_3,
      databus_cntrl => simm_cntrl_B1_3);

  simm_socket_B1_3_1 : toplevel_output_socket_cons_1_1
    generic map (
      BUSW_0 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_3_1_simm,
      data0 => simm_B1_3_1,
      databus_cntrl => simm_cntrl_B1_3_1);

  simm_socket_B1_3_2 : toplevel_output_socket_cons_1_1
    generic map (
      BUSW_0 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_3_2_simm,
      data0 => simm_B1_3_2,
      databus_cntrl => simm_cntrl_B1_3_2);

  simm_socket_B1_3_3 : toplevel_output_socket_cons_1_1
    generic map (
      BUSW_0 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_3_3_simm,
      data0 => simm_B1_3_3,
      databus_cntrl => simm_cntrl_B1_3_3);

  simm_socket_B1_3_4 : toplevel_output_socket_cons_1_1
    generic map (
      BUSW_0 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_3_4_simm,
      data0 => simm_B1_3_4,
      databus_cntrl => simm_cntrl_B1_3_4);

  simm_socket_B1_3_4_1 : toplevel_output_socket_cons_1_1
    generic map (
      BUSW_0 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_3_4_1_simm,
      data0 => simm_B1_3_4_1,
      databus_cntrl => simm_cntrl_B1_3_4_1);

  simm_socket_B1_3_4_1_1 : toplevel_output_socket_cons_1_1
    generic map (
      BUSW_0 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_3_4_1_1_simm,
      data0 => simm_B1_3_4_1_1,
      databus_cntrl => simm_cntrl_B1_3_4_1_1);

  simm_socket_B1_3_4_1_2 : toplevel_output_socket_cons_1_1
    generic map (
      BUSW_0 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_3_4_1_2_simm,
      data0 => simm_B1_3_4_1_2,
      databus_cntrl => simm_cntrl_B1_3_4_1_2);

  simm_socket_B1_3_4_1_3 : toplevel_output_socket_cons_1_1
    generic map (
      BUSW_0 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_3_4_1_3_simm,
      data0 => simm_B1_3_4_1_3,
      databus_cntrl => simm_cntrl_B1_3_4_1_3);

  simm_socket_B1_3_4_1_4 : toplevel_output_socket_cons_1_1
    generic map (
      BUSW_0 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_3_4_1_4_simm,
      data0 => simm_B1_3_4_1_4,
      databus_cntrl => simm_cntrl_B1_3_4_1_4);

  databus_B1 <= databus_B1_alt0 or databus_B1_alt1 or databus_B1_alt2 or databus_B1_alt3 or databus_B1_alt4 or databus_B1_alt5 or databus_B1_alt6 or databus_B1_alt7 or databus_B1_alt8 or databus_B1_alt9 or databus_B1_alt10 or databus_B1_alt11 or databus_B1_alt12 or databus_B1_alt13 or databus_B1_alt14 or databus_B1_alt15 or databus_B1_alt16 or databus_B1_alt17 or databus_B1_alt18 or databus_B1_alt19 or databus_B1_alt20 or databus_B1_alt21 or databus_B1_simm;
  databus_B1_1 <= databus_B1_1_alt0 or databus_B1_1_alt1 or databus_B1_1_alt2 or databus_B1_1_alt3 or databus_B1_1_alt4 or databus_B1_1_alt5 or databus_B1_1_alt6 or databus_B1_1_alt7 or databus_B1_1_alt8 or databus_B1_1_alt9 or databus_B1_1_alt10 or databus_B1_1_alt11 or databus_B1_1_alt12 or databus_B1_1_alt13 or databus_B1_1_alt14 or databus_B1_1_alt15 or databus_B1_1_alt16 or databus_B1_1_alt17 or databus_B1_1_alt18 or databus_B1_1_alt19 or databus_B1_1_alt20 or databus_B1_1_alt21 or databus_B1_1_simm;
  databus_B1_2 <= databus_B1_2_alt0 or databus_B1_2_alt1 or databus_B1_2_alt2 or databus_B1_2_alt3 or databus_B1_2_alt4 or databus_B1_2_alt5 or databus_B1_2_alt6 or databus_B1_2_alt7 or databus_B1_2_alt8 or databus_B1_2_alt9 or databus_B1_2_alt10 or databus_B1_2_alt11 or databus_B1_2_alt12 or databus_B1_2_alt13 or databus_B1_2_alt14 or databus_B1_2_alt15 or databus_B1_2_alt16 or databus_B1_2_alt17 or databus_B1_2_alt18 or databus_B1_2_alt19 or databus_B1_2_alt20 or databus_B1_2_alt21 or databus_B1_2_simm;
  databus_B1_3 <= databus_B1_3_alt0 or databus_B1_3_alt1 or databus_B1_3_alt2 or databus_B1_3_alt3 or databus_B1_3_alt4 or databus_B1_3_alt5 or databus_B1_3_alt6 or databus_B1_3_alt7 or databus_B1_3_alt8 or databus_B1_3_alt9 or databus_B1_3_alt10 or databus_B1_3_alt11 or databus_B1_3_alt12 or databus_B1_3_alt13 or databus_B1_3_alt14 or databus_B1_3_alt15 or databus_B1_3_alt16 or databus_B1_3_alt17 or databus_B1_3_alt18 or databus_B1_3_alt19 or databus_B1_3_alt20 or databus_B1_3_alt21 or databus_B1_3_simm;
  databus_B1_3_1 <= databus_B1_3_1_alt0 or databus_B1_3_1_alt1 or databus_B1_3_1_alt2 or databus_B1_3_1_alt3 or databus_B1_3_1_alt4 or databus_B1_3_1_alt5 or databus_B1_3_1_alt6 or databus_B1_3_1_alt7 or databus_B1_3_1_alt8 or databus_B1_3_1_alt9 or databus_B1_3_1_alt10 or databus_B1_3_1_alt11 or databus_B1_3_1_alt12 or databus_B1_3_1_alt13 or databus_B1_3_1_alt14 or databus_B1_3_1_alt15 or databus_B1_3_1_alt16 or databus_B1_3_1_alt17 or databus_B1_3_1_alt18 or databus_B1_3_1_alt19 or databus_B1_3_1_alt20 or databus_B1_3_1_alt21 or databus_B1_3_1_simm;
  databus_B1_3_2 <= databus_B1_3_2_alt0 or databus_B1_3_2_alt1 or databus_B1_3_2_alt2 or databus_B1_3_2_alt3 or databus_B1_3_2_alt4 or databus_B1_3_2_alt5 or databus_B1_3_2_alt6 or databus_B1_3_2_alt7 or databus_B1_3_2_alt8 or databus_B1_3_2_alt9 or databus_B1_3_2_alt10 or databus_B1_3_2_alt11 or databus_B1_3_2_alt12 or databus_B1_3_2_alt13 or databus_B1_3_2_alt14 or databus_B1_3_2_alt15 or databus_B1_3_2_alt16 or databus_B1_3_2_alt17 or databus_B1_3_2_alt18 or databus_B1_3_2_alt19 or databus_B1_3_2_alt20 or databus_B1_3_2_alt21 or databus_B1_3_2_simm;
  databus_B1_3_3 <= databus_B1_3_3_alt0 or databus_B1_3_3_alt1 or databus_B1_3_3_alt2 or databus_B1_3_3_alt3 or databus_B1_3_3_alt4 or databus_B1_3_3_alt5 or databus_B1_3_3_alt6 or databus_B1_3_3_alt7 or databus_B1_3_3_alt8 or databus_B1_3_3_alt9 or databus_B1_3_3_alt10 or databus_B1_3_3_alt11 or databus_B1_3_3_alt12 or databus_B1_3_3_alt13 or databus_B1_3_3_alt14 or databus_B1_3_3_alt15 or databus_B1_3_3_alt16 or databus_B1_3_3_alt17 or databus_B1_3_3_alt18 or databus_B1_3_3_alt19 or databus_B1_3_3_alt20 or databus_B1_3_3_alt21 or databus_B1_3_3_simm;
  databus_B1_3_4 <= databus_B1_3_4_alt0 or databus_B1_3_4_alt1 or databus_B1_3_4_alt2 or databus_B1_3_4_alt3 or databus_B1_3_4_alt4 or databus_B1_3_4_alt5 or databus_B1_3_4_alt6 or databus_B1_3_4_alt7 or databus_B1_3_4_alt8 or databus_B1_3_4_alt9 or databus_B1_3_4_alt10 or databus_B1_3_4_alt11 or databus_B1_3_4_alt12 or databus_B1_3_4_alt13 or databus_B1_3_4_alt14 or databus_B1_3_4_alt15 or databus_B1_3_4_alt16 or databus_B1_3_4_alt17 or databus_B1_3_4_alt18 or databus_B1_3_4_alt19 or databus_B1_3_4_alt20 or databus_B1_3_4_alt21 or databus_B1_3_4_simm;
  databus_B1_3_4_1 <= databus_B1_3_4_1_alt0 or databus_B1_3_4_1_alt1 or databus_B1_3_4_1_alt2 or databus_B1_3_4_1_alt3 or databus_B1_3_4_1_alt4 or databus_B1_3_4_1_alt5 or databus_B1_3_4_1_alt6 or databus_B1_3_4_1_alt7 or databus_B1_3_4_1_alt8 or databus_B1_3_4_1_alt9 or databus_B1_3_4_1_alt10 or databus_B1_3_4_1_alt11 or databus_B1_3_4_1_alt12 or databus_B1_3_4_1_alt13 or databus_B1_3_4_1_alt14 or databus_B1_3_4_1_alt15 or databus_B1_3_4_1_alt16 or databus_B1_3_4_1_alt17 or databus_B1_3_4_1_alt18 or databus_B1_3_4_1_alt19 or databus_B1_3_4_1_alt20 or databus_B1_3_4_1_alt21 or databus_B1_3_4_1_simm;
  databus_B1_3_4_1_1 <= databus_B1_3_4_1_1_alt0 or databus_B1_3_4_1_1_alt1 or databus_B1_3_4_1_1_alt2 or databus_B1_3_4_1_1_alt3 or databus_B1_3_4_1_1_alt4 or databus_B1_3_4_1_1_alt5 or databus_B1_3_4_1_1_alt6 or databus_B1_3_4_1_1_alt7 or databus_B1_3_4_1_1_alt8 or databus_B1_3_4_1_1_alt9 or databus_B1_3_4_1_1_alt10 or databus_B1_3_4_1_1_alt11 or databus_B1_3_4_1_1_alt12 or databus_B1_3_4_1_1_alt13 or databus_B1_3_4_1_1_alt14 or databus_B1_3_4_1_1_alt15 or databus_B1_3_4_1_1_alt16 or databus_B1_3_4_1_1_alt17 or databus_B1_3_4_1_1_alt18 or databus_B1_3_4_1_1_alt19 or databus_B1_3_4_1_1_alt20 or databus_B1_3_4_1_1_alt21 or databus_B1_3_4_1_1_simm;
  databus_B1_3_4_1_2 <= databus_B1_3_4_1_2_alt0 or databus_B1_3_4_1_2_alt1 or databus_B1_3_4_1_2_alt2 or databus_B1_3_4_1_2_alt3 or databus_B1_3_4_1_2_alt4 or databus_B1_3_4_1_2_alt5 or databus_B1_3_4_1_2_alt6 or databus_B1_3_4_1_2_alt7 or databus_B1_3_4_1_2_alt8 or databus_B1_3_4_1_2_alt9 or databus_B1_3_4_1_2_alt10 or databus_B1_3_4_1_2_alt11 or databus_B1_3_4_1_2_alt12 or databus_B1_3_4_1_2_alt13 or databus_B1_3_4_1_2_alt14 or databus_B1_3_4_1_2_alt15 or databus_B1_3_4_1_2_alt16 or databus_B1_3_4_1_2_alt17 or databus_B1_3_4_1_2_alt18 or databus_B1_3_4_1_2_alt19 or databus_B1_3_4_1_2_alt20 or databus_B1_3_4_1_2_alt21 or databus_B1_3_4_1_2_simm;
  databus_B1_3_4_1_3 <= databus_B1_3_4_1_3_alt0 or databus_B1_3_4_1_3_alt1 or databus_B1_3_4_1_3_alt2 or databus_B1_3_4_1_3_alt3 or databus_B1_3_4_1_3_alt4 or databus_B1_3_4_1_3_alt5 or databus_B1_3_4_1_3_alt6 or databus_B1_3_4_1_3_alt7 or databus_B1_3_4_1_3_alt8 or databus_B1_3_4_1_3_alt9 or databus_B1_3_4_1_3_alt10 or databus_B1_3_4_1_3_alt11 or databus_B1_3_4_1_3_alt12 or databus_B1_3_4_1_3_alt13 or databus_B1_3_4_1_3_alt14 or databus_B1_3_4_1_3_alt15 or databus_B1_3_4_1_3_alt16 or databus_B1_3_4_1_3_alt17 or databus_B1_3_4_1_3_alt18 or databus_B1_3_4_1_3_alt19 or databus_B1_3_4_1_3_alt20 or databus_B1_3_4_1_3_alt21 or databus_B1_3_4_1_3_simm;
  databus_B1_3_4_1_4 <= databus_B1_3_4_1_4_alt0 or databus_B1_3_4_1_4_alt1 or databus_B1_3_4_1_4_alt2 or databus_B1_3_4_1_4_alt3 or databus_B1_3_4_1_4_alt4 or databus_B1_3_4_1_4_alt5 or databus_B1_3_4_1_4_alt6 or databus_B1_3_4_1_4_alt7 or databus_B1_3_4_1_4_alt8 or databus_B1_3_4_1_4_alt9 or databus_B1_3_4_1_4_alt10 or databus_B1_3_4_1_4_alt11 or databus_B1_3_4_1_4_alt12 or databus_B1_3_4_1_4_alt13 or databus_B1_3_4_1_4_alt14 or databus_B1_3_4_1_4_alt15 or databus_B1_3_4_1_4_alt16 or databus_B1_3_4_1_4_alt17 or databus_B1_3_4_1_4_alt18 or databus_B1_3_4_1_4_alt19 or databus_B1_3_4_1_4_alt20 or databus_B1_3_4_1_4_alt21 or databus_B1_3_4_1_4_simm;

end comb_andor;
