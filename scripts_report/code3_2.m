%Sequence Generation Function
%Rijk van Wijk & Nicolaas du Plessis

function [seq1, seq2, seq3, seq4] = datagen(samples, omega)
    
seq1 = [0,1,-0.5,zeros(1,samples-3)].';

seq2 = [0,1,-2,zeros(1,samples-3)].';

n = linspace(0,samples-1,samples);
seq3 = cos(omega * n).';

seq4 = sign(randn(samples,1));

