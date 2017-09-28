#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"
staload UN = "prelude/SATS/unsafe.sats"


%{
  #include <stdio.h>
  #include <stdlib.h>

  void swap (void* p1, void* p2, size_t size) {
  	char* buffer = (char*)malloc(sizeof(char)*size);
  	memcpy(buffer, p1, size);
  	memcpy(p1, p2, size);
  	memcpy(p2, buffer, size);
  	free(buffer);
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
