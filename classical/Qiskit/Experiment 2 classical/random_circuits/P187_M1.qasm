OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.712199164136863) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P187 q0,q1,q2,q3,q4,q5,q6 { cp(1.5566559351233629) q2,q3; ccx q0,q4,q1; u(0.2439784416715751,2.133821708892601,6.16310944501618) q0; cu1(0.050400815746652464) q1,q3; sx q1; u1(5.077410587818303) q3; u2(6.261183345008298,4.363433009069807) q4; ryy(5.712199164136863) q0,q4; s q5; h q6; ccx q6,q5,q2; sdg q2; y q5; rz(5.273949123999362) q6; }
qreg q[7];
creg c[3];
cx q[0],q[1];
gate_P187 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
