#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fun factorial_array_extend
    {n:int|n > 1}
    (i : int n):
     [l:addr][x:int|x == n - 1] (array_v(double,l,x), mfree_gc_v(l) | ptr l) =
  let
    var x = array_ptr_alloc(i2sz(1))
    fun loop
        {n:int|n > 1}
        (i : int n):
  in
    x
  end

implement main0() = ()