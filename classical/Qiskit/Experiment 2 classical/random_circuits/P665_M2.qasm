OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.385274499001969) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.5436319632356574) q1; cx q0,q1; h q1; }
gate gate_P665 q0,q1,q2,q3,q4 { rzx(0.5436319632356574) q1,q2; u2(2.103488337910244,3.8851909871524417) q2; y q3; ryy(1.385274499001969) q3,q1; cz q0,q4; ry(3.134269126841027) q0; y q4; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[3];
gate_P665 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
