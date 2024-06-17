OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.2248499038760988) q1; cx q0,q1; h q1; }
gate gate_P498 q0,q1,q2,q3,q4 { rzx(0.2248499038760988) q2,q0; x q0; z q3; cx q1,q4; cu(1.1179758773557356,3.5496779933611067,0.5172457682640116,6.10981311318009) q2,q1; cy q3,q4; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P498 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
