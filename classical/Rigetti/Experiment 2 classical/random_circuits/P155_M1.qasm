OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.586957325325717) q1; cx q0,q1; h q1; }
gate gate_P155 q0,q1,q2,q3,q4,q5,q6 { sdg q0; sxdg q4; rzx(5.586957325325717) q4,q0; ccx q1,q5,q2; u3(1.073180589170566,2.6823586697399047,3.8328419936847653) q1; p(2.7669577918857615) q5; rxx(4.2380712546676635) q6,q3; cx q3,q2; x q6; }
qreg q[7];
creg c[3];
cx q[2],q[0];
gate_P155 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
