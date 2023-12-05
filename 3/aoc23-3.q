pt1:{
    s:not x in .Q.n,".";
    n:raze x in .Q.n;
    cd:raze cd,/:\:cd: til count x;
    sg:raze sg,/:\:sg:-1 0 1;
    nx:({[n;nx] nx|(|). n&/:(prev;next)@\: nx}[n;]/) n&any each .[s;]@''(sg+\:)@'cd;
    sum "I"$" " vs ?[nx;raze[x];" "]
    }

pt2:{
    s:x in enlist "*";
    n:raze x in .Q.n;
    cd:raze cd,/:\:cd: til count x;
    sg:raze sg,/:\:sg:-1 0 1;
    r:.[s;]@''t:(sg+\:)@'cd;
    nx:@[;str]1<count each @[;enlist ();:;enlist 1] g:group str:t @' where each n&r;
    nx:({[n;nx] nx|(|). n&/:(prev;next)@\: nx}[n;]/)nx;
    g:({[n;g]g|@[;where not n;:;0](|) . (prev;next)@\:g}[n;]/) {[str;x]max each 0,/:@[str;x;:;1+til count x]}[str;]value enlist[()] _ g;
    ct:{distinct 0, where x} each 1 < deltas each gr:value group g;
    sum {{$[1<count x;(*/)x;0]} except[;0Ni]"J"$x} each ?[nx;raze[x];" "] ct _' gr
    }

r1:pt1 read0`$":input";
r2:pt2 read0`$":input";
