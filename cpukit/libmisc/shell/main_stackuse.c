/*
 *  stackuse Command Implementation
 *
 *  COPYRIGHT (c) 1989-2007.
 *  On-Line Applications Research Corporation (OAR).
 *
 *  The license and distribution terms for this file may be
 *  found in the file LICENSE in this distribution or at
 *  http://www.rtems.com/license/LICENSE.
 *
 *  $Id$
 */

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <stdio.h>

#include <rtems.h>
#include <rtems/stackchk.h>
#include <rtems/shell.h>
#include "internal.h"

int rtems_shell_main_stackuse(
  int   argc,
  char *argv[]
)
{
  rtems_stack_checker_report_usage_with_plugin(
    stdout,
    (rtems_printk_plugin_t)fprintf
  );
  return 0;
}

rtems_shell_cmd_t rtems_shell_STACKUSE_Command = {
  "stackuse",                                 /* name */
  "print per thread stack usage",             /* usage */
  "rtems",                                    /* topic */
  rtems_shell_main_stackuse,                  /* command */
  NULL,                                       /* alias */
  NULL                                        /* next */
};
