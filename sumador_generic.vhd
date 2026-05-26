entity sumador_generic is
    generic (
        N : integer := 10 -- Cambiar 
    );
    Port ( 
        A    : in  bit_vector (N-1 downto 0);
        B    : in  bit_vector (N-1 downto 0);
        Cin  : in  bit;
        S    : out bit_vector (N-1 downto 0);
        Cout : out bit
    );
end sumador_generic;

architecture Estructural of sumador_generic is

    component sumador_1bit is
        Port ( 
            A    : in  bit;
            B    : in  bit;
            Cin  : in  bit;
            S    : out bit;
            Cout : out bit
        );
    end component;

    signal c : bit_vector(N downto 0);

begin

    c(0) <= Cin;

    bloque_suma: for i in 0 to N-1 generate
        instancia_bit: sumador_1bit
            port map (
                A    => A(i),
                B    => B(i),
                Cin  => c(i),
                S    => S(i),
                Cout => c(i+1)
            );
    end generate;

    Cout <= c(N);

end Estructural;