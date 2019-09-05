    .data
        # Número para descobrir se é par ou ímpar
        number: .word 334
        
    .text
        #carrega
        lw t0, number
        
        #efetua operação para descobrir o resto da divisão por 2
        addi t1, zero, 2
        rem a1, t0, t1
        addi a0, zero, 1
        ecall
