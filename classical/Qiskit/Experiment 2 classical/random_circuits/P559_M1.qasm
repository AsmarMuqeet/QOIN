OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(6.052306829174489) q1; cx q0,q1; h q1; }
gate gate_P559 q0,q1,q2,q3,q4 { s q2; rzx(6.052306829174489) q3,q1; ry(2.786046375403041) q1; u2(4.3809606951941,0.17969784465479297) q3; rxx(4.064063554895888) q4,q0; u(1.7432392733886282,3.7654230572088356,4.025373441529185) q0; cp(3.3611531433946786) q2,q4; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P559 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
