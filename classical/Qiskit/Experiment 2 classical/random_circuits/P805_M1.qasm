OPENQASM 2.0;
include "qelib1.inc";
gate gate_P805 q0,q1,q2,q3,q4 { p(3.673609827354814) q0; id q0; sx q1; s q1; rz(1.7929300783168856) q2; tdg q2; sx q3; ry(6.0984217173693205) q3; sxdg q4; u1(0.8747737386484974) q4; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[1];
gate_P805 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
