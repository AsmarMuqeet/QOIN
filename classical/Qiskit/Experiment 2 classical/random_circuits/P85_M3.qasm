OPENQASM 2.0;
include "qelib1.inc";
gate gate_P85 q0,q1,q2,q3,q4,q5,q6 { swap q2,q1; cu(1.0601228155142675,6.239682063517003,0.8921811224626124,4.279271476956394) q4,q0; y q4; cp(5.271114064266347) q5,q3; ccx q2,q5,q0; ry(1.60214076321455) q3; rx(2.7999394618513196) q6; cx q6,q1; }
qreg q[7];
creg c[3];
cx q[0],q[1];
gate_P85 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
