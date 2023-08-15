#    Generador de números pseudo-aleatorios de 8-bits (LSFR)
#
#    Polinomio: x^8 + x^6 + x^5 + x^4 + 1
#	 Semilla: Segundo Apellido: Mata
#	 => M : 077D -> 4DH -> b 0100 1101
#	 Posición Memoria position -> 0x100


start:
    li a1,0x4D          # [a1] <- 0x4D : lsfr_value 
    li a2,0x100         # [a2] <- 0x100 : pos_mem
    sw a1,0(a2)         # 0x4D -> store
    li a3,0x0           # [a3] <- 0x0 : contador
    li a4,0x64          # [a4] <- 0x64 : Condició parada


lsfr:
    srli t0,a1,0x0      # [t0] <- [lsfr_value] >> 0 (pos 8)
    srli t1,a1,0x2      # [t0] <- [lsfr_value] >> 2 (pos 6)
    srli t2,a1,0x3      # [t0] <- [lsfr_value] >> 3 (pos 5)
    srli t3,a1,0x4      # [t1] <- [lsfr_value] >> 4 (pos 4)
    
    xor t4,t1,t0        # [t5] <- [b8] xor [b6]
    xor t5,t4,t2        # [t6] <- [b8] xor [b6] xor [b5]
    xor t6,t5,t3        # [t6] <- [b8] xor [b6] xor [b5] xor [b4] == result
    
    andi s0,t6,0x1      # [t4] <- [t2] & 00000001 para obtener solo el resultado
    slli s0,s0,0x7      # [t4] <- [t4] << 7 ponerlo en el primer bit de la cadena
    srli s1,a1,0x1      # [t5] <- [lsfr_value] >> 1 eliminar el ultimo bit
    add a1,s1,s0        # [a1] <- [t5] agregar el bit resultante a la cadena


check:
    addi a3,a3,0x1      # contador
    addi a2,a2,0x4      # cambio pos memoria
    sw a1,0(a2)         # [lsfr_value] -> M[mem_pos]
    blt a3,a4,lsfr      # comparación
    j end               # terminar


end:
    nop                  # final