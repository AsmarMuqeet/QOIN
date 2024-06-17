OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.729454476261261) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
y q[1];
s q[1];
x q[2];
p(1.1901184354149728) q[3];
cu3(4.661310196201344,0.4896788371002653,0.8799491581468484) q[3],q[2];
cy q[4],q[0];
u1(3.478735517709366) q[0];
sx q[5];
rzx(2.729454476261261) q[4],q[5];
rz(4.904819348300164) q[6];
tdg q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
