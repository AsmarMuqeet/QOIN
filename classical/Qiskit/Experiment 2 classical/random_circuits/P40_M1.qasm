OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.9901305873700865) q1; cx q0,q1; h q1; }
gate r(param0,param1) q0 { u3(1.0847919054619029,3.5366814246489575,-3.5366814246489575) q0; }
gate gate_P40 q0,q1,q2,q3,q4 { ry(3.8582732595208866) q0; r(1.0847919054619029,5.107477751443854) q0; t q2; ry(3.7725352080232524) q2; cu3(2.734326550808891,2.1645553288666357,3.985673590867679) q3,q1; rzx(5.9901305873700865) q3,q1; u(4.314475289705945,5.7576386563990685,1.3859746865029536) q4; u1(3.0794607982675344) q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[4];
gate_P40 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];