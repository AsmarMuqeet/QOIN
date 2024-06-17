OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.13976178502014) q1; cx q0,q1; h q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.4056014042195133) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P866 q0,q1,q2,q3,q4 { u3(2.5501121904360864,3.036339590142659,4.842254109405476) q0; id q0; cz q1,q3; u1(0.9098542629013519) q1; id q1; cx q4,q2; y q2; z q2; ryy(2.4056014042195133) q4,q3; u3(2.93139240787596,1.0050562664716465,2.577837568478881) q3; rzx(4.13976178502014) q4,q0; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P866 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
