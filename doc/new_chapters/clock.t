@c
@c  COPYRIGHT (c) 1988-1998.
@c  On-Line Applications Research Corporation (OAR).
@c  All rights reserved.
@c
@c  $Id$
@c

@ifinfo
@node Clock Manager, Clock Manager Introduction, pthread_getspecific, Top
@end ifinfo
@chapter Clock Manager
@ifinfo
@menu
* Clock Manager Introduction::
* Clock Manager Background::
* Clock Manager Operations::
* Clock Manager Directives::
@end menu
@end ifinfo

@ifinfo
@node Clock Manager Introduction, Clock Manager Background, Clock Manager, Clock Manager
@end ifinfo
@section Introduction

The clock manager ...

The directives provided by the clock manager are:

@itemize @bullet
@item @code{clock_gettime} - 
@item @code{clock_settime} -
@item @code{clock_getres} -
@item @code{nanosleep} -
@item @code{time} -
@end itemize

@ifinfo
@node Clock Manager Background, Clock Manager Operations, Clock Manager Introduction, Clock Manager
@end ifinfo
@section Background

@ifinfo
@node Clock Manager Operations, Clock Manager Directives, Clock Manager Background, Clock Manager
@end ifinfo
@section Operations

@ifinfo
@node Clock Manager Directives, clock_gettime, Clock Manager Operations, Clock Manager
@end ifinfo
@section Directives
@ifinfo
@menu
* clock_gettime::
* clock_settime::
* clock_getres::
* sleep::
* nanosleep::
* time::
@end menu
@end ifinfo

This section details the clock manager's directives.
A subsection is dedicated to each of this manager's directives
and describes the calling sequence, related constants, usage,
and status codes.

@page
@ifinfo
@node clock_gettime, clock_settime, Clock Manager Directives, Clock Manager Directives
@end ifinfo
@subsection clock_gettime

@subheading CALLING SEQUENCE:

@example
#include <time.h>

int clock_gettime(
  clockid_t        clock_id,
  struct timespec *tp
);
@end example

@subheading STATUS CODES:

On error, this routine returns -1 and sets errno to one of the following:

@table @b
@item EINVAL
The tp pointer parameter is invalid. 

@item EINVAL
The clock_id specified is invalid. 
@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@ifinfo
@node clock_settime, clock_getres, clock_gettime, Clock Manager Directives
@end ifinfo
@subsection clock_settime
 
@subheading CALLING SEQUENCE:
 
@example
#include <time.h>
 
int clock_settime(
  clockid_t              clock_id,
  const struct timespec *tp
);
@end example
 
@subheading STATUS CODES:
 
On error, this routine returns -1 and sets errno to one of the following:

@table @b
@item EINVAL
The tp pointer parameter is invalid. 

@item EINVAL
The clock_id specified is invalid.

@item EINVAL
The contents of the tp structure are invalid.

@end table
 
@subheading DESCRIPTION:
 
@subheading NOTES:
 
@page
@ifinfo
@node clock_getres, sleep, clock_settime, Clock Manager Directives
@end ifinfo
@subsection clock_getres
 
@subheading CALLING SEQUENCE:
 
@example
#include <time.h>
 
int clock_getres(
  clockid_t        clock_id,
  struct timespec *res
);
@end example
 
@subheading STATUS CODES:
 
On error, this routine returns -1 and sets errno to one of the following:

@table @b
@item EINVAL
The res pointer parameter is invalid. 

@item EINVAL
The clock_id specified is invalid.

@end table
 
@subheading DESCRIPTION:
 
@subheading NOTES:
 
If res is NULL, then the resolution is not returned.

@page
@ifinfo
@node sleep, nanosleep, clock_getres, Clock Manager Directives
@end ifinfo
@subsection sleep
 
@subheading CALLING SEQUENCE:
 
@example
#include <time.h>
 
unsigned int sleep(
  unsigned int seconds
);
@end example
 
@subheading STATUS CODES:

This routine returns the number of unslept seconds.

@subheading DESCRIPTION:
 
@subheading NOTES:

This call is interruptible by a signal.
 
@page
@ifinfo
@node nanosleep, time, sleep, Clock Manager Directives
@end ifinfo
@subsection nanosleep
 
@subheading CALLING SEQUENCE:
 
@example
#include <time.h>
 
int nanosleep(
  const struct timespec *rqtp,
  struct timespec       *rmtp
);
@end example
 
@subheading STATUS CODES:

On error, this routine returns -1 and sets errno to one of the following:

@table @b
@item EINTR
The routine was interrupted by a signal.

@item EAGAIN
The requested sleep period specified negative seconds or nanoseconds.

@item EINVAL
The requested sleep period specified an invalid number for the nanoseconds
field.

@end table
 
@subheading DESCRIPTION:
 
@subheading NOTES:
 
This call is interruptible by a signal.

@page
@ifinfo
@node time, Scheduler Manager, nanosleep, Clock Manager Directives
@end ifinfo
@subsection nanosleep
 
@subheading CALLING SEQUENCE:
 
@example
#include <time.h>
 
int time(
  time_t  *tloc
);
@end example
 
@subheading STATUS CODES:

This routine returns the number of seconds since the Epoch.

@subheading DESCRIPTION:
 
@subheading NOTES:
 
