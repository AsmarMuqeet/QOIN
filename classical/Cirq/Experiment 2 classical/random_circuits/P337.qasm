OPENQASM 2.0;
include "qelib1.inc";
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
qreg q[7];
creg c[3];
s q[0];
sx q[0];
s q[1];
sx q[1];
cp(3.7521978946112347) q[4],q[3];
y q[5];
x q[5];
cu3(5.377765774045369,3.589554261670654,3.325738901693188) q[6],q[2];
cu3(3.8640593689571334,5.051574842552111,2.91816310615731) q[3],q[2];
iswap q[4],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
