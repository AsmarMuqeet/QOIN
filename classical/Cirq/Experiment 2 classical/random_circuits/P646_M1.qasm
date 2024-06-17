OPENQASM 2.0;
include "qelib1.inc";
gate gate_P646 q0,q1,q2,q3,q4,q5,q6 { ccx q2,q0,q3; cz q2,q0; s q4; cp(0.10068063168124557) q5,q1; cu(6.002127256441362,3.1795369491488494,4.503822818032798,2.662362518873502) q1,q4; sx q5; h q6; rxx(0.6062352607043282) q3,q6; }
qreg q[7];
creg c[3];
ccx q[1],q[0],q[3];
gate_P646 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
