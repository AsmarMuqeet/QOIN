OPENQASM 2.0;
include "qelib1.inc";
gate gate_P852 q0,q1,q2,q3,q4 { u3(2.5841010864399885,1.0649445882713853,1.6348714712498988) q2; ccx q0,q1,q3; h q0; csx q1,q2; sx q3; u2(1.5267764682590044,0.5500864449667665) q4; z q4; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[1];
gate_P852 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
