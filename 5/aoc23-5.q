gs:{value last ": "vs first x};
ga:{value @'' 2_/:{(where ""~/: x) _ x} 1_x};
map1:{[s;m] 
    m:,'[;m[;0]-m[;1]] m[;1],' -1+m[;1]+ m[;2]; // dest=m[;0], src=m[;1]
    last each s,'s+m[;2] where each flip s within/: m[;0 1]
    };

pt1:{
    seeds:gs x;
    alm:ga x;
    min (map1/)[seeds;] alm
    }

getadji:{[s;m] where each flip s[;0] within/: m[;0 1]}; // get index of adjustment m 
map2:{[s;m]
    m:,'[;m[;0]-m[;1]] m[;1],' -1+m[;1]+ m[;2]; // dest=m[;0], src=m[;1]
    s:({[s;m]
        i:getadji[s;m];
        s[;1]+:df:-1+{?[x<0;x;1]}raze (last each 0Wj,/:m[;1][i]) - mx:-1+sum each s;
        s,:(ns+1),'-[;(ns:m[;1][i][ni])] mx ni:where 0>df; // append new seed ranges if neccessary
        s
        }[;m]/) s;

    s[;0]:last each s[;0],'s[;0]+m[;2] getadji[s;m];
    s
    }

pt2:{
    seeds:2 cut gs x;
    alm:ga x;
    r:(map2/)[seeds;] alm;
    min r[;0]
    }

r1:pt1 read0`$":input";
r2:pt2 read0`$":input"; 
