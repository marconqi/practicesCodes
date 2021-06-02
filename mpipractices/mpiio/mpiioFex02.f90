!*******************************************************

    program read_file
!*******************************************************

    USE MPI

    integer, parameter :: kind_val = 4
    integer, parameter :: filesize = 40
    integer :: realsize = 4
    integer :: rank, ierr, fh, nprocs, num_reals
    integer :: i, region
    integer, dimension (MPI_STATUS_SIZE) :: status
    integer (kind = MPI_OFFSET_KIND) :: offset, empty

! set filename to output datafile
    character (len=*), parameter :: filename = "new_data.dat"
    real (kind = kind_val), dimension (:), allocatable :: bucket

! basic MPI set-up
    call MPI_INIT(ierr)
    call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr)
    call MPI_COMM_SIZE(MPI_COMM_WORLD, nprocs, ierr)

! Carve out a piece of the output file and create a data bucket
    empty = 0
    region = filesize / (nprocs)
    offset = (region * rank)
    allocate (bucket(region))

! Sanity print
    print*, "myid is ", rank

! set the file handle to an initial value (this should not be required)
    fh = 0

! Open the output file
    call MPI_FILE_OPEN(MPI_COMM_WORLD, filename, MPI_MODE_RDONLY, MPI_INFO_NULL, fh, ierr)

! Wait on everyone to catch up
    call MPI_BARRIER(MPI_COMM_WORLD, ierr)

! Basic "belt and suspenders insurance that everyone's file pointer is at the beginning of the output file.
    call MPI_FILE_SET_VIEW(fh, 0, MPI_REAL4, MPI_REAL4, 'native', MPI_INFO_NULL, ierr)

! Read only the section of the data file each process needs  and put data in the data backet.
    call MPI_FILE_READ_AT(fh, offset, bucket, region, MPI_REAL4, status, ierr)

! We could check the values received in the bucket (debug hint)
    do i = 1, region
        print *, "my id is ", rank, " and my ", i , " number is ", bucket(i)
    enddo

! Wait on everyone to finish and close up shop
    call MPI_BARRIER(MPI_COMM_WORLD, ierr)
    call MPI_FILE_CLOSE(fh, ierr)
    call MPI_FINALIZE(ierr)

    end program read_file