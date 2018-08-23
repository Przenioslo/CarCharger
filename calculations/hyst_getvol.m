%% Voltage hysteresis and resistor values calculator
% Run this script as second to find actual voltage ranges using real,
% calculated resistor values

clear;
close all;

%% Input data
Vcc = 3.3;              % Comparator V+ rail voltage [V]

Ra = 390000;            % Top battery voltage divider resistor [Ohm]
Rb = 97600;             % Bottom battery voltage divider resistor [Ohm]
Rx = 100000;            % Rx resistor preliminary value [Ohm]

Ry = 240000;            % Real value similar to calculated earlier [Ohm]
Rh = 1800000;           % Real value similar to calculated earlier [Ohm]

%% Calculations

% Get real vl and vh
Ryh = Ry * Rh / (Ry + Rh);
vl = Vcc * Ryh / (Rx + Ryh);

Rxh = Rx * Rh / (Rx + Rh);
vh = Vcc * Ry / (Ry + Rxh);

% Get real battery voltage thresholds
V_batLo = vl / (Rb / (Ra + Rb));
V_batHi = vh / (Rb / (Ra + Rb));


%% print results
fprintf('\nActual battery voltage tresholds \n');
fprintf('V_batHi = %f [V] \n', V_batHi);
fprintf('V_batLo = %f [V] \n', V_batLo);
fprintf('Ra = %f [Ohm] \n', Ra);
fprintf('Rb = %f [Ohm] \n', Rb);
fprintf('Rx = %f [Ohm] \n', Rx);
fprintf('Ry = %f [Ohm] \n', Ry);
fprintf('Rh = %f [Ohm] \n', Rh);