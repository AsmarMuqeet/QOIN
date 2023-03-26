OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.697086061923389) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
ryy(2.697086061923389) q[0],q[1];
sdg q[1];
id q[2];
rxx(2.2288711132040646) q[0],q[2];
y q[3];
t q[3];
sx q[4];
t q[4];
h q[5];
s q[6];
cu3(5.315328544834259,3.941734456200525,5.115504464220521) q[6],q[5];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
