# RISC-V simple counter program

            .text

start:      mv t0, zero              # t0 = 0
            addi t0, t0, 1           # t0 = t0 + 1
            mv t1, zero              # t1 = 0
            addi t1, t1, -1          # t1 = t1 - 1
            bgeu t1, t0, sucsses     # if t0 >= t1 then sucsses (0xffffffff > 0x00000001)
fail:       mv a0, zero
            jal end
sucsses:    mv a0, zero
            addi a0, a0, 1
end:        beqz  zero,  end
