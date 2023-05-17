! This program solves a linear system using ILU preconditioning and PGMRES method
program linear_solver
    implicit none
    
    ! Declare variables
    real*8, dimension(:), allocatable :: a, rhs, alu, w, sol, vv
    integer, dimension(:), allocatable :: ia, ja, jlu, ju, levs, jw
    integer :: nmax, nzmax, iounit, n, nnz, ierr, i, lfil, iwk, maxits, im, iout
    real*8 :: st, fin, eps
    
    ! Initialize matrix variables
    nmax = 264751
    nzmax = 3541545
    iounit = 21
    
    allocate(ia(nmax+1), ja(nzmax), a(nzmax))
    open(iounit, file="/home/maxim/svt/fortran/4.dat")
    call readsk(nmax,nzmax,n,nnz,a,ja,ia,iounit,ierr)
    print *, "Matrix Size: ", n
    
    ! Initialize right-hand side vector
    allocate(rhs(n))
    do i = 1, n
        rhs(i) = sin(real(i))
    end do
    
    ! Perform ILU preconditioning
    lfil = 0
    iwk = nnz * 100
    allocate(jw(3*n), w(n), alu(iwk), jlu(iwk), levs(iwk), ju(n))
    call cpu_time(st)
    call iluk(n,a,ja,ia,0,alu,jlu,ju,levs,iwk,w,jw,ierr)
    call cpu_time(fin)
    print *, "Time ILU = ", fin-st
    
    ! Solve using PGMRES method
    im = 13
    eps = 1e-6
    maxits = n * n
    iout = 20
    
    open(iout, file="/home/maxim/svt/fortran/logs.txt")
    allocate(sol(n), vv(n * (im + 1)))
    
    call cpu_time(st)
    call pgmres(n, im, rhs, sol, vv, eps, maxits, iout, a, ja, ia, alu, jlu, ju, ierr)
    call cpu_time(fin)
    
    print *, "Time for pgmres = ", fin-st
    
    ! Deallocate memory
    deallocate(ia, ja, a, jw, w, alu, jlu, levs, ju, sol, vv, rhs)
    
end program linear_solver
