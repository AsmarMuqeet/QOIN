OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.94103655001391) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
ry(0.5209920214692579) q[0];
rx(5.277287393091537) q[0];
csx q[2],q[3];
y q[2];
rzx(2.94103655001391) q[4],q[1];
sx q[1];
cu1(1.9987556951459293) q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
