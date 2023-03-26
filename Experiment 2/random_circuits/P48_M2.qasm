OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.196156021192657) q1; cx q0,q1; h q1; }
gate r(param0,param1) q0 { u3(4.56820982404109,0.7568824405808057,-0.7568824405808057) q0; }
gate gate_P48 q0,q1,q2,q3,q4 { sx q0; h q0; cp(2.8647809899416647) q1,q2; sdg q1; h q2; sx q2; u1(5.965008956468106) q3; sdg q3; cu(5.809886426091336,3.2406367706999593,4.5866501659076695,4.2139573293344395) q0,q3; sx q4; r(4.56820982404109,2.3276787673757022) q4; rzx(4.196156021192657) q4,q1; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[2];
gate_P48 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
