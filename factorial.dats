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

implement main0 () =
  let
    val a = factorial(10)
  in
    begin
      println! (factorial(100));
      println! a;
    end
  end
