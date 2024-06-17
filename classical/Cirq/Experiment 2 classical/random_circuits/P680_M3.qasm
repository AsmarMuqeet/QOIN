OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.2068449654276217) q1; cx q0,q1; h q1; }
gate gate_P680 q0,q1,q2,q3,q4 { rzx(2.2068449654276217) q2,q1; z q2; cp(2.981621874600992) q3,q0; x q0; u(4.891287192953425,5.5566001546861614e-05,1.4354317375974908) q3; rx(3.589001273764358) q4; cu1(1.492468498617129) q1,q4; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P680 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
