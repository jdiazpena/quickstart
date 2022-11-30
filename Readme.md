# HPC batch example for SCC

HPC virtually always have a job batch system.
The more resources are requested (CPU count, maximum length of job) the longer you wait for the job to start, so that the system is shared fairly.

## configure request

The idea of building everything each job helps ensure your latest code is being used.
Otherwise it's confusing and you run for 3 days and oops it was not your desired code.

The gemini3d.job script is programmatic to help avoid typos from repeated information.
That is set variables even for simple things.

The gemini3d.job uses old MPI HPC nodes so that you can test with small simulations quickly.
For the actual simulations you'll want to use something faster.
That's the gemini3d.job parameter

```sh
#$ -pe mpi_28_tasks_per_node 56
```

where "448" is the maximum -- you may want to start with less than that. The smallest is 28, in steps of 28 up to 448. The "56" means requesting 56 CPU cores. We are "billed" by how many CPU cores * time used. Requesting more CPU cores means waiting longer for job to start as the system is shared.

[HPC nodes available](https://www.bu.edu/tech/support/research/computing-resources/tech-summary/)

## library / compiler selection

The HPC typically has quite old default compiler--the "module" system is used to load modern compilers and libraries.
Since the same modules are often used for many jobs, we create a script like ~/gcc.sh that is used by many job scripts.
For robustness, Gemini3D builds almost everything it uses, except the compiler and MPI library as those take tens of minutes to build.

## building Gemini3D

Although our "gemini3d.job" rebuilds Gemini3D each time to be sure we're using the latest code, the very first time you're setting up Gemini3D you might wish to do this interactively in case of errors.
This can be done simply by:

```sh
./gemini3d.job
```

That will take 10 minutes or so the first time. After that, you just make it part of the HPC job and it will take less than a minute each time.

## starting a job

```sh
qsub gemini3d.job
```

## Checking job status

```sh
watch qstat -u $(whoami)
```

When the job is done, files are created by the batcher like:

```
gemini3d.job.e$JOB_ID
gemini3d.job.o$JOB_ID
```

I usually check the *.e$JOB_ID file to see if something crashed.
This file is small or empty if no errors happened.
The *.o$JOB_ID file may be a megabyte or more of text with feedback from Gemini3D on what it was doing.
