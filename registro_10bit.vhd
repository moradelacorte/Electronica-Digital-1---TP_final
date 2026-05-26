
entity registro_10bit is
    Port ( 
        clk : in  bit;
        clr : in  bit;
        D   : in  bit_vector (9 downto 0);
        Q   : out bit_vector (9 downto 0)
    );
end registro_10bit;

architecture Behavioral of registro_10bit is
begin
    -- Sentencia process permitida solo para lógica secuencial (registros)
    process(clk, clr)
    begin
        if clr = '1' then
            Q <= (others => '0'); -- Reset asincrónico a cero
        elsif rising_edge(clk) then
            Q <= D; -- Guarda el dato en el flanco de subida
        end if;
    end process;
end Behavioral;