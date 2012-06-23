(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2012 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author of the file: Hongwei Xi (hwxi AT cs DOT bu DOT edu)
// Start Time: June, 2012
//
(* ****** ****** *)

typedef cfun0
  (b:t0p) = ((*void*)) -<cloref1> b
typedef cfun1
  (a:t0p, b:t0p) = (a) -<cloref1> b
typedef cfun2
  (a1:t0p, a2:t0p, b:t0p) = (a1, a2) -<cloref1> b
typedef cfun3 (
  a1:t0p, a2:t0p, a3:t0p, b:t0p
) = (a1, a2, a3) -<cloref1> b
typedef cfun4 (
  a1:t0p, a2:t0p, a3:t0p, a4:t0p, b:t0p
) = (a1, a2, a3, a4) -<cloref1> b
typedef cfun5 (
  a1:t0p, a2:t0p, a3:t0p, a4:t0p, a5:t0p, b:t0p
) = (a1, a2, a3, a4, a5) -<cloref1> b
typedef cfun6 (
  a1:t0p, a2:t0p, a3:t0p, a4:t0p, a5:t0p, a6:t0p, b:t0p
) = (a1, a2, a3, a4, a5, a6) -<cloref1> b
typedef cfun7 (
  a1:t0p, a2:t0p, a3:t0p, a4:t0p, a5:t0p, a6:t0p, a7:t0p, b:t0p
) = (a1, a2, a3, a4, a5, a6, a7) -<cloref1> b
typedef cfun8 (
  a1:t0p, a2:t0p, a3:t0p, a4:t0p, a5:t0p, a6:t0p, a7:t0p, a8:t0p, b:t0p
) = (a1, a2, a3, a4, a5, a6, a7, a8) -<cloref1> b
typedef cfun9 (
  a1:t0p, a2:t0p, a3:t0p, a4:t0p, a5:t0p, a6:t0p, a7:t0p, a8:t0p, a9:t0p, b:t0p
) = (a1, a2, a3, a4, a5, a6, a7, a8, a9) -<cloref1> b

(* ****** ****** *)

stadef cfun = cfun1 // HX: the default for [cfun]

(* ****** ****** *)

datatype // t@ype+: covariant
list0_t0ype_type (a: t@ype+) =
  | list0_cons of (a, list0_t0ype_type a)
  | list0_nil of ()
stadef list0 = list0_t0ype_type

(* ****** ****** *)

datatype // t@ype+: covariant
option0_t0ype_type
  (a: t@ype+) = Some0 of (a) | None0 of ()
stadef option0 = option0_t0ype_type

(* ****** ****** *)

(* end of [basics.sats] *)
