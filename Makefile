PATSHOMEQ="$(PATSHOME)"

PATSCC=$(PATSHOMEQ)/bin/patscc
PATSOPT=$(PATSHOMEQ)/bin/patsopt

######

all: unsafe_swap swap_from_ats safe_swap stream list array_allocate factorial
unsafe_swap: unsafe_swap.dats; \
  $(PATSCC) $(PATSCCFLAGS) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -g -I${PATSHOME}/contrib -o $@ $< -latslib |& pats-filter
swap_from_ats: swap_from_ats.dats; \
  $(PATSCC) $(PATSCCFLAGS) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -g -I${PATSHOME}/contrib -o $@ $< -latslib |& pats-filter
safe_swap: safe_swap.dats; \
  $(PATSCC) $(PATSCCFLAGS) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -g -I${PATSHOME}/contrib -o $@ $< -latslib |& pats-filter
array_allocate: array_allocate.dats; \
  $(PATSCC) $(PATSCCFLAGS) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -g -I${PATSHOME}/contrib -o $@ $< -latslib |& pats-filter
factorial: factorial.dats; \
  $(PATSCC) $(PATSCCFLAGS) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -g -I${PATSHOME}/contrib -o $@ $< -latslib |& pats-filter
stream: stream.dats; \
  $(PATSCC) $(PATSCCFLAGS) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -g -I${PATSHOME}/contrib -o $@ $< -latslib |& pats-filter
list: list.dats; \
  $(PATSCC) $(PATSCCFLAGS) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -g -I${PATSHOME}/contrib -o $@ $< -latslib |& pats-filter
cleanall:: ; $(RMF) array_allocate factorial stream

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *.o
clean:: ; $(RMF) *.c
clean:: ; $(RMF) array_allocate
clean:: ; $(RMF) factorial
clean:: ; $(RMF) stream
clean:: ; $(RMF) list
clean:: ; $(RMF) safe_swap
clean:: ; $(RMF) swap_from_ats
clean:: ; $(RMF) swap
clean:: ; $(RMF) unsafe_swap

cleanall:: clean
