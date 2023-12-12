steps:{[d;m;s;e]
     last ({[d;m;s]
        (m[s 0][;d s[1] mod count d];s[1]+1)
        }[d;m;]/)[{not all x[0] in y}[;e];] (s;0)
    }
pt1:{
    d:("LR"!0 1) first x;
    m:{(`$x)!`$y} . flip {x[;1]:"," vs/: x[;1] @' where each x[;1] in .Q.an,",";x}" = " vs/: 2_x;
    s:enlist`AAA;e:enlist`ZZZ;
    steps[d;m;s;e]
    }

primes:{{$[not 0 in y mod/:x;x,y;x]}/[2;3 + til x-2]};
factor:{first ({[v]
    ((v[0],'pf) except\: 0W;(1*not r)+r:v[1] div pf:min each p where each 0=v[1] mod/:\: p:(),primes max 2,v[1])
    }/)(count[x]#enlist();x)};
lcm:{(*/)raze #'[;df](|/)({count each group x} each f)@\:df:distinct raze f:factor x};    
pt2:{
    d:("LR"!0 1) first x;
    m:{(`$x)!`$y} . flip {x[;1]:"," vs/: x[;1] @' where each x[;1] in .Q.an,",";x}" = " vs/: 2_x;
    s:k where (k:key m) like "*A";e:k where k like"*Z";
    r:steps[d;m;;e] each enlist each s;
    lcm cnt,"j"$r%cnt:count d    
    }

r1:pt1 read0`$":input";
r2:pt2 read0`$":input";
