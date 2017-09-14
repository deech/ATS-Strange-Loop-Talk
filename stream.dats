(*
** For ATS2TUTORIAL
*)

(* ****** ****** *)
#include "share/atspre_staload.hats"
#include "prelude/DATS/pointer.dats"
#include "prelude/DATS/list.dats"
#include "prelude/DATS/list.dats"
(* ****** ****** *)

fun from(n: int): stream_vt(int) = $ldelay(stream_vt_cons(n, from(n+1)))

fun sieve (ns: stream_vt(int)) : stream_vt(int) =
  $ldelay
  (
    let val ns_con = !ns
        val- @stream_vt_cons(n0, ns1) = ns_con
        val n0_val = n0
        val ns1_val = ns1
        val ((*void*)) = (ns1 := sieve(stream_vt_filter_cloptr<int>(ns1_val, lam x => x mod n0_val > 0)))
        prval () = fold@(ns_con)
    in ns_con
    end
    ,
    ~ns // [ns] is freed
  )

val thePrimes = sieve(from(2))

(* ****** ****** *)
val p10000 = (stream_vt_drop_exn(thePrimes, 10000)).head()
(* ****** ****** *)

val () = println! ("p10000 = ", p10000)

extern fun{env:t@ype} for_loop3blah(count: int, env: &env >> _): void

fun{env:t@ype} for_loop3 (count: int, limit: int, env: &env >> _) : void =
 (
   if count < limit
   then (
    for_loop3blah<env>(count, env); for_loop3<env>(count+1, limit, env)
   )
   else ()
 )

fun tally4 (n: int) : int =
  let var res: int = 0
  implement for_loop3blah<int> (i, res) = res := res + i
  in
    for_loop3<int> (0, n, res); res
  end

val N = 100
val () = println! ("tally4(", N, ") = ", tally4(N))

datatype list0 (a:t@ype) =
  | list0_nil (a) of ()
  | list0_cons (a) of (a, list0 a)

datatype option0 (a:t@ype) =
  | option0_none (a) of ()
  | option0_some (a) of a

fun{a:t@ype} list0_last (xs: list0 a) : option0 (a) =
  let fun loop (x: a, xs: list0 a): a =
    (
      case+ xs of
      | list0_nil () => x
      | list0_cons (x, xs) => loop (x, xs)
    )
  in
    case+ xs of
    | list0_nil () => option0_none((*void*))
    | list0_cons (x, xs) => option0_some(loop (x, xs))
  end

extern fun {a:t0p} my_list_append2_vt {i,j:nat} (xs: list(a, i), ys: list_vt(a, j)) :<!wrt> list_vt(a, i+j)

implement
{a}
my_list_append2_vt
  {m,n} (xs, ys) = let
    prval _ = lemma_list_vt_param (ys)
    fun loop {m:nat} .<m>. (
        xs: list(a, m)
      , ys: list_vt(a, n)
      , res: &ptr? >> list_vt(a, m+n)
      ) :<!wrt> void =
        case+ xs of
        | list_nil () => (res := ys)
        | list_cons (x, xs) =>
          let
            val () = res :=
              list_vt_cons{a}{0}(x, _(*?*))
            val+list_vt_cons
              (_, res1) = res // res1 = res.1
            val () = loop(xs, ys, res1)
            prval _ = fold@ (res)
          in
          end
    var res: ptr
    val () = loop(xs, ys, res)
  in
    res
  end

fun{a:t0ype} list_append (l1 : list0 a, l2 : list0 a) : list0 a =
  case+ (l1, l2) of
    | (list0_cons (x,xs) , l2) => list0_cons(x, list_append(xs, l2))
    | (list0_nil , l2) => l2

val l1 = list0_cons(3, list0_cons(4, list0_nil))

val l2 = list0_cons(1, list0_cons(2, list0_nil))

fun {a : t0ype} print_option(o : option0 (a)) : void =
  case+ o of
    | option0_some (a) => fprint! (a)
    | option0_none     => fprint! ("none")

vtypedef cloptr(a:t@ype, b:t@ype, l:addr) =
  [env:t@ype] (((&env, a) -> b, env) @ l | ptr l)

fun
  {a:t@ype}{b:t@ype}{l:addr}
  cloptr_app (pclo: !cloptr (a, b, l), x: a) : b =
  let
    val p = pclo.1
    val res = !p.0 (!p.1, x)
  in
    res
  end


fun bar(): List0 double (* (g0float_t0ype (double_kind)) *) =
  let
    val l1 = list_nil ()
    val l2 = list_cons (1.0,l1)
    val l3 = list_cons (5.0,l2)
  in l3 end

(* ****** ****** *)
implement main0 () = {}
(* ****** ****** *)
