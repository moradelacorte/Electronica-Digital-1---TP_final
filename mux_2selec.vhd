entity mux_2selec is
    generic (
        N : integer := 10 -- Tamaño de los buses de datos (por defecto 10 bits)
    );
    Port ( 
        A   : in  bit_vector (N-1 downto 0); -- Entrada de datos 0
        B   : in  bit_vector (N-1 downto 0); -- Entrada de datos 1
        Sel : in  bit;                       -- Pin selector
        Y   : out bit_vector (N-1 downto 0)  -- Salida elegida
    );
end mux_2selec;

architecture Estructural of mux_2selec is
begin

    gen_mux: for i in 0 to N-1 generate
        
        -- Ecuación booleana del multiplexor usando compuertas puras
        Y(i) <= (A(i) and not Sel) or (B(i) and Sel);
        
    end generate;
    
end Estructural;