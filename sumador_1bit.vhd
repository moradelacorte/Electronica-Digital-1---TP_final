library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumador_1bit is
    Port ( 
        A    : in  STD_LOGIC;
        B    : in  STD_LOGIC;
        Cin  : in  STD_LOGIC;
        S    : out STD_LOGIC;
        Cout : out STD_LOGIC
    );
end sumador_1bit;

architecture Combinacional of sumador_1bit is
begin
    -- Ecuación de la suma (XOR)
    S    <= A xor B xor Cin;
    
    -- Ecuación del acarreo de salida (Suma de productos)
    Cout <= (A and B) or (Cin and (A xor B));
    
end Combinacional;