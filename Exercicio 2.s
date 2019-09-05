    .data
        number: .word 5 # Número para encontrar o fatorial
        
    .text
        # carrega número
        lw a0, number
        jal ra, fat
        
        # seta parametros para impressão
        addi a1, a0, 0
        addi a0, zero, 1
        jal zero, print
        
        fat:
            # alocando espaço na stack e armazenando dados
            addi sp, sp, -8
            sw a0, 4(sp)
            sw ra, 0(sp)
            
            # se n-1 >= 1, vai pro else
            addi t0, a0, -1
            addi t1, zero, 1
            bge t0, t1, else
            
            # desaloca espaço na stack e retorna 1
            addi sp, sp, 8
            addi a0, zero, 1
            jalr zero, 0(ra)
            
        else:
            # chama fat de n-1 e guarda o resultado em t0
            addi a0, a0, -1
            jal ra, fat
            addi t0, a0, 0
            
            # recupera dados da stack e desaloca o espaço
            lw ra, 0(sp)
            lw a0, 4(sp)
            addi sp, sp, 8
            
            # faz n * fat(n-1)
            mul a0, a0, t0
            jalr zero, 0(ra)
            
        print:
            ecall
