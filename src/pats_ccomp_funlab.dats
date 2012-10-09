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
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
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
// Author: Hongwei Xi (hwxi AT cs DOT bu DOT edu)
// Start Time: July, 2012
//
(* ****** ****** *)

staload _(*anon*) = "prelude/DATS/pointer.dats"
staload _(*anon*) = "prelude/DATS/reference.dats"

(* ****** ****** *)

staload
STMP = "pats_stamp.sats"
typedef stamp = $STMP.stamp

(* ****** ****** *)

staload SYM = "pats_symbol.sats"

(* ****** ****** *)

staload "pats_dynexp2.sats"

(* ****** ****** *)

staload "pats_trans2_env.sats"

(* ****** ****** *)

staload "pats_histaexp.sats"

(* ****** ****** *)

staload "pats_ccomp.sats"

(* ****** ****** *)

extern
fun
funlab_make (
  name: string
, level: int
, hse: hisexp
, qopt: d2cstopt
, stamp: stamp
) : funlab // end of [funlab_make]

(* ****** ****** *)

typedef
funlab_struct = @{
  funlab_name= string
, funlab_level= int
, funlab_type= hisexp (* function type *)
, funlab_qopt= d2cstopt (* local or global *)
//
, funlab_entry= funentopt // function entry
, funlab_tailjoin= tmpvarlst // tail-call optimization
//
, funlab_stamp= stamp
} // end of [funlab_struct]

(* ****** ****** *)

local

assume ccomp_funlab_type = ref (funlab_struct)

in // in of [local]

implement
funlab_make (
  name, level, hse, qopt, stamp
) = let
//
val (
  pfgc, pfat | p
) = ptr_alloc<funlab_struct> ()
prval () = free_gc_elim {funlab_struct?} (pfgc)
//
val () = p->funlab_name := name
val () = p->funlab_level := level
val () = p->funlab_type := hse
val () = p->funlab_qopt := qopt
//
val () = p->funlab_entry := None(*funent*)
val () = p->funlab_tailjoin := list_nil(*tmpvarlst*)
//
val () = p->funlab_stamp := stamp
//
in
  ref_make_view_ptr (pfat | p)
end // end of [funlab_make]

(* ****** ****** *)

implement
funlab_get_name (fl) = let
  val (vbox pf | p) = ref_get_view_ptr (fl) in p->funlab_name
end // end of [funlab_get_name]

implement
funlab_get_level (fl) = let
  val (vbox pf | p) = ref_get_view_ptr (fl) in p->funlab_level
end // end of [funlab_get_level]

implement
funlab_get_type (fl) = let
  val (vbox pf | p) = ref_get_view_ptr (fl) in p->funlab_type
end // end of [funlab_get_type]

implement
funlab_get_stamp (fl) = let
  val (vbox pf | p) = ref_get_view_ptr (fl) in p->funlab_stamp
end // end of [funlab_get_stamp]

end // end of [local]

(* ****** ****** *)

implement
funlab_make_type
  (hse) = let
  val lev0 = the_d2varlev_get ()
  val stamp = $STMP.funlab_stamp_make ()
  val flname = $STMP.tostring_prefix_stamp ("__patsfun_", stamp)
in
  funlab_make (flname, lev0, hse, None(*qopt*), stamp)
end // end of [funlab_make_type]

(* ****** ****** *)

implement
funlab_make_dvar_type
  (d2v, hse) = let
  val lev0 = the_d2varlev_get ()
  val d2v2 =
    $SYM.symbol_get_name (d2var_get_sym (d2v))
  // end of [val]
  val stamp = $STMP.funlab_stamp_make ()
  val stamp2 = $STMP.tostring_stamp (stamp)
  val flname = sprintf ("%s_%s", @(d2v2, stamp2))
  val flname = string_of_strptr (flname)
in
  funlab_make (flname, lev0, hse, None(*qopt*), stamp)
end // end of [funlab_make_dvar_type]

(* ****** ****** *)

implement
funlab_make_dcst_type
  (d2c, hse) = let
  val lev0 = the_d2varlev_get ()
  val d2c2 =
    $SYM.symbol_get_name (d2cst_get_sym (d2c))
  // end of [val]
  val stamp = $STMP.funlab_stamp_make ()
  val stamp2 = $STMP.tostring_stamp (stamp)
  val flname = sprintf ("%s_%s", @(d2c2, stamp2))
  val flname = string_of_strptr (flname)
in
  funlab_make (flname, lev0, hse, None(*qopt*), stamp)
end // end of [funlab_make_dcst_type]

(* ****** ****** *)

implement
fprint_funlab
  (out, fl) = let
  val name = funlab_get_name (fl)
in
  fprint_string (out, name)
end // end of [fprint_funlab]

implement
print_funlab (fl) = fprint_funlab (stdout_ref, fl)
implement
prerr_funlab (fl) = fprint_funlab (stderr_ref, fl)

(* ****** ****** *)

(* end of [pats_ccomp_funlab.dats] *)
