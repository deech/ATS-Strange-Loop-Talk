#include "share/atspre_staload.hats"
extern praxi array_v_uncons:{a:vt0p}{l:addr}{n:int | n > 0} array_v (INV(a), l, n) -<prf> (a @ l, array_v (a, l+sizeof(a), n-1))

implement main0 () =
  let
    var N = 10000
    stadef T = List1_vt(int)
    val sa : T = $list_vt{int}(1,2,3)
    val (pfat, pfgc | p) = array_ptr_alloc<int>(g1i2u(N))
    val _ = array_initize_elt(!p, g1i2u(N), 0)
  in
    begin
      free sa;
      array_ptr_free(pfat, pfgc | p);
    end
  end