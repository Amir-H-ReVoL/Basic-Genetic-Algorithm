function[mating_pool]=g_roulette_wheel(Population,N,m,selection_probability)
mating_pool = NaN(N,m);
cdf = cumsum(selection_probability);
for i=1:N
    r=rand;
    for j=1:N
        if r<=cdf(j)
            mating_pool(i,:)=Population(j,:);
            break;
        end
    end
end
return;
