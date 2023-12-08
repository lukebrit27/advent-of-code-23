// HIGH CARD - 5 distinct cards, 0 cards matching another card
// PAIR - 4 distinct cards, 2 cards matching another card
// 2 PAIRS - 3 distinct cards, 4 cards matching another card
// 3 OF A KIND - 3 distinct cards, 3 cards matching another card
// FULL HOUSE - 2 distinct cards, 5 cards matching another card
// 4 OF A KIND - 2 distinct cards, 4 cards matching another card
// 5 OF A KIND - 1 distinct card, 5 cards matching another card
mode:{where max[c]=c:count each group x where not null x};
gettyp:{[hds]
    tys:{x!til count x}(0N 0N;5 0;4 2;3 4;3 3;2 5;2 4;1 5);
    tys {(count distinct x),"j"$sum (0=next d)|0=d:deltas asc x:$[0N in x;^[;x](|/)mode x;x]} each hds
    }
rankhds:{[t;hds]1+rank t,'hds}

pt1:{
    x:" " vs/: x;
    cds:{x!2+til count x} "23456789TJQKA";
    hds:cds x[;0];bids:"I"$x[;1];
    sum bids*rankhds[gettyp hds;hds]
    }  

pt2:{
    x:" " vs/: x;
    cds:{x!0N,2+til count[x]-1} "J23456789TQKA";
    hds:cds x[;0];bids:"I"$x[;1];
    sum bids*rankhds[gettyp hds; hds]
    }

r1:pt1 read0`$":input";
r2:pt2 read0`$":input"; 
