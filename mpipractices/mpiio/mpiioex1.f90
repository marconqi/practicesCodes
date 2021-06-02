  PROGRAM MAIN
  
  include 'mpif.h'

  integer ierr, i, myrank, mysize
  INTEGER :: tfile
  integer a

  a = 0

  call MPI_INIT(ierr)
  call MPI_COMM_SIZE(MPI_COMM_WORLD, mysize, ierr)
  call MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)


  call MPI_FILE_OPEN(MPI_COMM_WORLD,'INPUT',MPI_MODE_RDWR,MPI_INFO_NULL,tfile,ierr)
  !call MPI_FILE_SET_VIEW(tfile, 0, MPI_INTEGER, &
  !                          MPI_INTEGER, 'native', &
  !                          MPI_INFO_NULL, ierr)
                            
                            
  call MPI_BARRIER(MPI_COMM_WORLD, ierr)  
  call MPI_FILE_READ(tfile,a,1,MPI_INTEGER,MPI_STATUS_IGNORE,ierr)
  !call MPI_FILE_READ_AT(tfile,0,a,MPI_INT,MPI_INT,MPI_STATUS_IGNORE,ierr)
  a = a+1
  print *, "read file variable = ",a
  write(*,*) a + myrank
  call MPI_FILE_WRITE(tfile,a,1,MPI_INTEGER,MPI_STATUS_IGNORE,ierr)
  call MPI_FILE_CLOSE(tfile,ierr)
  
  
  print *, 'Hello World from process: ', myrank, 'of ', mysize, "what I read=",a
  call MPI_FINALIZE(ierr)
  END PROGRAM MAIN