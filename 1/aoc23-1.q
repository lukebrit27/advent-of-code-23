pt1:{sum"I"$x @' flip (&/;|/)@'\: where each x in 1_.Q.n};

pt2:{
    sum"I"$(,').{[x;f]
        n:("one";"two";"three";"four";"five";"six";"seven";"eight";"nine");
        v:1_.Q.n;
        n,:enlist each v;
        (18#v) where each (f@'r)=r:f@/:/:flip (x ss\:) each n
        }[x] each (&/;|/)
    };

r1:pt1 read0`:input;
r2:pt2 read0`:input;

