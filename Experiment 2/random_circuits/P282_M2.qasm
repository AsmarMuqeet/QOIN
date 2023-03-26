OPENQASM 2.0;
include "qelib1.inc";
gate gate_P282 q0,q1,q2,q3,q4 { cy q1,q2; rzz(0.2449590920570622) q0,q3; u3(0.1821348931626977,1.7896843251047667,6.06909309049506) q0; cz q3,q1; u1(1.348769503110304) q4; csx q2,q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P282 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
