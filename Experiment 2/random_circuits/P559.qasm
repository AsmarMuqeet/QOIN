OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(6.052306829174489) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
s q[2];
rzx(6.052306829174489) q[3],q[1];
ry(2.786046375403041) q[1];
u2(4.3809606951941,0.17969784465479297) q[3];
rxx(4.064063554895888) q[4],q[0];
u(1.7432392733886282,3.7654230572088356,4.025373441529185) q[0];
cp(3.3611531433946786) q[2],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
