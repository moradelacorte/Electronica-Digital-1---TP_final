
entity contador_10bit is
    Port ( 
        clk   : in  bit;
        clr   : in  bit;
        count : out bit_vector(9 downto 0)
    );
end contador_10bit;

architecture Estructural of contador_10bit is

    component sumador_10bit is
        Port ( 
            A    : in  bit_vector (9 downto 0);
            B    : in  bit_vector (9 downto 0);
            Cin  : in  bit;
            S    : out bit_vector (9 downto 0);
            Cout : out bit
        );
    end component;

    component registro_10bit is
        Port ( 
            clk : in  bit;
            clr : in  bit;
            D   : in  bit_vector (9 downto 0);
            Q   : out bit_vector (9 downto 0)
        );
    end component;

    -- Cables lógicos internos para entrelazar el sumador y el registro
    signal valor_actual    : bit_vector (9 downto 0);
    signal valor_siguiente : bit_vector (9 downto 0);
    
    -- El valor constante '1' en formato binario de 10 bits
    signal uno_constante   : bit_vector (9 downto 0) := "0000000001";
    signal cout_no_usado   : bit;

begin

    -- Instanciamos la memoria (Registro)
    memoria: registro_10bit
        port map (
            clk => clk,
            clr => clr,
            D   => valor_siguiente, -- Le entra el cálculo de la suma
            Q   => valor_actual     -- Sale el valor retenido en el tiempo
        );

    -- Instanciamos la matemática (Sumador)
    calculo_suma: sumador_10bit
        port map (
            A    => valor_actual,    -- Toma el número de la memoria
            B    => uno_constante,   -- Le suma 1
            Cin  => '0',
            S    => valor_siguiente, -- Envía el resultado al registro para el próximo ciclo
            Cout => cout_no_usado
        );

    -- Exponemos el valor actual del contador hacia afuera del bloque
    count <= valor_actual;

end Estructural;