pt1:{
    c:("* r*";"* g*";"* b*");
    v:12 13 14;
    g:1+til count x;
    t:", " vs/:/: "; " vs/: {x[;1]}": " vs/: x;
    sum g*all each {[c;v;r]all raze ("I"$1#'" " vs/: r)<=v where each flip r like/: c}[c;v;]@''t
    }

pt2:{
    c:("* r*";"* g*";"* b*");
    v:0 0 0;
    t:", " vs/:/: "; " vs/: {x[;1]}": " vs/: x;
    sum (*/)@'({[c;v;r]v|max each (,\:)[;0](raze "I"$1#'" " vs/: r) where each r like/: c}[c]/)[v;]@' t
    }

r1:pt1 read0`$":input";
r2:pt2 read0`$":input";

