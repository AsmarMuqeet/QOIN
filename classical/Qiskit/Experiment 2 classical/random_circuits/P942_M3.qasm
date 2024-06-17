OPENQASM 2.0;
include "qelib1.inc";
gate gate_P942 q0,q1,q2,q3,q4 { rz(1.0244594811398005) q0; y q0; sx q1; u1(0.8994541365883622) q1; u2(1.6443360749000149,3.9555342841470633) q2; u1(4.337873012314339) q2; u2(1.607600050390585,0.8155288739887523) q3; s q3; sdg q4; sdg q4; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P942 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
