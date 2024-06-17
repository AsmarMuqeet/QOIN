OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.3336272922204646) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P614 q0,q1,q2,q3,q4 { x q0; rx(5.647818734091302) q1; s q1; cp(2.4314000931289685) q2,q3; swap q2,q0; rxx(2.2504594676534526) q0,q2; ry(2.0328960743231352) q3; sx q3; swap q3,q2; u3(2.707411635192303,3.556740070677877,4.6312051945009145) q4; rx(3.3187863984414685) q4; ryy(3.3336272922204646) q1,q4; rxx(2.178302498439553) q0,q4; x q1; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[0];
gate_P614 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
