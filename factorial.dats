#include "share/atspre_staload.hats"

fun factorial { n : int | n >= 1 } .<n>. (i : int n) : double =
  let
    fun loop { n : int | n >= 1 } .<n>. (acc : double, i : int (n)) : double =
      begin
        if (i = 1) then
          acc
        else
          loop(acc * i, i - 1)
      end
  in
    loop(1.0, i)
  end

sortdef even = { i:int | i mod 2 == 0  }

fn {a:t@ype}
   swap1 {l1,l2:addr}
  (pf1: !a@l1, pf2: !a@l2 | p1: ptr (l1), p2: ptr (l2)) : void  =
  let
    val tmp = !p1
  in !p1 := !p2; !p2 := tmp
  end

vtypedef tptr (a:t@ype, l:addr) = (a @ l | ptr l)
(*
fn getinc
  {l:addr}{n:nat}
(
  cnt: tptr (int(n), l), l
) : (tptr(int(n+1), l) | int(n)) = n where {
  val n = ptr_get<int(n)> (cnt.0 | cnt.1)
  val () = ptr_set<int(n+1)> (cnt.0 | cnt.1, n+1)
}
*)
fn fact{n:nat}
  (n: int (n)): [l : agz] aptr(int, l) = let
  fun loop{n:nat}{l:addr} .<n>.
    (pf: !int @ l | n: int n, res: ptr l): void =
    if n > 0 then let
      val () = !res := n * !res in loop (pf | n-1, res)
    end
  var res: int = 1
  val () = loop (view@(res) | n, addr@res) // addr@res: the pointer to res
in
  aptr_make_elt(res)
end

implement main0 () =
  let
    val odd : [n : even] int(n) = 2
    val a = factorial(10)
    val x = arrayptr $arrpsz(0,1,2,3,4)
    val b = fact(10)
    val p : int = aptr_getfree_elt<int>(b)
  in
    print p;
    free x;
  end
