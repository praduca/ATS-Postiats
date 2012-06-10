(*
**
** Some utility functions
** for manipulating the syntax of ATS2
**
** Contributed by Hongwei Xi (gmhwxi AT gmail DOT com)
**
** Start Time: June, 2012
**
*)

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"
staload _(*anon*) = "prelude/DATS/pointer.dats"

(* ****** ****** *)

staload STDIO = "libc/SATS/stdio.sats"

(* ****** ****** *)

staload "libatsyntax/SATS/libatsyntax.sats"

(* ****** ****** *)

staload
LOC = "src/pats_location.sats"
assume location = $LOC.location

implement
fprint_location
  (out, x) = $LOC.fprint_location (out, x)
// end of [fprint_location]

(* ****** ****** *)

staload
LEX = "src/pats_lexing.sats"
assume token = $LEX.token // ...

(* ****** ****** *)

implement
token_get_loc (x) = x.token_loc

local

staload "src/pats_lexing.sats"

in // in of [local]

(* ****** ****** *)

implement
token_is_eof (x) =
  case+ x.token_node of
  | T_EOF () => true | _ => false
// end of [token_is_eof]

(* ****** ****** *)

implement
token_is_comment (x) =
  case+ x.token_node of
  | T_COMMENT_line () => true
  | T_COMMENT_block () => true
  | T_COMMENT_rest () => true
  | _ => false
// end of [token_is_comment]

implement
token_is_extcode (x) =
  case+ x.token_node of
  | T_EXTCODE (_) => true | _ => false
// end of [token_is_extcode]

(* ****** ****** *)

implement
token_is_keyword (x) = let
in
//
case+
  x.token_node of
