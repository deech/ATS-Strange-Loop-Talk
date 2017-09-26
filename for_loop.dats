#include "share/atspre_staload.hats"

extern fun
   {env:t@ype}
   worker
   (
     count: int,
     env: &env >> _
   ): void

fun {env:t@ype}
  for_loop
  (
    count: int,
    limit: int,
    env: &env >> _
  ) : void =
    if count < limit
    then
      begin
       worker<env>(count, env);
       for_loop<env>(count+1, limit, env)
      end
    else ()

fun
  tally
  (
    n: int
  ) : int =
  let
    var res: int = 0
    implement worker<int> (i, res) = res := res + i
  in
    for_loop<int> (0, n, res); res
  end

implement main0() =
  let
    val N = 100
  in
    println! ("tally(", N, ") = ", tally(N))
  end
