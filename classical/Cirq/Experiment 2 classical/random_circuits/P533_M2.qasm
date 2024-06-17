OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(2.681653341286301,1.0639099075491179,-1.0639099075491179) q0; }
gate gate_P533 q0,q1,q2,q3,q4 { sdg q0; u2(4.677296262128272,0.11329636568209207) q0; rzz(0.40114099036538053) q1,q2; s q1; r(2.681653341286301,2.6347062343440144) q2; ch q3,q4; z q3; id q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P533 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
