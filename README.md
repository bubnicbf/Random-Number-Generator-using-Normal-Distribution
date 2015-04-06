# Random-Number-Generator-using-Normal-Distribution
generates a collection filled with 1000 normally distributed random (read pseudorandom) numbers with a mean of 1.0 and a standard deviation of 0.5

In computer simulations, especially in applications of the Monte-Carlo method, it is often desirable to generate values that are normally distributed. The algorithms listed below all generate the standard normal deviates, since a $N(μ, σ2)$ can be generated as $X = μ + σZ$, where $Z$ is standard normal. All these algorithms rely on the availability of a random number generator $U$ capable of producing uniform random variates.

  - The most straightforward method is based on the probability integral transform property: if $U$ is distributed uniformly on $(0,1)$, then $Φ−1(U)$ will have the standard normal distribution. The drawback of this method is that it relies on calculation of the probit function $Φ−1$, which cannot be done analytically. 
  - An easy to program approximate approach, that relies on the central limit theorem, is as follows: generate 12 uniform $U(0,1)$ deviates, add them all up, and subtract 6 – the resulting random variable will have approximately standard normal distribution. In truth, the distribution will be Irwin–Hall, which is a 12-section eleventh-order polynomial approximation to the normal distribution. This random deviate will have a limited range of (−6, 6).
  - The Box–Muller method uses two independent random numbers $U$ and $V$ distributed uniformly on $(0,1)$. Then the two random variables $X$ and $Y$

$$
    X = \sqrt{- 2 \ln U} \, \cos(2 \pi V) , \qquad
    Y = \sqrt{- 2 \ln U} \, \sin(2 \pi V) .
$$

will both have the standard normal distribution, and will be independent. This formulation arises because for a bivariate normal random vector $(X Y)$ the squared norm $X2 + Y2$ will have the chi-squared distribution with two degrees of freedom, which is an easily generated exponential random variable corresponding to the quantity $−2ln(U)$ in these equations; and the angle is distributed uniformly around the circle, chosen by the random variable $V$.

  - Marsaglia polar method is a modification of the Box–Muller method algorithm, which does not require computation of functions $sin()$ and $cos()$. In this method $U$ and $V$ are drawn from the uniform $(−1,1)$ distribution, and then $S = U2 + V2$ is computed. If $S$ is greater or equal to one then the method starts over, otherwise two quantities

$$
    X = U\sqrt{\frac{-2\ln S}{S}}, \qquad  Y = V\sqrt{\frac{-2\ln S}{S}}
$$

are returned. Again, $X$ and $Y$ will be independent and standard normally distributed.

  - The Ratio method is a rejection method. The algorithm proceeds as follows: 

1. Generate two independent uniform deviates $U$ and $V$
2. Compute $X = \sqrt{8/e} (V − 0.5)/U$
3. Optional: if $X2 ≤ 5 − 4e1/4U$ then accept $X$ and terminate algorithm
4. Optional: if $X2 ≥ 4e−1.35/U + 1.4$ then reject $X$ and start over from step 1
5. If $X2 ≤ −4 lnU$ then accept $X$, otherwise start over the algorithm.

  - The ziggurat algorithm is faster than the Box–Muller transform and still exact. In about 97% of all cases it uses only two random numbers, one random integer and one random uniform, one multiplication and an if-test. Only in 3% of the cases, where the combination of those two falls outside the "core of the ziggurat" (a kind of rejection sampling using logarithms), do exponentials and more uniform random numbers have to be employed.

