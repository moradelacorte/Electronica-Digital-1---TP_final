
entity sumador_4bit is
    Port ( 
        A    : in  bit_vector (3 downto 0);
        B    : in  bit_vector (3 downto 0);
        Cin  : in  bit;
        S    : out bit_vector (3 downto 0);
        Cout : out bit
    );
end sumador_4bit;

architecture Estructural of sumador_4bit is

    -- Declaración del componente 
    component sumador_1bit is
        Port ( 
        A    : in  bit;
        B    : in  bit;
        Cin  : in  bit;
        S    : out bit;
        Cout : out bit
        );
    end component;

    -- Cables internos para conectar el Cout de un sumador al Cin del siguiente
    signal c1, c2, c3 : bit;

begin

    -- Instancia del Bit 0 (El menos significativo - LSB)
    bit0: sumador_1bit 
        port map (
            A    => A(0),
            B    => B(0),
            Cin  => Cin,
            S    => S(0),
            Cout => c1     -- El acarreo sale por c1
        );

    -- Instancia del Bit 1
    bit1: sumador_1bit 
        port map (
            A    => A(1),
            B    => B(1),
            Cin  => c1,    -- El acarreo entra desde c1
            S    => S(1),
            Cout => c2     -- El acarreo sale por c2
        );

    -- Instancia del Bit 2
    bit2: sumador_1bit 
        port map (
            A    => A(2),
            B    => B(2),
            Cin  => c2,
            S    => S(2),
            Cout => c3
        );

    -- Instancia del Bit 3 (El más significativo - MSB)
    bit3: sumador_1bit 
        port map (
            A    => A(3),
            B    => B(3),
            Cin  => c3,
            S    => S(3),
            Cout => Cout   -- El acarreo final sale del bloque
        );

end Estructural;