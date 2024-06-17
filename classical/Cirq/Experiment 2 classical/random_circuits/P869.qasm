OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.48709633257858) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
rx(5.500784904234263) q[0];
u3(1.591143809924025,2.529372312016288,3.424387648440117) q[1];
id q[2];
cy q[2],q[0];
y q[4];
id q[5];
u3(4.7154703700093,6.066073620861333,0.6569102944130187) q[5];
rzx(2.48709633257858) q[6],q[3];
cp(4.997591944845926) q[3],q[1];
cp(5.0142834194509796) q[6],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];