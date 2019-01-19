clc;
clear all;
close all;
Runs = 100;
ITER = 300;
m=2;
mulBestSoFar = NaN(Runs,ITER);
mulAverageFitness = NaN(Runs,ITER);
mulFinalSol = NaN(Runs,m);
Pc = 0.3;
Pm = 0.2;
scale = 0.2;
N=50;
Lo = [-4 -1.5];
Hi = [2 1];
dispStrAvg = "Average Final Solution   Average Optimum Fitness";
kStrAvg = "k";
k2StrAvg = "-k";
xStrAvg = "Generation";
yStrAvg = "Fitness Function";
legend1StrAvg = "Average Best So Far";
legend2StrAvg = "Average Mean Fitness";
dispStr = "Final Solution   Optimum Fitness";
kStr = "k";
k2Str = "-k";
xStr = "Generation";
yStr = "Fitness Function";
legend1Str = " Best So Far";
legend2Str = "Average Fitness";
for i = 1 : Runs
    [Population] = fir_gen(N,m,Lo,Hi);
    best_so_far = [];
    Average_fitness = [];
    for it = 1 : ITER
        [selection_probability,fit,ave_fit,max_fit,opt_sol]=fit_eval(Population,N,m);
        if it==1 
            best_so_far(it)=max_fit;
            final_sol = opt_sol;
        elseif max_fit>best_so_far(it-1)
            best_so_far(it) = max_fit;
            final_sol = opt_sol;
        else 
            best_so_far(it)=best_so_far(it-1);
        end
     end
     Average_fitness(it) = ave_fit;
     mulBestSoFar(i,it) = best_so_far(it);
     mulAverageFitness(i,it) = Average_fitness(it);
     for h=1:m
         mulFinalSol(i,h) = final_sol(h);
     end        
    [mating_pool]=g_roulette_wheel(Population,N,m,selection_probability);
    [new_pop]=crossover(mating_pool,Pc,N,m);
    [Population]=g_mutation(new_pop,Pm,N,m,scale,Hi,Lo);
end
drawFigure2(i,ITER,final_sol,best_so_far,Average_fitness,dispStr,kStr,k2Str,xStr,yStr,legend1Str,legend2Str);
avgMulBestSofar = mean(mulBestSoFar);
avgMulAverageFitness = mean(mulAverageFitness);
avgMulFinalSol = mean(mulFinalSol);
drawFigure(ITER,avgMulFinalSol,avgMulBestSofar,avgMulAverageFitness,dispStrAvg,kStrAvg,k2StrAvg,xStrAvg,yStrAvg,legend1StrAvg,legend2StrAvg);
