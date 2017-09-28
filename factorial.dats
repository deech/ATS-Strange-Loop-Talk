#include "share/atspre_staload.hats"

fun factorial { n : int | n >= 1 } (i : int n) : double =
  let
    fun loop { n : int | n >= 1 } .<n>. (acc : double, i : int (n)) : double =
      case- i of
      | 1 => acc
      | i when i > 1 => loop(acc * i, i - 1)
  in
    loop(1.0, i)
  end

sortdef even = { i:int | i mod 2 == 0  }
sortdef agz = {l:addr | l > null}
viewtypedef ptrResource (a:t@ype) = [l:agz] (a @ l | ptr l)

fn {a:t@ype}
   swap1 {l1,l2:addr}
  (pf1: !a@l1, pf2: !a@l2 | p1: ptr (l1), p2: ptr (l2)) : void  =
  let
    val tmp = !p1
  in !p1 := !p2; !p2 := tmp
  end

fn fact{n:nat}
  (n: int (n)): double = let
  fun loop{n:nat}{l:addr} .<n>.
    (pf: !double @ l | n: int n, res: ptr l): void =
    case n of
      | 0 => ()
      | n =>
         (
          if (n > 0) then
            begin
              !res := n * !res;
              loop (pf | n-1, res);
            end
         )
  var res with pfres = 1.0
in
  loop (pfres | n, addr@res);
  res
end

implement main0 () =
  let
    (* val odd : [n : even] int(n) = 2 *)
    val a = factorial(100)
    val c = fact(100000)
    (* val x = arrayptr $arrpsz(0,1,2,3,4) *)
    (* val b = fact(10) *)
    (* val p : int = aptr_getfree_elt<int>(b) *)
  in
    println! "hello world";
    println! (sizeof<double>);
    println! a;
    println! c;
    (* free x; *)
  end
