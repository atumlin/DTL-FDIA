function mpc = case14_modified_Version_target_domain(Basecase_index)
%CASE14    Power flow data for IEEE 14 bus test case.
%   Please see CASEFORMAT for details on the case file format.
%   This data was converted from IEEE Common Data Format
%   (ieee14cdf.txt) on 15-Oct-2014 by cdf2matp, rev. 2393
%   See end of file for warnings generated during conversion.
%
%   Converted from IEEE CDF file from:
%       https://labs.ece.uw.edu/pstca/
% 
%  08/19/93 UW ARCHIVE           100.0  1962 W IEEE 14 Bus Test Case

%   MATPOWER
load('BaseLoadCondition.mat');
Pd = BaseLoadCondition(Basecase_index,:);
Qd = BaseLoadCondition(100+Basecase_index,:);
%% MATPOWER Case Format : Version 2
mpc.version = '2';

%%-----  Power Flow Data  -----%%
%% system MVA base
mpc.baseMVA = 100;

%% bus data
%	bus_i	type	Pd	Qd	Gs	Bs	area Vm     Va	          baseKV	zone	    Vmax	Vmin
mpc.bus = [
	1	3	0	  0	    0	0	1	    1.06	0	    0	1	1.06	0.94;
	2	2	Pd(1)*(0.8+0.4*rand)  Qd(1)*(0.8+0.4*rand)	0	0	1	    1.045	-4.98	0	1	1.06	0.94;
	3	2	Pd(2)*(0.8+0.4*rand)  Qd(2)*(0.8+0.4*rand)	0	0	1	    1.01	-12.72	0	1	1.06	0.94;
	4	1	Pd(3)*(0.8+0.4*rand)  Qd(3)*(0.8+0.4*rand)	0	0	1	    1.019	-10.33	0	1	1.06	0.94;
	5	1	Pd(4)*(0.8+0.4*rand)  Qd(4)*(0.8+0.4*rand)	0	0	1	    1.02	-8.78	0	1	1.06	0.94;
	6	2	Pd(5)*(0.8+0.4*rand)  Qd(5)*(0.8+0.4*rand)	0	0	1	    1.07	-14.22	0	1	1.06	0.94;
	7	1	0	  0	    0	0	1	    1.062	-13.37	0	1	1.06	0.94;
	8	2	0	  0	    0	0	1	    1.09	-13.36	0	1	1.06	0.94;
	9	1	Pd(6)*(0.8+0.4*rand)  Qd(6)*(0.8+0.4*rand)	0	0	1	    1.056	-14.94	0	1	1.06	0.94;
	10	1	Pd(7)*(0.8+0.4*rand)  Qd(7)*(0.8+0.4*rand)	0	0	1	    1.051	-15.1	0	1	1.06	0.94;
	11	1	Pd(8)*(0.8+0.4*rand)  Qd(8)*(0.8+0.4*rand)	0	0	1	    1.057	-14.79	0	1	1.06	0.94;
	12	1	Pd(9)*(0.8+0.4*rand)  Qd(9)*(0.8+0.4*rand)	0	0	1	    1.055	-15.07	0	1	1.06	0.94;
	13	1	Pd(10)*(0.8+0.4*rand) Qd(10)*(0.8+0.4*rand)	0	0	1	    1.05	-15.16	0	1	1.06	0.94;
	14	1	Pd(11)*(0.8+0.4*rand) Qd(11)*(0.8+0.4*rand)	    0	0	1	    1.036	-16.04	0   1	1.06	0.94;
];

%% generator data
%	bus	Pg	Qg	Qmax	Qmin	Vg	mBase	status	Pmax	Pmin	Pc1	Pc2	Qc1min	Qc1max	Qc2min	Qc2max	ramp_agc	ramp_10	ramp_30	ramp_q	apf
mpc.gen = [
	1	232.4	-16.9	10	0	 1.06	100	1	332.4	0	0	0	0	0	0	0	0	0	0	0	0;
	2	40	    42.4	50	-40	 1.045	100	1	140	    0	0	0	0	0	0	0	0	0	0	0	0;
	3	0	    23.4	40	0	 1.01	100	1	100	    0	0	0	0	0	0	0	0	0	0	0	0;
	6	0	    12.2	24	-6	 1.07	100	1	100	    0	0	0	0	0	0	0	0	0	0	0	0;
	8	0	    17.4	24	-6	 1.09	100	1	100	    0	0	0	0	0	0	0	0	0	0	0	0;
];

