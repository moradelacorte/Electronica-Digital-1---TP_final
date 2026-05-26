library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detector_799 is
    Port ( 
        count_in : in  STD_LOGIC_VECTOR (9 downto 0);
        equals   : out STD_LOGIC
    );
end detector_799;

architecture Combinacional of detector_799 is
begin
    -- Activamos la salida en '1' solo cuando count_in sea "1100011111" = 799
    -- Negamos las posiciones de los bits que deben ser '0' (bits 7 y 6)
    equals <= count_in(9) and count_in(8) and (not count_in(7)) and (not count_in(6)) 
              and count_in(5) and count_in(4) and count_in(3) and count_in(2) 
              and count_in(1) and count_in(0);
              
end Combinacional;