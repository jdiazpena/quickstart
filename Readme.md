# HPC batch example for SCC

HPC virtually always have a job batch system. 
The more resources are requested (CPU count, maximum length of job) the longer you wait for the job to start, so that the system is shared fairly.

## library / compiler selection

The HPC typically has quite old default compiler--the "module" system is used to load modern compilers and libraries.
Since the same modules are often used for many jobs, we create a script like ~/gcc.sh that is used by many job scripts.
For robustness, Gemini3D builds almost everything it uses, except the compiler and MPI library as those take tens of minutes to build.

## building Gemini3D
Although our "test.job" rebuilds Gemini3D each time to be sure we're using the latest code, the very first time you're setting up Gemini3D you might wish to do this interactively in case of errors.
This can be done simply by:

```sh
chmod +x test.job
./test.job
```

That will take 10 minutes or so the first time. After that, you just make it part of the HPC job and it will take less than a minute each time.

## starting a job

```sh
qsub test.job
```

## Checking job status

```sh
watch qstat -u $(whoami) 
```

When the job is done, files are created by the batcher like:

```
test.job.e$JOB_ID
test.job.o$JOB_ID
```

I usually check the *.e$JOB_ID file to see if something crashed. 
This file is small or empty if no errors happened.
The *.o$JOB_ID file may be a megabyte or more of text with feedback from Gemini3D on what it was doing.