%% branch data
%	fbus	tbus	r	x	b	rateA	rateB	rateC	ratio	angle	status	angmin	angmax
mpc.branch = [
	1	2	0.0183	0.0649	0	0	0	0	0	0	1	-360	360;
	1	5	0.0505	0.2032	0	0	0	0	0	0	1	-360	360;
	2	3	0.0451	0.1976	0	0	0	0	0	0	1	-360	360;
	2	4	0.0549	0.1774	0	0	0	0	0	0	1	-360	360;
	2	5	0.0529	0.1814	0	0	0	0	0	0	1	-360	360;
	3	4	0.0626	0.1756	0	0	0	0	0	0	1	-360	360;
	4	5	0.0132	0.0442	0	0	0	0	0	0	1	-360	360;
	4	7	0	0.2138	0	0	0	0	0	0	1	-360	360;
	4	9	0	0.5172	0	0	0	0	0	0	1	-360	360;
	5	6	0	0.2704	0	0	0	0	0	0	1	-360	360;
	6	11	0.0866	0.2052	0	0	0	0	0	0	1	-360	360;
	6	12	0.1298	0.2524	0	0	0	0	0	0	1	-360	360;
	6	13	0.0608	0.1326	0	0	0	0	0	0	1	-360	360;
	7	8	0	0.1658	0	0	0	0	0	0	1	-360	360;
	7	9	0	0.1029	0	0	0	0	0	0	1	-360	360;
	9	10	0.0316	0.0870	0	0	0	0	0	0	1	-360	360;
	9	14	0.1260	0.2903	0	0	0	0	0	0	1	-360	360;
	10	11	0.0885	0.1904	0	0	0	0	0	0	1	-360	360;
	12	13	0.2331	0.1803	0	0	0	0	0	0	1	-360	360;
	13	14	0.1594	0.3506	0	0	0	0	0	0	1	-360	360;
];

%%-----  OPF Data  -----%%
%% generator cost data
%	1	startup	shutdown	n	x1	y1	...	xn	yn
%	2	startup	shutdown	n	c(n-1)	...	c0
mpc.gencost = [
	2	0	0	3	0.0430292599	20	0;
	2	0	0	3	0.25	20	0;
	2	0	0	3	0.01	40	0;
	2	0	0	3	0.01	40	0;
	2	0	0	3	0.01	40	0;
];

%% bus names
mpc.bus_name = {
	'Bus 1     HV';
	'Bus 2     HV';
	'Bus 3     HV';
	'Bus 4     HV';
	'Bus 5     HV';
	'Bus 6     LV';
	'Bus 7     ZV';
	'Bus 8     TV';
	'Bus 9     LV';
	'Bus 10    LV';
	'Bus 11    LV';
	'Bus 12    LV';
	'Bus 13    LV';
	'Bus 14    LV';
};

% Warnings from cdf2matp conversion:
%
% ***** check the title format in the first line of the cdf file.
% ***** Qmax = Qmin at generator at bus    1 (Qmax set to Qmin + 10)
% ***** MVA limit of branch 1 - 2 not given, set to 0
% ***** MVA limit of branch 1 - 5 not given, set to 0
% ***** MVA limit of branch 2 - 3 not given, set to 0
% ***** MVA limit of branch 2 - 4 not given, set to 0
% ***** MVA limit of branch 2 - 5 not given, set to 0
% ***** MVA limit of branch 3 - 4 not given, set to 0
% ***** MVA limit of branch 4 - 5 not given, set to 0
% ***** MVA limit of branch 4 - 7 not given, set to 0
% ***** MVA limit of branch 4 - 9 not given, set to 0
% ***** MVA limit of branch 5 - 6 not given, set to 0
% ***** MVA limit of branch 6 - 11 not given, set to 0
% ***** MVA limit of branch 6 - 12 not given, set to 0
% ***** MVA limit of branch 6 - 13 not given, set to 0
% ***** MVA limit of branch 7 - 8 not given, set to 0
% ***** MVA limit of branch 7 - 9 not given, set to 0
% ***** MVA limit of branch 9 - 10 not given, set to 0
% ***** MVA limit of branch 9 - 14 not given, set to 0
% ***** MVA limit of branch 10 - 11 not given, set to 0
% ***** MVA limit of branch 12 - 13 not given, set to 0
% ***** MVA limit of branch 13 - 14 not given, set to 0
