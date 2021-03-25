%
% read the subsytems data from a sbml model and save them to a txt file togethger with the reactions data
%

%initialisation COBRA toolbox
initCobraToolbox(false)

changeCobraSolver('gurobi','all'); 

model = readCbModel('models\iMM1865.xml');

subSystems = [model.subSystems{:}];
reactions = model.rxns;

f = fopen('models\iMM865_subsystems.txt','wt');
sep = ';';

fprintf(f,strcat('rxn',sep,'subsystem','\n'));
for i = 1:length(reactions)
    fprintf(f,strcat(reactions{i},sep,subSystems{i},'\n'));
end

fclose(f);