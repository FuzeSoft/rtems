@c
@c  COPYRIGHT (c) 1988-1998.
@c  On-Line Applications Research Corporation (OAR).
@c  All rights reserved.
@c
@c  $Id$
@c

@ifinfo
@node Scheduler Manager, Scheduler Manager Introduction, time, Top
@end ifinfo
@chapter Scheduler Manager
@ifinfo
@menu
* Scheduler Manager Introduction::
* Scheduler Manager Background::
* Scheduler Manager Operations::
* Scheduler Manager Directives::
@end menu
@end ifinfo

@ifinfo
@node Scheduler Manager Introduction, Scheduler Manager Background, Scheduler Manager, Scheduler Manager
@end ifinfo
@section Introduction

The scheduler manager ...

The directives provided by the scheduler manager are:

@itemize @bullet
@item @code{sched_get_priority_min} - 
@item @code{sched_get_priority_max} - 
@item @code{sched_rr_get_interval} - 
@item @code{sched_yield} - 
@end itemize

@ifinfo
@node Scheduler Manager Background, Priority, Scheduler Manager Introduction, Scheduler Manager
@end ifinfo
@section Background
@ifinfo
@menu
* Priority::
* Scheduling Policies::
@end menu
@end ifinfo

@ifinfo
@node Priority, Scheduling Policies, Scheduler Manager Background, Scheduler Manager Background
@end ifinfo
@subsection Priority

In the RTEMS implementation of the POSIX API, the priorities range from
the low priority of sched_get_priority_min() to the highest priority of
sched_get_priority_max().  Numerically higher values represent higher
priorities.

@ifinfo
@node Scheduling Policies, Scheduler Manager Operations, Priority, Scheduler Manager Background
@end ifinfo
@subsection Scheduling Policies

The following scheduling policies are available:

@table @b
@item SCHED_FIFO
Priority-based, preemptive scheduling with no timeslicing.  This is equivalent
to what is called "manual round-robin" scheduling.

@item SCHED_RR
Priority-based, preemptive scheduling with timeslicing.  Time quantums are 
maintained on a per-thread basis and are not reset at each context switch.
Thus, a thread which is preempted and subsequently resumes execution will
attempt to complete the unused portion of its time quantum.

@item SCHED_OTHER
Priority-based, preemptive scheduling with timeslicing.  Time quantums are 
maintained on a per-thread basis and are reset at each context switch.

@item SCHED_SPORADIC
Priority-based, preemptive scheduling utilizing three additional parameters:
budget, replenishment period, and low priority.  Under this policy, the 
thread is allowed to execute for "budget" amount of time before its priority
is lowered to "low priority".  At the end of each replenishment period,
the thread resumes its initial priority and has its budget replenished.

@end table

@ifinfo
@node Scheduler Manager Operations, Scheduler Manager Directives, Scheduling Policies, Scheduler Manager
@end ifinfo
@section Operations

@ifinfo
@node Scheduler Manager Directives, sched_get_priority_min, Scheduler Manager Operations, Scheduler Manager
@end ifinfo
@section Directives
@ifinfo
@menu
* sched_get_priority_min::
* sched_get_priority_max::
* sched_rr_get_interval::
* sched_yield::
@end menu
@end ifinfo

This section details the scheduler manager's directives.
A subsection is dedicated to each of this manager's directives
and describes the calling sequence, related constants, usage,
and status codes.

@page
@ifinfo
@node sched_get_priority_min, sched_get_priority_max, Scheduler Manager Directives, Scheduler Manager Directives
@end ifinfo
@subsection sched_get_priority_min

@subheading CALLING SEQUENCE:

@example
#include <sched.h>

int sched_get_priority_min(
  int policy
);
@end example

@subheading STATUS CODES:

On error, this routine returns -1 and sets errno to one of the following:

@table @b
@item EINVAL
The indicated policy is invalid.
 
@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@ifinfo
@node sched_get_priority_max, sched_rr_get_interval, sched_get_priority_min, Scheduler Manager Directives
@end ifinfo
@subsection sched_get_priority_max

@subheading CALLING SEQUENCE:

@example
#include <sched.h>

int sched_get_priority_max(
  int policy
);
@end example

@subheading STATUS CODES:

On error, this routine returns -1 and sets errno to one of the following:

@table @b
@item EINVAL
The indicated policy is invalid.
 
@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@ifinfo
@node sched_rr_get_interval, sched_yield, sched_get_priority_max, Scheduler Manager Directives
@end ifinfo
@subsection sched_rr_get_interval

@subheading CALLING SEQUENCE:

@example
#include <sched.h>

int sched_rr_get_interval(
  pid_t            pid,
  struct timespec *interval
);
@end example

@subheading STATUS CODES:

On error, this routine returns -1 and sets errno to one of the following:

@table @b
@item ESRCH
The indicated process id is invalid. 
 
@item EINVAL
The specified interval pointer parameter is invalid. 

@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@ifinfo
@node sched_yield, Command and Variable Index, sched_rr_get_interval, Scheduler Manager Directives
@end ifinfo
@subsection sched_yield

@subheading CALLING SEQUENCE:

@example
#include <sched.h>

int sched_yield( void );
@end example

@subheading STATUS CODES:

This routine always returns zero to indicate success.

@subheading DESCRIPTION:

@subheading NOTES:

