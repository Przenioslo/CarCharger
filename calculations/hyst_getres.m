%% Voltage hysteresis and resistor values calculator
% Run this script first to find the preliminary resistors values

clear;
close all;

%% Input data

V_batLo = 11.3;         % Hysteresis bottom value on the car battery [V]
V_batHi = 11.9;         % Hysteresis top value on the car battery [V]
Vcc = 3.3;              % Comparator V+ rail voltage [V]

Ra = 390000;            % Top battery voltage divider resistor [Ohm]
Rb = 97600;             % Bottom battery voltage divider resistor [Ohm]
Rx = 100000;            % Rx resistor preliminary value [Ohm]

%% Calculations

% Battery voltage divider low and high values
vl = V_batLo * Rb / (Ra + Rb);
vh = V_batHi * Rb / (Ra + Rb);

% Rh to Rx ratio
Ratio_RhRx = vl / (vh - vl);

% Ry to Rx ratio
Ratio_RyRx = vl / (Vcc - vh);

Rh = Ratio_RhRx * Rx;
Ry = Ratio_RyRx * Rx;

%% print results
fprintf('\nInitial resistor values calculations \n');
fprintf('V_batHi = %f [V] \n', V_batHi);
fprintf('V_batLo = %f [V] \n', V_batLo);
fprintf('vl = %f [V] \n', vl);
fprintf('vh = %f [V] \n', vh);
fprintf('Ra = %f [Ohm] \n', Ra);
fprintf('Rb = %f [Ohm] \n', Rb);
fprintf('Rx = %f [Ohm] \n', Rx);
fprintf('Ry = %f [Ohm] \n', Ry);
fprintf('Rh = %f [Ohm] \n', Rh);