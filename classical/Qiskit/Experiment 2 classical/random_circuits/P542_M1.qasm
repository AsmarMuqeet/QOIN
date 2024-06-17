OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.27278926340535214) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate ryy_139921316740112(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.374254034708442) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P542 q0,q1,q2,q3,q4 { cz q3,q1; h q1; cswap q0,q2,q4; u2(0.8021294766124686,1.6040185005587286) q2; ryy_139921316740112(4.374254034708442) q2,q1; ryy(0.27278926340535214) q3,q0; u2(4.038983360107389,2.8385819009014264) q0; u3(2.360270188632745,1.379266633965001,2.6047676241731863) q3; x q4; u(1.0093547702469319,0.6228523086886262,6.062655838390015) q4; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P542 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];