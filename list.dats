
fun {a:t0p} list_append2_vt {i,j:int} (xs: NSH(list(INV(a), i)), ys: list_vt(a, j)) :<!wrt> list_vt(a, i+j)

implement
{a}(*tmp*)
list_append2_vt
  {m,n} (xs, ys) = let
//
prval() = lemma_list_param (xs)
prval() = lemma_list_vt_param (ys)
//
fun
loop
{m:nat} .<m>.
(
  xs: list(a, m)
, ys: list_vt(a, n)
, res: &ptr? >> list_vt(a, m+n)
) :<!wrt> void =
  case+ xs of
  | list_nil
      () => (res := ys)
    // list_nil
  | list_cons
      (x, xs) => let
      val () = res :=
        list_vt_cons{a}{0}(x, _(*?*))
      val+list_vt_cons
        (_, res1) = res // res1 = res.1
      val () = loop(xs, ys, res1)
      prval ((*folded*)) = fold@ (res)
    in
      // nothing
    end // end of [list_cons]
// end of [loop]
var res: ptr // uninitialized
val () = loop(xs, ys, res)
//
in
  res
end // end of [list_append2_vt]