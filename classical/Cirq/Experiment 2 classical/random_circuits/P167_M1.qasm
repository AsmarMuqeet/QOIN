OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.712421868413385) q1; cx q0,q1; h q1; }
gate rzx_139921335674864(param0) q0,q1 { h q1; cx q0,q1; rz(2.066294766639097) q1; cx q0,q1; h q1; }
gate gate_P167 q0,q1,q2,q3,q4,q5,q6 { sx q0; cz q2,q4; rzx_139921335674864(2.066294766639097) q2,q4; rzx(5.712421868413385) q1,q5; cu3(2.4228423528987926,0.7701246788205233,1.1595176166157837) q5,q1; cu(6.051019107582711,5.683516924317179,0.24257744188801458,6.176607102095435) q6,q3; cz q0,q3; x q6; }
qreg q[7];
creg c[3];
cx q[0],q[1];
gate_P167 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
