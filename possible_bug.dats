#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"
#include "prelude/DATS/pointer.dats"

implement main0 () =
  let
    val (_, _ | p) = malloc_gc (sizeof<int>)
  in
    ()
  end