//
(*
| T_AT () => true
//
| T_BACKSLASH () => true
| T_BANG () => true
| T_BAR () => true
| T_BQUOTE () => true
//
| T_COLON () => true
| T_COLONLT () => true
//
| T_DOLLAR () => true
//
| T_DOT () => true
| T_DOTDOT () => true
| T_DOTDOTDOT () => true
//
| T_DOTINT (_) => true
//
| T_EQ () => true
| T_EQGT () => true
| T_EQLT () => true
| T_EQLTGT () => true
| T_EQSLASHEQGT () => true
| T_EQGTGT () => true
| T_EQSLASHEQGTGT () => true
//
| T_HASH () => true
//
| T_LT () => true
| T_GT () => true
//
| T_GTLT () => true
| T_DOTLT () => true
| T_GTDOT () => true
| T_DOTLTGTDOT () => true
//
| T_MINUSGT () => true
| T_MINUSLT () => true
| T_MINUSLTGT () => true
//
| T_TILDE () => true
//
| T_ABSTYPE _ => true
| T_AND () => true
| T_AS () => true
| T_ASSUME () => true
| T_BEGIN () => true
| T_BRKCONT (_) => true
| T_CASE _ => true
| T_CLASSDEC () => true
| T_DATASORT () => true
| T_DATATYPE (_) => true
| T_DO () => true
| T_DYNLOAD () => true
| T_ELSE () => true
| T_END () => true
| T_EXCEPTION () => true
| T_EXTERN () => true
| T_EXTYPE () => true
| T_EXTVAL () => true
| T_FIX (_) => true
| T_FIXITY (_) => true
| T_FOR (_) => true
| T_FUN (_) => true
| T_IF () => true
| T_IMPLEMENT () => true
| T_IN () => true
| T_LAM (_) => true
| T_LET () => true
| T_LOCAL () => true
| T_MACDEF (_) => true
| T_NONFIX () => true
| T_OVERLOAD () => true
| T_OF () => true
| T_OP () => true
| T_REC () => true
| T_REFAT () => true
| T_SCASE () => true
| T_SIF () => true
| T_SORTDEF () => true
| T_STACST () => true
| T_STADEF () => true
| T_STALOAD () => true
| T_SYMELIM () => true
| T_SYMINTR () => true
| T_THEN () => true
| T_TKINDEF () => true
| T_TRY () => true
| T_TYPE (_) => true
| T_TYPEDEF (_) => true
| T_VAL (_) => true
| T_VAR () => true
| T_WHEN () => true
| T_WHERE () => true
| T_WHILE (_) => true
| T_WITH () => true
| T_WITHTYPE (_) => true
//
| T_ADDRAT () => true
| T_FOLDAT () => true
| T_FREEAT () => true
| T_VIEWAT () => true
//
| T_DLRARRSZ () => true
| T_DLRDYNLOAD () => true
| T_DLRDELAY (_) => true
| T_DLREFFMASK () => true
| T_DLREFFMASK_ARG (_) => true
| T_DLREXTERN () => true
| T_DLREXTKIND () => true
| T_DLREXTYPE () => true
| T_DLREXTYPE_STRUCT () => true
| T_DLREXTVAL () => true
| T_DLRRAISE () => true
| T_DLRLST (_) => true
| T_DLRREC (_) => true
| T_DLRTUP (_) => true
//
| T_SRPASSERT () => true
| T_SRPDEFINE () => true
| T_SRPELIF () => true
| T_SRPELIFDEF () => true
| T_SRPELIFNDEF () => true
| T_SRPELSE () => true
| T_SRPENDIF () => true
| T_SRPERROR () => true
| T_SRPIF () => true
| T_SRPIFDEF () => true
| T_SRPIFNDEF () => true
| T_SRPINCLUDE () => true
| T_SRPPRINT () => true
| T_SRPTHEN () => true
| T_SRPUNDEF () => true
//
| T_SRPFILENAME () => true
| T_SRPLOCATION () => true
//
| T_LPAREN () => true
| T_RPAREN () => true
| T_LBRACKET () => true
| T_RBRACKET () => true
| T_LBRACE () => true
| T_RBRACE () => true
//
| T_COMMA () => true
| T_SEMICOLON () => true
//
| T_ATLPAREN () => true
| T_QUOTELPAREN () => true
| T_ATLBRACKET () => true
| T_QUOTELBRACKET () => true
| T_HASHLBRACKET () => true
| T_ATLBRACE () => true
| T_QUOTELBRACE () => true
//
| T_BQUOTELPAREN () => true
| T_COMMALPAREN () => true
| T_PERCENTLPAREN () => true
//
*)
//
| T_NONE () => false
//
| T_IDENT_alp (_) => false
| T_IDENT_sym (_) => false
| T_IDENT_arr (_) => false
| T_IDENT_tmp (_) => false
| T_IDENT_dlr (_) => false
| T_IDENT_srp (_) => false
| T_IDENT_ext (_) => false
//
| T_CHAR (_) => false
| T_INTEGER _ => false
| T_FLOAT _ => false
| T_STRING (_) => false
//
| T_EXTCODE (_) => false
//
| T_COMMENT_line () => false
| T_COMMENT_block () => false
| T_COMMENT_rest () => false
//
| T_ERR () => false
//
| T_EOF () => false
//
| _ => true
//
end // end of [token_is_keyword]

(* ****** ****** *)

implement
token_is_char (x) =
  case+ x.token_node of
  | T_CHAR (_) => true | _ => false
// end of [token_is_char]
implement
token_is_float (x) =
  case+ x.token_node of
  | T_FLOAT _ => true | _ => false
// end of [token_is_float]
implement
token_is_integer (x) =
  case+ x.token_node of
  | T_INTEGER _ => true | _ => false
// end of [token_is_integer]
implement
token_is_string (x) =
  case+ x.token_node of
  | T_STRING (_) => true | _ => false
// end of [token_is_string]

end // end of [local]

(* ****** ****** *)

implement
fprint_token
  (out, x) = $LEX.fprint_token (out, x)
// end of [fprint_token]

(* ****** ****** *)

staload
LBF = "src/pats_lexbuf.sats"
stadef lexbuf = $LBF.lexbuf

(* ****** ****** *)

implement
lexbufobj_make_fileref
  (inp) = let
  val [l:addr]
    (pfgc, pfat | p) = ptr_alloc<lexbuf> ()
  val getc = lam () =<cloptr1> $STDIO.fgetc0_err (inp)
  val () = $LBF.lexbuf_initialize_getc (!p, getc)
  extern castfn __cast
    (pf1: free_gc_v (lexbuf?, l), pf2: lexbuf @ l | p: ptr l): lexbufobj
  // end of [extern]
in
  __cast (pfgc, pfat | p)
