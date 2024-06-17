OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(5.867430779861021,-0.5043988945860622,0.5043988945860622) q0; }
gate gate_P205 q0,q1,q2,q3,q4 { u1(4.505572760064683) q0; cu1(1.0252655295433342) q1,q2; cz q1,q0; z q0; u1(2.377437788954897) q2; rx(0.006586346259758552) q2; r(5.867430779861021,1.0663974322088343) q3; x q3; cu(3.1637471671892827,2.184508468655182,0.748757830070599,4.769738923218858) q3,q1; tdg q4; tdg q4; t q4; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P205 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];