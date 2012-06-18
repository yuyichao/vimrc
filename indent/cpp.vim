" Only load this indent file when no other was loaded.
if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

setlocal cindent
setlocal noautoindent
setlocal cino=>s,e0,n0,f0,{0,}0,^0,Ls,:0,=s,l1,b0,g0,hs,N-s,ps,t0,is,+s,c3,C1,/0,(0,u0,U0,w1,Ws,m0,M0,j1,J1,)20,*70,#0

let b:undo_indent = "setl cin<"
