library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.tce_util.all;

entity toplevel_output_socket_cons_13_1 is
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
end toplevel_output_socket_cons_13_1;


architecture output_socket_andor of toplevel_output_socket_cons_13_1 is

  signal databus_0_temp : std_logic_vector(DATAW_0-1 downto 0);
  signal databus_1_temp : std_logic_vector(DATAW_0-1 downto 0);
  signal databus_2_temp : std_logic_vector(DATAW_0-1 downto 0);
  signal databus_3_temp : std_logic_vector(DATAW_0-1 downto 0);
  signal databus_4_temp : std_logic_vector(DATAW_0-1 downto 0);
  signal databus_5_temp : std_logic_vector(DATAW_0-1 downto 0);
  signal databus_6_temp : std_logic_vector(DATAW_0-1 downto 0);
  signal databus_7_temp : std_logic_vector(DATAW_0-1 downto 0);
  signal databus_8_temp : std_logic_vector(DATAW_0-1 downto 0);
  signal databus_9_temp : std_logic_vector(DATAW_0-1 downto 0);
  signal databus_10_temp : std_logic_vector(DATAW_0-1 downto 0);
  signal databus_11_temp : std_logic_vector(DATAW_0-1 downto 0);
  signal databus_12_temp : std_logic_vector(DATAW_0-1 downto 0);
  signal data : std_logic_vector(DATAW_0-1 downto 0);

begin -- output_socket_andor

  data <= data0;

  internal_signal : process(data, databus_cntrl)
  begin -- process internal_signal
    databus_0_temp <= data and sxt(databus_cntrl(0 downto 0), data'length);
    databus_1_temp <= data and sxt(databus_cntrl(1 downto 1), data'length);
    databus_2_temp <= data and sxt(databus_cntrl(2 downto 2), data'length);
    databus_3_temp <= data and sxt(databus_cntrl(3 downto 3), data'length);
    databus_4_temp <= data and sxt(databus_cntrl(4 downto 4), data'length);
    databus_5_temp <= data and sxt(databus_cntrl(5 downto 5), data'length);
    databus_6_temp <= data and sxt(databus_cntrl(6 downto 6), data'length);
    databus_7_temp <= data and sxt(databus_cntrl(7 downto 7), data'length);
    databus_8_temp <= data and sxt(databus_cntrl(8 downto 8), data'length);
    databus_9_temp <= data and sxt(databus_cntrl(9 downto 9), data'length);
    databus_10_temp <= data and sxt(databus_cntrl(10 downto 10), data'length);
    databus_11_temp <= data and sxt(databus_cntrl(11 downto 11), data'length);
    databus_12_temp <= data and sxt(databus_cntrl(12 downto 12), data'length);
  end process internal_signal;

  output : process (databus_0_temp,databus_1_temp,databus_2_temp,databus_3_temp,databus_4_temp,databus_5_temp,databus_6_temp,databus_7_temp,databus_8_temp,databus_9_temp,databus_10_temp,databus_11_temp,databus_12_temp)
  begin -- process output
    if BUSW_0 < data'length then
      databus0_alt <= databus_0_temp(BUSW_0-1 downto 0);
    else
      databus0_alt <= ext(databus_0_temp, databus0_alt'length);
    end if;
    if BUSW_1 < data'length then
      databus1_alt <= databus_1_temp(BUSW_1-1 downto 0);
    else
      databus1_alt <= ext(databus_1_temp, databus1_alt'length);
    end if;
    if BUSW_2 < data'length then
      databus2_alt <= databus_2_temp(BUSW_2-1 downto 0);
    else
      databus2_alt <= ext(databus_2_temp, databus2_alt'length);
    end if;
    if BUSW_3 < data'length then
      databus3_alt <= databus_3_temp(BUSW_3-1 downto 0);
    else
      databus3_alt <= ext(databus_3_temp, databus3_alt'length);
    end if;
    if BUSW_4 < data'length then
      databus4_alt <= databus_4_temp(BUSW_4-1 downto 0);
    else
      databus4_alt <= ext(databus_4_temp, databus4_alt'length);
    end if;
    if BUSW_5 < data'length then
      databus5_alt <= databus_5_temp(BUSW_5-1 downto 0);
    else
      databus5_alt <= ext(databus_5_temp, databus5_alt'length);
    end if;
    if BUSW_6 < data'length then
      databus6_alt <= databus_6_temp(BUSW_6-1 downto 0);
    else
      databus6_alt <= ext(databus_6_temp, databus6_alt'length);
    end if;
    if BUSW_7 < data'length then
      databus7_alt <= databus_7_temp(BUSW_7-1 downto 0);
    else
      databus7_alt <= ext(databus_7_temp, databus7_alt'length);
    end if;
    if BUSW_8 < data'length then
      databus8_alt <= databus_8_temp(BUSW_8-1 downto 0);
    else
      databus8_alt <= ext(databus_8_temp, databus8_alt'length);
    end if;
    if BUSW_9 < data'length then
      databus9_alt <= databus_9_temp(BUSW_9-1 downto 0);
    else
      databus9_alt <= ext(databus_9_temp, databus9_alt'length);
    end if;
    if BUSW_10 < data'length then
      databus10_alt <= databus_10_temp(BUSW_10-1 downto 0);
    else
      databus10_alt <= ext(databus_10_temp, databus10_alt'length);
    end if;
    if BUSW_11 < data'length then
      databus11_alt <= databus_11_temp(BUSW_11-1 downto 0);
    else
      databus11_alt <= ext(databus_11_temp, databus11_alt'length);
    end if;
    if BUSW_12 < data'length then
      databus12_alt <= databus_12_temp(BUSW_12-1 downto 0);
    else
      databus12_alt <= ext(databus_12_temp, databus12_alt'length);
    end if;
  end process output;

end output_socket_andor;
