OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(6.048621165786442) q1; cx q0,q1; h q1; }
gate gate_P712 q0,q1,q2,q3,q4,q5,q6 { tdg q0; tdg q1; ccx q4,q3,q2; cswap q2,q0,q1; ry(3.087123710623391) q0; rz(6.154754586988547) q1; tdg q3; rzx(6.048621165786442) q2,q3; cp(0.15360092102784756) q6,q5; cu(2.0133699587679517,0.6297174632523238,4.690653561156146,4.2768781615636025) q4,q5; u(5.494861112991119,4.5273930597392855,0.5234189162049281) q4; h q6; cu(5.789940930231729,6.027960561756471,4.520265691019166,4.226703840076008) q6,q5; }
qreg q[7];
creg c[3];
cx q[1],q[0];
gate_P712 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];