end // end of [lexbufobj_make_fileref]

(* ****** ****** *)

implement
lexbufobj_make_charlst_vt
  (inp) = let
  val [l:addr]
    (pfgc, pfat | p) = ptr_alloc<lexbuf> ()
  val () = $LBF.lexbuf_initialize_charlst_vt (!p, inp)
  extern castfn __cast
    (pf1: free_gc_v (lexbuf?, l), pf2: lexbuf @ l | p: ptr l): lexbufobj
  // end of [extern]
in
  __cast (pfgc, pfat | p)
end // end of [lexbufobj_make_charlst_vt]

(* ****** ****** *)

implement
lexbufobj_free (lbf) = let
  extern castfn __cast (lbf: lexbufobj)
    : [l:addr] (free_gc_v (lexbuf?, l), lexbuf @ l | ptr l)
  val (pfgc, pfat | p) = __cast (lbf)
  val () = $LBF.lexbuf_uninitialize (!p)
in
  ptr_free (pfgc, pfat | p)
end // end of [lexbufobj_free]

implement
lexbufobj_get_tokenlst
  (lbf) = let
//
viewtypedef res = tokenlst_vt
viewtypedef lexbuf = $LEX.lexbuf
//
fun loop (
  buf: &lexbuf, res: &res? >> res
) : void = let
  val tok = $LEX.lexing_next_token (buf)
  val iseof = token_is_eof (tok)
in
  if iseof then
    res := list_vt_nil ()
  else let
    val () = res :=
      list_vt_cons {token}{0} (tok, ?)
    val+ list_vt_cons (_, !p_res1) = res
    val () = loop (buf, !p_res1)
    prval () = fold@ (res)
  in
    // nothing
  end // end of [if]
end (* end of [loop] *)
//
var res: res
val (pf, fpf | p) =
  __cast (lbf) where {
  extern castfn __cast (lbf: !lexbufobj)
    : [l:addr] (lexbuf @ l, lexbuf @ l -<lin,prf> void | ptr l)
} // end of [val]
val () = loop (!p, res)
prval () = fpf (pf)
//
in
  res
end // end of [lexbuf_get_tokenlst]

(* ****** ****** *)

staload
TBF = "src/pats_tokbuf.sats"
stadef tokbuf = $TBF.tokbuf

implement
tokbufobj_make_lexbufobj
  (lbf) = let
  val (pfgc1, pfat1 | p1) = let
    extern castfn __cast (lbf: lexbufobj)
    : [l:addr] (free_gc_v (lexbuf?, l), lexbuf @ l | ptr l)
  in
    __cast (lbf)
  end // end of [val]
  val [l2:addr] (pfgc2, pfat2 | p2) = ptr_alloc<tokbuf> ()
  val () = $TBF.tokbuf_initialize_lexbuf (!p2, !p1)
  val () = ptr_free (pfgc1, pfat1 | p1)
  extern castfn __cast
    (pf1: free_gc_v (tokbuf?, l2), pf2: tokbuf @ l2 | p: ptr l2): tokbufobj
  // end of [extern]
in
  __cast (pfgc2, pfat2 | p2)
end // end of [tokbufobj_make_lexbufobj]

(* ****** ****** *)

implement
tokbufobj_free (tbf) = let
  extern castfn __cast (tbf: tokbufobj)
    : [l:addr] (free_gc_v (tokbuf?, l), tokbuf @ l | ptr l)
  val (pfgc, pfat | p) = __cast (tbf)
  val () = $TBF.tokbuf_uninitialize (!p)
in
  ptr_free (pfgc, pfat | p)
end // end of [tokbufobj_free]

(* ****** ****** *)

implement
tokbufobj_unget_token
  (tbf, tok) = let
//
val (pf, fpf | p) =
  __cast (tbf) where {
  extern castfn __cast (tbf: !tokbufobj)
    : [l:addr] (tokbuf @ l, tokbuf @ l -<lin,prf> void | ptr l)
} // end of [val]
val () = $TBF.tokbuf_unget_token (!p, tok)
prval () = fpf (pf)
//
in
  // nothing
end // end of [tokbufobj_unget_token]

(* ****** ****** *)

(* end of [libatsyntax_token.dats] *)
