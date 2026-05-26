
entity sumador_1bit is
    Port ( 
        A    : in  bit;
        B    : in  bit;
        Cin  : in  bit;
        S    : out bit;
        Cout : out bit
    );
end sumador_1bit;

architecture Combinacional of sumador_1bit is
begin
    -- Ecuación de la suma (XOR)
    S    <= A xor B xor Cin;
    
    -- Ecuación del acarreo de salida (Suma de productos)
    Cout <= (A and B) or (Cin and (A xor B));
    
end Combinacional;