OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
z q[1];
z q[1];
u1(5.822894549541324) q[3];
u3(0.9573171179164132,5.314223546033399,0.3520780488114174) q[3];
ccx q[0],q[2],q[4];
cu1(3.1023230236296198) q[2],q[0];
u(2.3450848805332973,5.124723830617635,0.0003233332237160221) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];