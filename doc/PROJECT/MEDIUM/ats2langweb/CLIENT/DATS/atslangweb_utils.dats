(*
//
// Utilities
// for atslangweb
//
*)
(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Start time: September, 2014
//
(* ****** ****** *)
//
#define
ATS_DYNLOADFLAG 0
//
(* ****** ****** *)

#define
ATS_EXTERN_PREFIX "atslangweb_"
#define
ATS_STATIC_PREFIX "atslangweb_"

(* ****** ****** *)
//
#define
LIBATSCC2JS_targetloc
"$PATSHOME\
/contrib/libatscc2js/ATS2-0.3.2"
//
(* ****** ****** *)
//
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//
#staload "./../SATS/atslangweb.sats"
//
(* ****** ****** *)
//
#staload _(*anon*) = "./patsopt_tcats.dats"
#staload _(*anon*) = "./patsopt_atscc2js.dats"
//
(* ****** ****** *)
//
extern
fun
Home_whatisnew_onclick(): void = "mac#"
//
%{^
//
function
Home_whatisnew_onclick
  ()
{
window.open
(
  "./Community.html", "_blank"
) // end of [window.open]
} // end of [Home_whatisnew_onclick]
//
%} // end of [%{^]
//
(* ****** ****** *)
//
extern
fun
Home_tryatsnow_onclick(): void = "mac#"
//
%{^
//
function
Home_tryatsnow_onclick
  ()
{
window.open
(
  "./SERVER/MYCODE/Patsoptaas_serve.php?mycode_fil=hello", "_blank"
) // end of [window.open]
} // end of [Home_tryatsnow_onclick]
//
%} // end of [%{^]
//
(* ****** ****** *)
//
extern
fun
Home_hello_getval
  ((*void*)): string = "mac#"
extern
fun
Home_hello_button_set
  (name: string): void = "mac#"
extern
fun
Home_hello_reply
  (reply: string): void = "mac#"
//
extern
fun
Home_hello_onclick(): void = "mac#"
//
%{^
//
function
Home_hello_getval()
{
  return document.getElementById("hello_dats").value;
}
function
Home_hello_button_set(name)
{
  return document.getElementById("hello_button").innerHTML = name;
}
//
function
Home_hello_reply(reply)
{
  var comparr =
    JSON.parse(decodeURIComponent(reply));
  // end of [var]
  if (comparr[0]===0) eval(comparr[1]);
  if (comparr[0] > 0) alert("Compilation failed!");
  Home_hello_button_set("Try-it-yourself"); // HX: change it back!
  return; // end of [Home_hello_reply]
}
//
%} // end of [%{^]
//
implement
Home_hello_onclick() = let
//
implement
patsopt_atscc2js_rpc$cname<>
(
// argumentless
) =
(
"SERVER/MYCODE/atslangweb_patsopt_atscc2js_1_.php"
) (* patsopt_atscc2js_rpc$cname<> *)
//
implement
patsopt_atscc2js_rpc$reply<>
  (reply) = Home_hello_reply(reply)
//
val mycode =
  Home_hello_getval()
val ((*void*)) =
  Home_hello_button_set("Wait...")
//
val ((*void*)) = patsopt_atscc2js_rpc(mycode)
//
in
  // nothing
end (* end of [Home_hello_onclick] *)
//
(* ****** ****** *)
//
extern
fun
Home_listsub_getval
  ((*void*)): string = "mac#"
extern
fun
Home_listsub_button_set
  (name: string): void = "mac#"
//
extern
fun
Home_listsub_reply
  (reply: string): void = "mac#"
//
extern
fun
Home_listsub_onclick(): void = "mac#"
//
%{^
//
function
Home_listsub_getval()
{
  return document.getElementById("listsub_dats").value;
}
//
function
Home_listsub_button_set(name)
{
  return document.getElementById("listsub_button").innerHTML = name;
}
//
function
Home_listsub_reply(reply)
{
  var comparr =
    JSON.parse(decodeURIComponent(reply));
  // end of [var]
  if (comparr[0]===0) alert("Typechecking passed!");
  if (comparr[0] > 0) alert("Typechecking failed!");
  Home_listsub_button_set("Try-it-yourself"); // HX: change it back!
  return/*void*/;
}
//
%} // end of [%{^]
//
implement
Home_listsub_onclick() = let
//
implement
patsopt_tcats_rpc$cname<> () =
  "SERVER/MYCODE/atslangweb_patsopt_tcats_1_.php"
//
implement
patsopt_tcats_rpc$reply<> (reply) = Home_listsub_reply (reply)
//
val mycode = Home_listsub_getval()
val ((*void*)) = Home_listsub_button_set("Wait...")
val ((*void*)) = patsopt_tcats_rpc(mycode)
//
in
  // nothing
end (* end of [Home_listsub_onclick] *)
//
(* ****** ****** *)
//
extern
fun
Home_repeat_f0f1_getval
  ((*void*)): string = "mac#"
extern
fun
Home_repeat_f0f1_button_set
  (name: string): void = "mac#"
//
extern
fun
Home_repeat_f0f1_reply
  (reply: string): void = "mac#"
//
extern
fun
Home_repeat_f0f1_onclick(): void = "mac#"
//
%{^
//
function
Home_repeat_f0f1_getval()
{
  return document.getElementById("repeat_f0f1_dats").value;
}
//
function
Home_repeat_f0f1_button_set(name)
{
  return document.getElementById("repeat_f0f1_button").innerHTML = name;
}
//
function
Home_repeat_f0f1_reply(reply)
{
  var comparr =
    JSON.parse(decodeURIComponent(reply));
  // end of [var]
  if (comparr[0]===0) eval(comparr[1]);
  if (comparr[0] > 0) alert("Compilation failed!");
  Home_repeat_f0f1_button_set("Try-it-yourself"); // HX: change it back!
  return/*void*/;
}
//
%} // end of [%{^]
//
implement
Home_repeat_f0f1_onclick
  ((*void*)) = let
//
implement
patsopt_atscc2js_rpc$cname<>
(
// argumentless
) =
(
  "SERVER/MYCODE/atslangweb_patsopt_atscc2js_1_.php"
) (* patsopt_atscc2js_rpc$cname<> *)
//
implement
patsopt_atscc2js_rpc$reply<>
  (reply) = Home_repeat_f0f1_reply(reply)
//
val mycode =
  Home_repeat_f0f1_getval()
val ((*void*)) =
  Home_repeat_f0f1_button_set("Wait...")
//
val ((*void*)) = patsopt_atscc2js_rpc(mycode)
//
in
  // nothing
end (* end of [Home_repeat_f0f1_onclick] *)
//
(* ****** ****** *)
//
extern
fun
Home_queenpuzzle_getval
  ((*void*)): string = "mac#"
extern
fun
Home_queenpuzzle_button_set
  (name: string): void = "mac#"
//
extern
fun
Home_queenpuzzle_reply
  (reply: string): void = "mac#"
//
extern
fun
Home_queenpuzzle_onclick(): void = "mac#"
//
%{^
//
function
Home_queenpuzzle_getval()
{
  return document.getElementById("queenpuzzle_dats").value;
}
//
function
Home_queenpuzzle_button_set(name)
{
  return document.getElementById("queenpuzzle_button").innerHTML = name;
}
//
function
Home_queenpuzzle_reply(reply)
{
  var
  comparr =
  JSON.parse(decodeURIComponent(reply));
  if (comparr[0]===0) eval( comparr[1] );
  if (comparr[0] > 0) alert("Compilation failed!");
  Home_queenpuzzle_button_set( "Try-it-yourself" ); // HX: change it back!
  return/*void*/;
}
//
%} // end of [%{^]
//
implement
Home_queenpuzzle_onclick
  ((*void*)) = let
//
implement
patsopt_atscc2js_rpc$cname<>
(
// argumentless
) =
(
  "SERVER/MYCODE/atslangweb_patsopt_atscc2js_1_.php"
) (* patsopt_atscc2js_rpc$cname<> *)
//
implement
patsopt_atscc2js_rpc$reply<>
  (reply) = Home_queenpuzzle_reply(reply)
//
val mycode =
  Home_queenpuzzle_getval()
val ((*void*)) =
  Home_queenpuzzle_button_set("Wait...")
//
val ((*void*)) = patsopt_atscc2js_rpc(mycode)
//
in
  // nothing
end (* end of [Home_queenpuzzle_onclick] *)
//
(* ****** ****** *)

(* end of [atslangweb_utils.dats] *)
