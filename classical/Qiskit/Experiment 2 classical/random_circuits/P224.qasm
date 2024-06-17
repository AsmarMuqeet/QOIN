OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(3.2655090295667084,2.6019213105916235,-2.6019213105916235) q0; }
gate r_139921317343968(param0,param1) q0 { u3(1.6233009572198256,-0.817378760853404,0.817378760853404) q0; }
qreg q[5];
creg c[3];
z q[0];
sxdg q[1];
r(3.2655090295667084,4.17271763738652) q[1];
u3(0.5552053613522183,1.484469270108707,2.662946372396787) q[1];
cu(4.267302346056357,1.2541274444317825,3.8149379425397076,2.6179169782642018) q[2],q[3];
cu1(5.880856440002927) q[2],q[0];
u(4.697356268338112,5.257313932776723,5.477199829874932) q[0];
r_139921317343968(1.6233009572198256,0.7534175659414926) q[2];
sdg q[3];
u(5.114750910441473,1.9051348039732863,5.125819864226292) q[4];
u(2.7356199948917057,2.8688444800732453,3.462704962384545) q[4];
ch q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];