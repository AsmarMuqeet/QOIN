OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.966163247166805) q1; cx q0,q1; h q1; }
gate gate_P10 q0,q1,q2,q3,q4 { ccx q0,q2,q3; u3(3.7658976670163877,0.8424511627047425,5.264946578916915) q0; z q3; rzx(5.966163247166805) q1,q4; cx q1,q2; u(2.5657191499468093,1.2192095862899754,3.2296561196483844) q4; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[1];
gate_P10 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
