(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

#define :: list0_cons

(* ****** ****** *)

#include "./../../MYLIB/mylib.dats"

(* ****** ****** *)

implement
fprint_val<int> = fprint_int
implement
fprint_val<bool> = fprint_bool
implement
fprint_val<string> = fprint_string

(* ****** ****** *)
//
fun
int_stream_from
  (n: int): stream(int) =
  $delay(stream_cons(n, int_stream_from(n+1)))
//
(* ****** ****** *)
//
fun
{a:t@ype}
stream_get_at
  (xs: stream(a), n: int): a =
(
case+ !xs of
| stream_nil() =>
  (
    $raise StreamSubscriptExn()
  )
| stream_cons(x, xs) =>
  (
    if n <= 0 then x else stream_get_at<a>(xs, n-1)
  )
)
//
(* ****** ****** *)

val xs = int_stream_from(0)
val x0 = stream_get_at<int>(xs, 1000000)
val () = println! ("x0 = ", x0)

(* ****** ****** *)
//
fun
{a:t@ype}
stream_length
  (xs: stream(a)): int =
(
case+ !xs of
| stream_nil() => 0
| stream_cons(_, xs) => stream_length<a>(xs) + 1
)
//
(* ****** ****** *)
//
val
theNats =
int_stream_from(0)
//
val
theNats10 =
stream_takeLte(theNats, 10)
//
(* ****** ****** *)
//
val () =
println!
("theNats10 = ", stream_vt_length(theNats10))
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
stream_append
(xs: stream(a), ys: stream(a)): stream(a)
//
implement
{a}(*tmp*)
stream_append
(xs, ys) = $delay
(
case+ !xs of
| stream_nil() => !ys
| stream_cons(x, xs) =>
  stream_cons(x, stream_append<a>(xs, ys))
)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
{b:t@ype}
stream_map
(xs: stream(a), fopr: cfun(a, b)): stream(b)
//
implement
{a}{b}
stream_map
  (xs, fopr) = $delay
(
case+ !xs of
| stream_nil() =>
  stream_nil()
| stream_cons(x, xs) =>
  stream_cons(fopr(x), stream_map<a><b>(xs, fopr))
)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
stream_filter
(xs: stream(a), test: cfun(a, bool)): stream(a)
//
implement
{a}(*tmp*)
stream_filter
  (xs, test) = $delay
(
case+ !xs of
| stream_nil() =>
  stream_nil()
| stream_cons(x, xs) =>
  if test(x)
    then
    stream_cons
      (x, stream_filter<a>(xs, test))
    // end of [then]
    else !(stream_filter<a>(xs, test))
  // end of [if]
)
//
(* ****** ****** *)

fun
sieve(): stream(int) = let
//
fun
auxmain
(
xs: stream(int)
) : stream(int) = $delay
(
case- !xs of
| stream_cons(x0, xs) =>
  stream_cons(x0, auxmain(stream_filter(xs, lam(x) => x % x0 > 0)))
)
//
in
  auxmain(int_stream_from(2))
end // end of [sieve]

(* ****** ****** *)
//
#define N 100
exception Done of ()
//
val
thePrimes = sieve()
val ((*void*)) =
try
thePrimes.iforeach()
(lam(i, x) => if i < N then println!("Prime(", i, ") = ", x) else $raise Done())
with ~Done() => ()
//
(* ****** ****** *)

implement main0() = () // a dummy for [main]

(* ****** ****** *)

(* end of [lecture10.dats] *)
