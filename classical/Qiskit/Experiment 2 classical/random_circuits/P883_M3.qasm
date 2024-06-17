OPENQASM 2.0;
include "qelib1.inc";
gate rzx_139921317977248(param0) q0,q1 { h q1; cx q0,q1; rz(5.454697393940841) q1; cx q0,q1; h q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.533480930467583) q1; cx q0,q1; h q1; }
gate r(param0,param1) q0 { u3(5.550436257070766,1.615488471876343,-1.615488471876343) q0; }
gate gate_P883 q0,q1,q2,q3,q4,q5,q6 { rx(5.5689357129134684) q1; cy q2,q0; t q2; r(5.550436257070766,3.1862847986712395) q4; p(0.3454370437224285) q4; sx q4; tdg q4; sdg q4; t q5; rzx(3.533480930467583) q6,q3; cswap q3,q0,q5; id q0; s q0; s q0; sx q3; z q5; cx q6,q1; h q1; csx q1,q5; ry(2.7923236758130545) q1; rxx(3.5092554835473284) q2,q6; rzx_139921317977248(5.454697393940841) q2,q3; csx q5,q2; u3(3.759628949662236,4.100902015834834,4.706346062483306) q6; csx q3,q6; }
qreg q[7];
creg c[3];
cx q[1],q[0];
gate_P883 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
