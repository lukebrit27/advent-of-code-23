seq:{sum last each ({$[all x=0;x;1_deltas x]}\) x};
pt1:{sum seq each value each x};
pt2:{sum {seq reverse x} each value each x};

r1:pt1 read0`$":input";
r2:pt2 read0`$":input";
