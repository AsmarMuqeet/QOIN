OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.7474215146509327) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r(param0,param1) q0 { u3(2.0418348721684,1.76867793898625,-1.76867793898625) q0; }
gate gate_P16 q0,q1,q2,q3,q4 { sdg q1; ry(3.289476077603259) q1; id q1; sxdg q3; u(2.278578306566595,0.6448583187107656,4.554843053741285) q3; ry(6.186094847598841) q3; cswap q2,q0,q4; sx q2; r(2.0418348721684,3.3394742657811465) q2; ryy(1.7474215146509327) q4,q0; cu1(0.9902763734542847) q4,q0; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P16 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
