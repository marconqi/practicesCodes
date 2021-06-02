  PROGRAM MAIN
  
  include 'mpif.h'

  integer ierr, i, myrank, mysize
  integer a

  call MPI_INIT(ierr)
  call MPI_COMM_SIZE(MPI_COMM_WORLD, mysize, ierr)
  call MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)

  OPEN(65, FILE="INPUT", ACTION='READWRITE')
  READ(65,*) a
  a = a+1
  WRITE(65,*) a
  CLOSE(65)
  print *, 'Hello World from process: ', myrank, 'of ', mysize, "what I read=",a
  call MPI_FINALIZE(ierr)
  END PROGRAM MAIN