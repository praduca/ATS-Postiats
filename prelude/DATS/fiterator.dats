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
// Author: Hongwei Xi (hwxi AT cs DOT bu DOT edu)
// Start Time: February, 2012
//
(* ****** ****** *)

#include "prelude/params.hats"

(* ****** ****** *)

#if VERBOSE_PRELUDE #then
#print "Loading [fcontainer.dats] starts!\n"
#endif // end of [VERBOSE_PRELUDE]

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

implement
{xs}{x}
iter_foreach_funenv
  {v}{vt}{f,r}{fe}
  (pfv | itr, fwork, env) = let
//
prval () = lemma_iterator_param (itr)
//
stadef iter
  (f:int, r:int) = fiterator (xs, x, f, r)
//
fun loop
  {f,r:int | r >= 0} .<r>. (
  pfv: !v
| itr: !iter (f, r) >> iter (f+r, 0)
, fwork: (!v | x, !vt) -<fun,fe> void, env: !vt
) :<fe> void =
  if iter_isnot_atend<xs><x> (itr) then let
    val x = iter_getinc<xs><x> (itr); val () = fwork (pfv | x, env)
  in
    loop (pfv | itr, fwork, env)
  end // end of [if]
// end of [loop]
//
in
  loop (pfv | itr, fwork, env)
end // end of [iter_foreach_funenv]

(* ****** ****** *)

implement
{xs}{x}
iter_exists_funenv
  {v}{vt}{f,r}{fe}
  (pfv | itr, pred, env) = let
//
prval () = lemma_iterator_param (itr)
//
stadef iter
  (f:int, r:int) = fiterator (xs, x, f, r)
//
fun loop
  {f,r:int | r >= 0} .<r>. (
  pfv: !v
| itr: !iter (f, r) >> iter (f1, r1)
, pred: (!v | x, !vt) -<fun,fe> bool, env: !vt
) :<fe> #[
  f1,r1:int | f1>=f; f+r==f1+r1
] bool (r1 > 0)= let
  val hasnext = iter_isnot_atend<xs><x> (itr)
in
  if hasnext then let
    val x = iter_get<xs><x> (itr)
  in
    if pred (pfv | x, env) then true else let
      val () = iter_inc (itr) in loop (pfv | itr, pred, env)
    end // end of [if]
  end else false // end of [if]
end // end of [loop]
//
in
  loop (pfv | itr, pred, env)
end // end of [iter_exists_funenv]

(* ****** ****** *)

(*
fun{
xs:t0p}{x:t0p
} iter_bsearch_funenv
  {env:vtp}{f,r:int} (
  iter: !fiterator (xs, x, f, r)
          >> fiterator (xs, x, f1, r1)
, r: size_t r
, cmp: (x, x, !env) -<fun> int, env: !env
) :<> #[
  f1,r1:int | f1>=f;f1+r1==f+r
] bool(*found*) // end of [iter_bsearch_funenv]
*)

implement
{xs}{x}
iter_bsearch_funenv
  {env} (
  itr, pord, env, ra
) = let
//
prval () = g1uint_param_lemma (ra)
prval () = lemma_iterator_param (itr)
//
stadef iter
  (f:int, r:int) = fiterator (xs, x, f, r)
//
fun loop
  {f,r:nat}
  {ra:nat | ra <= r} .<ra>. (
  itr: !iter (f, r) >> iter (f1, r1)
, pord: (x, !env) -<fun> int, env: !env
, ra: size_t (ra)
) :<> #[
  f1,r1:int | f1>=f;f+ra>=f1;f+r==f1+r1
] void = (
  if ra > 0 then let
    val ra2 = half (ra)
    val x = iter_fget_at (itr, ra2)
    val sgn = pord (x, env)
  in
    if sgn <= 0 then
      loop (itr, pord, env, ra2)
    else let
      val ra21 = succ(ra2)
      val () = iter_fjmp (itr, ra21)
    in
      loop (itr, pord, env, ra-ra21)
    end // end of [if]
  end else () // end of [if]
) (* end of [loop] *)
//
in
  loop (itr, pord, env, ra)
end // end of [iter_bsearch_funenv]

(* ****** ****** *)

#if VERBOSE_PRELUDE #then
#print "Loading [fcontainer.dats] finishes!\n"
#endif // end of [VERBOSE_PRELUDE]

(* ****** ****** *)

(* end of [fiterator.dats] *)
