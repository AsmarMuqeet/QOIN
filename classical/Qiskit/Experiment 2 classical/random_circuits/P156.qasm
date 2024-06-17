OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.55981043491436) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r(param0,param1) q0 { u3(0.4606017890419314,2.782372051090734,-2.782372051090734) q0; }
qreg q[5];
creg c[3];
rxx(2.3923523983279344) q[0],q[1];
ryy(2.55981043491436) q[1],q[0];
ry(1.610446508345942) q[2];
r(0.4606017890419314,4.3531683778856305) q[2];
crx(2.978520403807098) q[4],q[3];
z q[3];
h q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
