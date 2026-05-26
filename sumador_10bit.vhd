
entity sumador_10bit is
    Port ( 
        A    : in  bit_vector (9 downto 0);
        B    : in  bit_vector (9 downto 0);
        Cin  : in  bit;
        S    : out bit_vector (9 downto 0);
        Cout : out bit
    );
end sumador_10bit;

architecture Estructural of sumador_10bit is

    component sumador_1bit is
        Port ( 
        A    : in  bit;
        B    : in  bit;
        Cin  : in  bit;
        S    : out bit;
        Cout : out bit
        );
    end component;

    -- Cables de acarreo internos (necesitamos 9 acarreos intermedios)
    signal c : bit_vector (8 downto 0);

begin

    -- Bit 0 (El menos significativo - LSB)
    bit0: sumador_1bit 
        port map ( A => A(0), B => B(0), Cin => Cin, S => S(0), Cout => c(0) );

    -- Conexión en cascada de los bits intermedios (1 al 8)
    bit1: sumador_1bit port map ( A => A(1), B => B(1), Cin => c(0), S => S(1), Cout => c(1) );
    bit2: sumador_1bit port map ( A => A(2), B => B(2), Cin => c(1), S => S(2), Cout => c(2) );
    bit3: sumador_1bit port map ( A => A(3), B => B(3), Cin => c(2), S => S(3), Cout => c(3) );
    bit4: sumador_1bit port map ( A => A(4), B => B(4), Cin => c(3), S => S(4), Cout => c(4) );
    bit5: sumador_1bit port map ( A => A(5), B => B(5), Cin => c(4), S => S(5), Cout => c(5) );
    bit6: sumador_1bit port map ( A => A(6), B => B(6), Cin => c(5), S => S(6), Cout => c(6) );
    bit7: sumador_1bit port map ( A => A(7), B => B(7), Cin => c(6), S => S(7), Cout => c(7) );
    bit8: sumador_1bit port map ( A => A(8), B => B(8), Cin => c(7), S => S(8), Cout => c(8) );

    -- Bit 9 (El más significativo - MSB)
    bit9: sumador_1bit 
        port map ( A => A(9), B => B(9), Cin => c(8), S => S(9), Cout => Cout );

end Estructural;