/*
 *  read() - POSIX 1003.1b 6.4.1 - Read From a File
 *
 *  COPYRIGHT (c) 1989-1998.
 *  On-Line Applications Research Corporation (OAR).
 *  Copyright assigned to U.S. Government, 1994.
 *
 *  The license and distribution terms for this file may be
 *  found in the file LICENSE in this distribution or at
 *  http://www.OARcorp.com/rtems/license.html.
 *
 *  $Id$
 */

#include "libio_.h"

ssize_t read(
  int         fd,
  void       *buffer,
  size_t      count
)
{
  int             rc;  /* XXX change to a size_t when prototype is fixed */
  rtems_libio_t *iop;

  rtems_libio_check_fd( fd );
  iop = rtems_libio_iop( fd );
  rtems_libio_check_buffer( buffer );
  rtems_libio_check_count( count );
  rtems_libio_check_permissions( iop, LIBIO_FLAGS_READ );

  /*
   *  If this file descriptor is mapped to an external set of handlers,
   *  then pass the request on to them.
   */ 

  if ( iop->flags & LIBIO_FLAGS_HANDLER_MASK ) {
    rtems_libio_read_t fp;

    fp = rtems_libio_handlers[
           (iop->flags >> LIBIO_FLAGS_HANDLER_SHIFT) - 1].read;
    if ( fp == NULL )
      set_errno_and_return_minus_one( EBADF );

    return (*fp)( fd, buffer, count );
  }

  /*
   *  Now process the read().
   */

  if ( !iop->handlers->read )
    set_errno_and_return_minus_one( ENOTSUP );

  rc = (*iop->handlers->read)( iop, buffer, count );

  if ( rc > 0 )
    iop->offset += rc;

  return rc;
}

/*
 *  _read_r
 *
 *  This is the Newlib dependent reentrant version of read().
 */

#if defined(RTEMS_NEWLIB)

#include <reent.h>

_ssize_t _read_r(
  struct _reent *ptr,
  int            fd,
  void          *buf,
  size_t         nbytes
)
{
  return read( fd, buf, nbytes );
}
#endif
