OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.7092154302476907) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P725 q0,q1,q2,q3,q4,q5,q6 { ryy(2.7092154302476907) q2,q1; rx(0.6693776629722922) q1; x q2; id q4; y q4; cp(1.107668248285612) q3,q5; sxdg q5; rzz(2.4971086050828926) q0,q6; sdg q0; csx q3,q6; }
qreg q[7];
creg c[3];
ccx q[1],q[2],q[3];
gate_P725 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
