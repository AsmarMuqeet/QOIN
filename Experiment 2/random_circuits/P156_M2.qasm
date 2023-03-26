OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(0.4606017890419314,2.782372051090734,-2.782372051090734) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.55981043491436) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P156 q0,q1,q2,q3,q4 { rxx(2.3923523983279344) q0,q1; ryy(2.55981043491436) q1,q0; ry(1.610446508345942) q2; r(0.4606017890419314,4.3531683778856305) q2; crx(2.978520403807098) q4,q3; z q3; h q4; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[1];
gate_P156 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
