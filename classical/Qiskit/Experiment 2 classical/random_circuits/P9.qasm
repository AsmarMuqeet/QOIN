OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
sdg q[1];
u(2.563294969027793,0.5287563940580952,2.688681417076342) q[1];
cu(0.2053570408513362,6.120628998253503,4.68589175558836,2.2141724996219385) q[0],q[2];
id q[0];
u3(3.654722628361629,6.1246172159789,0.4448116540837571) q[2];
rxx(1.1440227307797324) q[3],q[4];
u3(1.472813849911702,1.9454818701496315,2.5443232667027185) q[3];
y q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];