pc:{except[;0Ni]@'' "I"$/:/: " " vs/:/:  "| " vs/: last each ": " vs/: x};
win:{[c]sum each {x[1]in x 0} each c};

pt1:{
    card:pc x;
    sum floor 2 xexp -1+win card
    };

pt2:{
    card:pc x;
    r:win card;
    copies:raze ({[r;c] raze (1+c)+til each r c}[r;]\)raze (1+til count r)+til each r;
    count til[count r],copies
    };

r1:pt1 read0`$":input";
r2:pt2 read0`$":input";
