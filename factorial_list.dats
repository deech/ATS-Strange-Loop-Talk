#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fun factorial
       {n:int | n >= 2}
       (i:int n): list_vt(double, n-1) =
  let
      var res : ptr
      fun loop
            {n1:int | n1 >= 0 && n1 <= n-2}
            (
              seed: double,
              next: int n1,
              res: &ptr? >> list_vt(double, n1+1)
            ) : void =
        case- next of
          | 0 => res := list_vt_cons(seed, list_vt_nil())
          | next when next > 0 =>
            let
                val () = res := list_vt_cons{..}{n1+1}(seed, _)
                val+list_vt_cons(_,hole) = res
                val curr = seed * g0i2f(next)
                val () = loop(curr, next-1, hole)
                prval () = fold@(res)
            in
            end
      val initial = g0i2f(i) * g0i2f(i-1)
      val () = loop(initial,i-2,res)
  in
      res
  end

implement main0() =
let
    val x = factorial(10)
in
    println! "hello world";
    println! x;
    list_vt_free<double>x;
end
