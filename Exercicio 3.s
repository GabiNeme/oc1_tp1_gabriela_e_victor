    .data
        numElementos: .word 4
        
        # vetores a serem comparados
        vet1: .word 1, 2, 3, 4
        vet2: .word 4, 3, 2, 1
        
    .text
        lw s0, numElementos
        
        # carrega posição da memória do primeiro array
        lui s1, 0x10000
        addi s1, s1, 4
        
        # carrega posição da memória do segundo array
        slli t3, s0, 2
        add s2, s1, t3
        
        # carrega posição da memória do array auxiliar
        add s5, s2, t3
        
        # indica se os pacotes de sementes são iguais
        addi a1, zero, 1
        
        #contador para zerar o array auxiliar
        addi t1, zero, -1
        ZeraArray:
            addi t1, t1, 1
            beq t1, s0, Continua
        
            slli t2, t1, 2
            add t2, s5, t2
            sw zero, 0(t1)
        
            beq zero, zero, ZeraArray
        
        Continua:
            # contadores dos arrays 1 e 2
            addi s3, zero, -1
            addi s4, zero, -1
        
            # carrega o próximo elemento do primeiro array
            CarrArray1:
                addi s3, s3, 1
                beq s3, s0, print
        
                slli t1, s3, 2
                add t1, s1, t1
                lw t2, 0(t1)
                
                # carrega o próximo elemento do segundo array e do auxiliar
                CarrArray2:
                    addi s4, s4, 1
                    # Confere se o array inteiro foi percorrido no loop
                    beq s4, s0, NumNaoEncontrado
        
                    slli t1, s4, 2
                    add t1, s2, t1
                    lw t3, 0(t1)
        
                    slli t1, s4, 2
                    add t1, s5, t1
                    lw t4, 0(t1)
        
                    addi t5, zero, 1
                    # Se os elementos não forem iguais, o loop continua
                    bne t2, t3, CarrArray2
                    # Se os elemento estiver marcado, o loop continua
                    beq t4, t5, CarrArray2
        
                    # marca posição do número encontrado no array auxiliar
                    addi t3, zero, 1
                    sw t3, 0(t1)
                    addi s4, zero, -1
                    beq zero, zero CarrArray1
        
        
            NumNaoEncontrado:
                addi a1, zero, 0
        
            print:
                addi a0, zero, 1
                ecall

