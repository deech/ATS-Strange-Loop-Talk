#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"
staload UN = "prelude/SATS/unsafe.sats"


%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>

  void swap(void *i, void *j, size_t size) {
    void* tmp = malloc(size);
    memcpy(tmp, j, size);
    memcpy(j, i, size);
    memcpy(i, tmp, size);
    free(tmp);
  }
%}

extern fun swap (i:ptr, j:ptr, s: size_t) : void = "mac#swap"
extern fun malloc(s:size_t):ptr = "mac#malloc"

implement main0 () =
  let
     val i = malloc(sizeof<int>)
     val j = malloc(sizeof<double>)
     val _ = swap(i,j,sizeof<double>)
  in
     ()
  end
