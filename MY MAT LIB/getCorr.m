function  [ SROCC, KROCC, SPOCC ] = getCorr( a,b )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%myscore 这是自己的数�?
%然后load是另�?��数据
%求这两个数据的相关�?
%分别是�?SROCC�?
%和�?KROCC�?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% A1=corrcoef(a',b');
% SROCC1 = corr(a', b', 'type', 'spearman');
% KROCC1 = corr(a', b', 'type', 'kendall');
A1=corrcoef(a,b);
SROCC1 = corr(a, b, 'type', 'Spearman');
KROCC1 = corr(a, b, 'type', 'kendall');
SPOCC1 = corr(a, b, 'type', 'Pearson');
SROCC = SROCC1;
KROCC = KROCC1;
SPOCC = SPOCC1;

end