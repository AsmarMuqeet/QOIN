OPENQASM 2.0;
include "qelib1.inc";
gate gate_P816 q0,q1,q2,q3,q4,q5,q6 { sx q0; z q0; sdg q1; rx(0.9670769968794293) q1; cu1(1.763556308333735) q2,q3; tdg q2; u1(1.2984591484621588) q3; u3(2.276335893201323,5.246558058703807,4.929438206642369) q4; s q4; u1(3.811578451242075) q5; id q6; csx q5,q6; }
qreg q[7];
creg c[3];
cx q[0],q[2];
gate_P816 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
