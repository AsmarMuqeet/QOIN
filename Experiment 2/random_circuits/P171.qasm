OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.7463788843767114) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
sdg q[0];
sxdg q[0];
ry(5.973152368426478) q[0];
u(4.673320878089934,4.696161225598784,3.7935586445354597) q[1];
y q[2];
rzz(4.7327628079167985) q[2],q[1];
s q[1];
sdg q[1];
ry(5.625304370540351) q[3];
sxdg q[4];
rzx(1.7463788843767114) q[3],q[4];
ry(4.594901690958469) q[3];
s q[3];
sx q[3];
cu3(4.199149336293213,3.6891472474806157,4.435249681104627) q[4],q[2];
cx q[2],q[0];
sxdg q[0];
t q[2];
tdg q[4];
cu1(4.515012509048939) q[4],q[1];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
