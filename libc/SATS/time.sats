(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-20?? Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of the GNU LESSER GENERAL PUBLIC LICENSE as published by the
** Free Software Foundation; either version 2.1, or (at your option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
//
// Author: Hongwei Xi (gmhwxi AT gmail DOT com)
// Start Time: March, 2013
//
(* ****** ****** *)

%{#
#include "libc/CATS/time.cats"
%} // end of [%{#]

(* ****** ****** *)

#define ATS_PACKNAME "ATSLIB.libc"
#define ATS_STALOADFLAG 0 // no need for staloading at run-time
#define ATS_EXTERN_PREFIX "atslib_" // prefix for external names

(* ****** ****** *)

#define NSH (x) x // for commenting: no sharing
#define SHR (x) x // for commenting: it is shared

(* ****** ****** *)

staload
TYPES = "libc/sys/SATS/types.sats"
typedef time_t = $TYPES.time_t

(* ****** ****** *)
//
fun lt_time_time (t1: time_t, t2: time_t):<> bool = "mac#%"
fun lte_time_time (t1: time_t, t2: time_t):<> bool = "mac#%"
overload < with lt_time_time
overload <= with lte_time_time
//
fun gt_time_time (t1: time_t, t2: time_t):<> bool = "mac#%"
fun gte_time_time (t1: time_t, t2: time_t):<> bool = "mac#%"
overload > with gt_time_time
overload >= with gte_time_time
//
fun eq_time_time (t1: time_t, t2: time_t):<> bool = "mac#%"
fun neq_time_time (t1: time_t, t2: time_t):<> bool = "mac#%"
overload = with eq_time_time
overload <> with neq_time_time
overload != with neq_time_time
//
(* ****** ****** *)

fun time2lint (t: time_t):<> lint = "mac#%"
fun time2double (t: time_t):<> double = "mac#%"

fun difftime
  (fi: time_t, st: time_t) :<> double = "mac#%"
// end of [difftime]

(* ****** ****** *)
//
symintr time
//
fun time_get
  ():<> time_t = "mac#%"
fun time_getset
(
  t: &time_t? >> opt (time_t, b)
) :<> #[b:bool] bool (b) = "mac#%"
//
overload time with time_get
overload time with time_getset
//
(* ****** ****** *)

fun ctime // non-reentrant
(
  t: &time_t
) :<!ref> [l:addr] vttakeout0 (strptr l) = "mac#%" // endfun

(* ****** ****** *)
//
#define CTIME_BUFSZ 26
//
dataview
ctime_v (m:int, addr, addr) =
  | {l:addr}
    ctime_v_fail (m, l, null) of b0ytes_v (l, m)
  | {l:agz}
    ctime_v_succ (m, l, l) of strbuf_v (l, m, CTIME_BUFSZ-1)
//
fun ctime_r // reentrant-version
  {l:addr}{m:int | m >= CTIME_BUFSZ}
(
  !b0ytes_v (l, m) >> ctime_v (m, l, l1) | &time_t, ptr (l)
) :<!wrt> #[l1:addr] ptr (l1) = "mac#%" // end of [ctime_r]
//
fun{
} ctime_r_gc (&time_t):<!wrt> Strptr0 // end of [ctime_r_gc]
//
(* ****** ****** *)

typedef
tm_struct =
$extype_struct "atslib_tm_struct_type" of
{
  tm_sec= int // natLt(60)
, tm_min= int // natLt(60)
, tm_hour= int // natLt(24)
, tm_mon= int (* month *) // natLt(12)
, tm_year= int (* year *) // starting from 1900
, tm_wday= int (* day of the week *) // natLt(7)
, tm_mday= int (* day of the month *)
, tm_yday= int (* day in the year *)
, tm_isdst= int (* daylight saving time *) // yes/no: 1/0
} // end of [tm_struct]

(* ****** ****** *)

fun mktime (tm: &tm_struct):<> time_t = "mac#%"

(* ****** ****** *)

fun asctime
(
  tm: &tm_struct
) :<!ref> [l:addr] vttakeout0 (strptr l) = "mac#%"

(* ****** ****** *)

fun gmtime // non-reentrant
(
  tval: &time_t
) :<!ref>
[
  l:addr
] (
  option_v (vtakeout0 (tm_struct@l), l > null) | ptr l
) = "mac#%" // end of [gmtime]

fun gmtime_r // reentrant-version
(
  &time_t
, tm: &tm_struct? >> opt (tm_struct, l > null)
) :<> #[l:addr] ptr (l) = "mac#%" // endfun

(* ****** ****** *)

fun localtime // non-reentrant
(
  tval: &time_t
) :<!ref>
[
  l:addr
] (
  option_v (vtakeout0 (tm_struct@l), l > null) | ptr l
) = "mac#%" // end of [localtime]

fun localtime_r // reentrant-version
(
  &time_t
, tm: &tm_struct? >> opt (tm_struct, l > null)
) :<> #[l:addr] ptr (l) = "mac#%" // endfun

(* ****** ****** *)

(* end of [time.sats] *)
