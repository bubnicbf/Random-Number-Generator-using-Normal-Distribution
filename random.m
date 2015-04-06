%Native support :
    mu = 1; sd = 0.5; 
    x = randn(1000,1) * sd + mu;
 
%The statistics toolbox provides this function
   x = normrnd(mu, sd, [1000,1]); 

%This script uses the Box-Mueller Transform to transform a number from the uniform distribution to a normal distribution of mean = mu0 and standard deviation = chi2.
  function randNum = randNorm(mu0,chi2, sz)
 
    radiusSquared = +Inf;
 
    while (radiusSquared >= 1)
        u = ( 2 * rand(sz) ) - 1;
        v = ( 2 * rand(sz) ) - 1;
 
        radiusSquared = u.^2 + v.^2;
    end
 
    scaleFactor = sqrt( ( -2*log(radiusSquared) )./ radiusSquared );
    randNum = (v .* scaleFactor .* chi2) + mu0;
 
end
