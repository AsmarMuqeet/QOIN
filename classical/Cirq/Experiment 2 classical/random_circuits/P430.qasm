OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.49729294205928) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
t q[1];
h q[1];
h q[1];
cswap q[2],q[0],q[3];
rzx(5.49729294205928) q[0],q[2];
sxdg q[0];
rz(3.8687197234598334) q[2];
sx q[4];
rzz(5.165683576327213) q[4],q[3];
sx q[3];
rx(4.234575934031972) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
