OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.5436319632356574) q1; cx q0,q1; h q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.385274499001969) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
rzx(0.5436319632356574) q[1],q[2];
u2(2.103488337910244,3.8851909871524417) q[2];
y q[3];
ryy(1.385274499001969) q[3],q[1];
cz q[0],q[4];
ry(3.134269126841027) q[0];
y q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
