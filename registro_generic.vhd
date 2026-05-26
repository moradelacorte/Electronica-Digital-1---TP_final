entity registro_generic is
    generic (
        N : integer := 10 -- Cambiar 
    );
    Port ( 
        clk : in  bit;
        clr : in  bit;
        D   : in  bit_vector (N-1 downto 0);
        Q   : out bit_vector (N-1 downto 0)
    );
end registro_generic;

architecture Behavioral of registro_generic is
begin
    process(clk, clr)
    begin
        if clr = '1' then
            Q <= (others => '0');
        elsif clk'event and clk = '1' then -- Detección de flanco de subida para tipo BIT
            Q <= D;
        end if;
    end process;
end Behavioral;