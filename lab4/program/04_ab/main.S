# RISC-V simple counter program
            .text

start:      mv t0, zero              # t0 = 0 t0==a
            mv t1, zero              # t1 = 0 t1==b
            addi t0, t0, 2           # t0 = t0 + 2
            addi t1, t1, 8           # t1 = t1 + 8
            and a0, t0, t1           # a0 = ab(t0, t1)
            addi t0, t0, -1           # t0 = t0 + 2
            addi t1, t1, -5           # t1 = t1 + 8
            and a0, t0, t1           # a0 = ab(t0, t1)
            and a0, t0, t1           # a0 = ab(t0, t1)
end:        beqz  zero,  end