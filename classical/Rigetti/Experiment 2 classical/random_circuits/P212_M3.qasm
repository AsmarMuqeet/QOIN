OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(3.709308117191837,-0.011911590861598098,0.011911590861598098) q0; }
gate gate_P212 q0,q1,q2,q3,q4 { x q1; ccx q3,q0,q2; cu(3.975987168697552,4.482556364558903,4.03226441736363,5.989393101315316) q3,q1; r(3.709308117191837,1.5588847359332985) q4; cswap q4,q0,q2; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[2];
gate_P212 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
