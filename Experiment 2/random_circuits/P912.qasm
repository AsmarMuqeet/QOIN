OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.698456655749392) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
rz(3.2441827359375495) q[2];
z q[2];
csx q[3],q[1];
sx q[4];
cswap q[0],q[6],q[5];
cp(3.5733867250126057) q[0],q[1];
rzx(4.698456655749392) q[3],q[6];
rzz(3.9764566695361108) q[4],q[5];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
