OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.5779675078547513) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx_139921317956384(param0) q0,q1 { h q1; cx q0,q1; rz(5.733717690142625) q1; cx q0,q1; h q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.9430383264321522) q1; cx q0,q1; h q1; }
gate gate_P159 q0,q1,q2,q3,q4,q5,q6 { z q0; x q1; rxx(3.2065663731120106) q1,q0; sdg q0; s q1; id q2; t q2; s q3; y q3; rx(0.023940478947206204) q4; rz(5.918252120930068) q4; u2(2.561865956958895,4.730840146619332) q4; cp(5.819963377573527) q5,q6; rzx(0.9430383264321522) q5,q6; rzx_139921317956384(5.733717690142625) q2,q5; ryy(1.5779675078547513) q6,q3; }
qreg q[7];
creg c[3];
ccx q[0],q[1],q[4];
gate_P159 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
