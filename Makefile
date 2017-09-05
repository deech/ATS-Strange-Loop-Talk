PATSHOMEQ="$(PATSHOME)"

PATSCC=$(PATSHOMEQ)/bin/patscc
PATSOPT=$(PATSHOMEQ)/bin/patsopt

#PATSCCFLAGS=
#PATSCCFLAGS=-O2
#
# '-flto' enables link-time optimization such as inlining lib functions
#
PATSCCFLAGS=-O2 -flto

######

array_allocate: array_allocate.dats; \
  $(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -g -I${PATSHOME}/contrib -o $@ $< -latslib |& pats-filter
factorial: factorial.dats; \
  $(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -g -I${PATSHOME}/contrib -o $@ $< -latslib |& pats-filter
stream: stream.dats; \
  $(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -g -I${PATSHOME}/contrib -o $@ $< -latslib |& pats-filter
list: list.dats; \
  $(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -g -I${PATSHOME}/contrib -o $@ $< -latslib |& pats-filter
cleanall:: ; $(RMF) array_allocate factorial stream

######

#
# You may find these rules useful
#

# %_sats.o: %.sats ; $(PATSCC) $(PATSCCFLAGS) -c $< || echo $@ ": ERROR!!!"
# %_dats.o: %.dats ; $(PATSCC) $(PATSCCFLAGS) -c $< || echo $@ ": ERROR!!!"

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *.o
clean:: ; $(RMF) *.c
clean:: ; $(RMF) array_allocate
clean:: ; $(RMF) factorial
clean:: ; $(RMF) stream
clean:: ; $(RMF) list

cleanall:: clean
