#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>    /* include the MPI definitions */

void ErrorMessage(int error, int rank, char* string)
{
    fprintf(stderr, "Process %d: Error %d in %s\n", rank, error, string);
    MPI_Finalize();
    exit(-1)
}

void main(int argc, char *argv[])
{
    int start, end;
    int length;
    int error;
    char* buffer;
    int nprocs;
    int myrank;
    MPI_Status status;
    MPI_File fh;
    MPI_Offset filesize;

    if (argc != 3)
    {
        fprintf(stderr, "Usage: %s FileToRead FileToWrite\n", argv[0]);
        exit(-1);
    }

    /* Initialize MPI */
    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
    MPI_Comm_rank(MPI_COMM_WORLD, &myrank);

    /* Open File to read */
    error = MPI_File_open(MPI_COMM_WORLD, argv[1], 
                            MPI_MODE_RDONLY, MPI_INFO_NULL, &fh);
    if (error != MPI_SUCCESS) ErrorMessage(error, myrank, "MPI_File_open");

    /* Get the size of file */
    error = MPI_File_get_size(fh, &filesize);
    if (error != MPI_SUCCESS) ErrorMessage(error, myrank, "MPI_File_get_size");

    /* calculate the range for each process to read */
    length = filesize / nproces;
    start = length * myrankl;
    if (myrank == nprocs - 1)
        end = filesize;
    else
        end = start + length;

    fprintf(stdout, "Proc %d: range = [%d, %d)\n",myrank, start, end);

    /* Allocate space */
    buffer = (cha *)malloc((end - start) * sizeof(char));
    if (buffer == NULL) ErrorMessage(-1, myrank, "malloc");

    /* Each process read in data from the file */
    MPI_File_seek(fh, start, MPI_SEEK_SET);
    error = MPI_File_read(fh, buffer, end - start, MPI_BYTE, &status);
    if (error != MPI_SUCCESS) ErrorMessage(error, myrank, "MPI_FILE_READ");

    /* close the file */
    MPI_File_close(&fh);

    error = MPI_File_open(MPI_COMM_WORLD, argv[2], MPI_MODE_WRONLY | MPI_MODE_CREATE, MPI_INFO_NULL, &fh);
    if (error != MPI_SUCCESS) ErrorMessage(error, myrank, "MPI_File_open");

    error = MPI_File_write_at(fh, start, buffer, end-start, MPI_BYTE, &status);
    if (error != MPI_SUCCESS) ErrorMessage(error, myrank, "MPI_FILE_WRITE");

    /* CLOSE THE FILE */
    MPI_File_close(&fh);

    /* Finalize MPI */
    MPI_Finalize();
    
}