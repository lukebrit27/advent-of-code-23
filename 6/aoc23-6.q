getminh:{[t;d;h2sp]
    mind:d+1; // min dist
    first ({[h;t;md;h2sp]
        (h[0]+(h[0]<t)&not r;r:h[1]|(h[0]*h2sp)>=ceiling md%t-h 0)
        }[;t;mind;h2sp]/)[{not (x[0]~y)|all x[1]}[;t];](c#1;(c:count[t])#0b)
    }; 

getmaxh:{[t;d;h2sp]
    mind:d+1; // min dist
    first ({[h;t;md;h2sp]
        (h[0]-(h[0]>1)&not r;r:h[1]|(h[0]*h2sp)>=ceiling md%t-h 0)
        }[;t;mind;h2sp]/)[{not (x[0]~y)|all x[1]}[;t];](t-1;(c:count[t])#0b)
    };  
    
pt1:{
    x:{value trim last ": " vs x}each x;t:x 0;d:x 1;
    h2sp:1; // hold time (ms) to speed (millimeter per ms) 
    (*/)1+getmaxh[t;d;h2sp]-getminh[t;d;h2sp]
    }

pt2:{
    x:{"J"$ssr[;" ";""] trim last ": " vs x}each x;t:x 0;d:x 1;
    h2sp:1; // hold time (ms) to speed (millimeter per ms) 
    first 1+getmaxh[t;d;h2sp]-getminh[t;d;h2sp]
    }

r1:pt1 read0`$":input";
r2:pt2 read0`$":input";
