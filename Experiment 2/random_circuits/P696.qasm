OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
y q[1];
sx q[2];
rx(0.5935979348709283) q[2];
rzz(0.17718595031236634) q[0],q[3];
cu3(4.155581328778422,4.072441868160796,3.7919701869441016) q[0],q[1];
h q[3];
u2(4.0108559110319755,5.846676504174429) q[4];
t q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
