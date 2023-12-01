OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.9239678612798821) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P785 q0,q1,q2,q3,q4,q5,q6 { cswap q0,q2,q1; z q0; s q3; cz q3,q2; x q5; p(6.225653541452653) q5; cu(4.9943224843800085,2.9213595742458414,5.780743397582099,4.799248630573268) q6,q4; ryy(0.9239678612798821) q1,q4; sx q6; }
qreg q[7];
creg c[3];
cx q[2],q[0];
gate_P785 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
