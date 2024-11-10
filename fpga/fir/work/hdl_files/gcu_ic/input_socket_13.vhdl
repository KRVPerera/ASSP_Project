library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity toplevel_input_socket_cons_13 is

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

end toplevel_input_socket_cons_13;

architecture input_socket of toplevel_input_socket_cons_13 is
begin

    -- If width of input bus is greater than width of output,
    -- using the LSB bits.
    -- If width of input bus is smaller than width of output,
    -- using zero extension to generate extra bits.

  sel : process (databus_cntrl, databus0, databus1, databus2, databus3, databus4, databus5, databus6, databus7, databus8, databus9, databus10, databus11, databus12)
  begin
    case databus_cntrl is
      when "0000" =>
        if BUSW_0 < DATAW then
          data <= ext(databus0,data'length);
        elsif BUSW_0 > DATAW then
          data <= databus0(DATAW-1 downto 0);
        else
          data <= databus0(BUSW_0-1 downto 0);
        end if;
      when "0001" =>
        if BUSW_1 < DATAW then
          data <= ext(databus1,data'length);
        elsif BUSW_1 > DATAW then
          data <= databus1(DATAW-1 downto 0);
        else
          data <= databus1(BUSW_1-1 downto 0);
        end if;
      when "0010" =>
        if BUSW_2 < DATAW then
          data <= ext(databus2,data'length);
        elsif BUSW_2 > DATAW then
          data <= databus2(DATAW-1 downto 0);
        else
          data <= databus2(BUSW_2-1 downto 0);
        end if;
      when "0011" =>
        if BUSW_3 < DATAW then
          data <= ext(databus3,data'length);
        elsif BUSW_3 > DATAW then
          data <= databus3(DATAW-1 downto 0);
        else
          data <= databus3(BUSW_3-1 downto 0);
        end if;
      when "0100" =>
        if BUSW_4 < DATAW then
          data <= ext(databus4,data'length);
        elsif BUSW_4 > DATAW then
          data <= databus4(DATAW-1 downto 0);
        else
          data <= databus4(BUSW_4-1 downto 0);
        end if;
      when "0101" =>
        if BUSW_5 < DATAW then
          data <= ext(databus5,data'length);
        elsif BUSW_5 > DATAW then
          data <= databus5(DATAW-1 downto 0);
        else
          data <= databus5(BUSW_5-1 downto 0);
        end if;
      when "0110" =>
        if BUSW_6 < DATAW then
          data <= ext(databus6,data'length);
        elsif BUSW_6 > DATAW then
          data <= databus6(DATAW-1 downto 0);
        else
          data <= databus6(BUSW_6-1 downto 0);
        end if;
      when "0111" =>
        if BUSW_7 < DATAW then
          data <= ext(databus7,data'length);
        elsif BUSW_7 > DATAW then
          data <= databus7(DATAW-1 downto 0);
        else
          data <= databus7(BUSW_7-1 downto 0);
        end if;
      when "1000" =>
        if BUSW_8 < DATAW then
          data <= ext(databus8,data'length);
        elsif BUSW_8 > DATAW then
          data <= databus8(DATAW-1 downto 0);
        else
          data <= databus8(BUSW_8-1 downto 0);
        end if;
      when "1001" =>
        if BUSW_9 < DATAW then
          data <= ext(databus9,data'length);
        elsif BUSW_9 > DATAW then
          data <= databus9(DATAW-1 downto 0);
        else
          data <= databus9(BUSW_9-1 downto 0);
        end if;
      when "1010" =>
        if BUSW_10 < DATAW then
          data <= ext(databus10,data'length);
        elsif BUSW_10 > DATAW then
          data <= databus10(DATAW-1 downto 0);
        else
          data <= databus10(BUSW_10-1 downto 0);
        end if;
      when "1011" =>
        if BUSW_11 < DATAW then
          data <= ext(databus11,data'length);
        elsif BUSW_11 > DATAW then
          data <= databus11(DATAW-1 downto 0);
        else
          data <= databus11(BUSW_11-1 downto 0);
        end if;
      when others =>
        if BUSW_12 < DATAW then
          data <= ext(databus12,data'length);
        elsif BUSW_12 > DATAW then
          data <= databus12(DATAW-1 downto 0);
        else
          data <= databus12(BUSW_12-1 downto 0);
        end if;
    end case;
  end process sel;
end input_socket;
