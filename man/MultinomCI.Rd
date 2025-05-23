\name{MultinomCI}
\alias{MultinomCI}

\title{Confidence Intervals for Multinomial Proportions}

\description{
Confidence intervals for multinomial proportions are often approximated by single binomial confidence intervals, which might in practice often yield satisfying results, but is properly speaking not correct. This function calculates simultaneous confidence intervals for multinomial proportions either according to the methods of Sison and Glaz, Goodman, Wald, Wald with continuity correction or Wilson.
}
\author{Pablo J. Villacorta Iglesias <pjvi@decsai.ugr.es>\cr
Department of Computer Science and Artificial Intelligence, University of Granada (Spain)
(Sison-Glaz)

Andri Signorell <andri@signorell.net>
(Goodman, Wald, Wilson, Fitzpatrick-Scott, Quesenberry-Hurst)
}
\usage{
MultinomCI(x, conf.level = 0.95, sides = c("two.sided", "left", "right"),
           method = c("sisonglaz", "cplus1", "goodman", "wald", "waldcc", 
                      "wilson", "qh", "fs"))
}
\arguments{
\item{x}{
A vector of positive integers representing the number of occurrences of each class. The total number of samples equals the sum of such elements.
}
  \item{conf.level}{ confidence level, defaults to 0.95. }

\item{sides}{a character string specifying the side of the confidence interval, must be one of \code{"two.sided"} (default),
\code{"left"} or \code{"right"}. You can specify just the initial letter. \code{"left"} would be analogue to a hypothesis of
\code{"greater"} in a \code{t.test}.}

  \item{method}{ character string specifing which method to use; can be one out of
  \code{"sisonglaz"}, \code{"cplus1"}, \code{"goodman"},  \code{"wald"},  \code{"waldcc"}, \code{"wilson"},
  \code{"qh"}, \code{"fs"}.
  Method can be abbreviated. See details. Defaults to \code{"sisonglaz"}. }


}
\details{
Given a vector of observations with the number of samples falling in each class of a multinomial distribution,
builds the simultaneous confidence intervals for the multinomial probabilities according to the method proposed by the mentioned authors.
The R code for Sison and Glaz (1995) has been translated from thes SAS code written by May and Johnson (2000). See the references for the other methods (qh = Quesenberry-Hurst, fs = Fitzpatrick-Scott).\cr
Some approaches for the confidence intervals can potentially yield negative results or values beyond 1. These would be reset such as not to exceed the range of [0, 1].
}
\value{
A matrix with 3 columns:
  \item{est}{estimate}
  \item{lwr.ci}{lower bound of the confidence interval}
  \item{upr.ci}{upper bound of the confidence interval}

The number of rows correspond to the dimension of x.

}
\references{
Fitzpatrick, S. and Scott, A. (1987). Quick simultaneous confidence interval for multinomial proportions. \emph{Journal of American Statistical Association} 82(399): 875-878.

Glaz, J., Sison, C.P. (1999) Simultaneous confidence intervals for multinomial proportions.
\emph{Journal of Statistical Planning and Inference} 82:251-262.

Goodman, L. A. (1965) On Simultaneous Confidence Intervals for Multinomial
Proportions \emph{Technometrics}, 7, 247-254.

May, W.L., Johnson, W.D.(2000) Constructing two-sided simultaneous confidence intervals for
multinomial proportions for small counts in a large number of cells. \emph{Journal of Statistical Software} 5(6) .
Paper and code available at \url{https://www.jstatsoft.org/v05/i06}.

Quesenberry, C.P. and Hurst, D.C. (1964). Large Sample Simultaneous Confidence Intervals for Multinational Proportions. \emph{Technometrics}, 6: 191-195.

Sangeetha, U., Subbiah, M., Srinivasan, M. R. (2013) Mathematical Analysis of propensity of aberration on the methods for interval estimation of the multinomial proportions.
\emph{IOSR Journal of Mathematics}, e-ISSN: 2278-5728,p-ISSN: 2319-765X, Volume 7, Issue 4 (Jul. - Aug. 2013), PP 23-28

Sison, C.P and Glaz, J. (1995) Simultaneous confidence intervals and sample size determination
for multinomial proportions. \emph{Journal of the American Statistical Association}, 90:366-369.

Wald, A. Tests of statistical hypotheses concerning several parameters when the number of observations is large, \emph{Trans. Am. Math. Soc.} 54 (1943) 426-482.

Wilson, E. B. Probable inference, the law of succession and statistical inference, \emph{J.Am. Stat. Assoc.} 22 (1927) 209-212.

}

\examples{
# Multinomial distribution with 3 classes, from which a sample of 79 elements
# were drawn: 23 of them belong to the first class, 12 to the
# second class and 44 to the third class. Punctual estimations
# of the probabilities from this sample would be 23/79, 12/79
# and 44/79 but we want to build 95\% simultaneous confidence intervals
# for the true probabilities

MultinomCI(c(23, 12, 44), conf.level=0.95)

# single sided
MultinomCI(c(23, 12, 44), conf.level=0.95, sides="left")
MultinomCI(c(23, 12, 44), conf.level=0.95, sides="right")


x <- c(35, 74, 22, 69)

MultinomCI(x, method="goodman")
MultinomCI(x, method="sisonglaz")
MultinomCI(x, method="cplus1")
MultinomCI(x, method="wald")
MultinomCI(x, method="waldcc")
MultinomCI(x, method="wilson")

# compare to
BinomCI(x, n=sum(x))

# example in Goodman (1965)
MultinomCI(x=c(91, 49, 37, 43), conf.level=0.95, method="goodman")

# example from Sison, Glaz (1999) in Sangeetha (2013) - Table 2
#
#    Wald          Wald_CC       Wilson        Quesenberry-Hurst
#    LL     UL     LL     UL     LL     UL     LL     UL
# 1	 0.090	0.149  0.089  0.150	 0.094	0.153  0.076  0.183
# 2  0.121	0.187  0.120  0.188	 0.124	0.190  0.104  0.222
# 3	 0.123	0.189  0.122  0.190	 0.126	0.192  0.106  0.225
# 4	 0.096	0.156  0.095  0.158	 0.099	0.160  0.081  0.191
# 5	 0.102	0.164  0.101  0.165	 0.105	0.167  0.087  0.198
# 6	 0.151	0.222  0.150  0.223	 0.154	0.224  0.131  0.258
# 7	 0.094	0.154  0.093  0.155	 0.097	0.157  0.080  0.188
 
#    Goodman        Fitzpatrick-Scott  Sison-Glaz	
#    LL     UL      LL     UL          LL    UL
# 1	 0.085	0.166   0.075  0.165       0.079	0.164
# 2	 0.115	0.204   0.109  0.200       0.114	0.199
# 3	 0.116	0.207   0.111  0.202       0.116	0.201
# 4	 0.091	0.173   0.081  0.172       0.086	0.171
# 5	 0.096	0.181   0.087  0.178       0.092	0.177
# 6	 0.143	0.239   0.141  0.232       0.146	0.231
# 7	 0.089	0.171   0.079  0.170       0.084	0.169

x <- c(56, 72, 73, 59, 62, 87, 58)
do.call(cbind, lapply(c("wald", "waldcc", "wilson", 
                        "qh", "goodman", "fs", "sisonglaz"),
                      function(m) round(MultinomCI(x, method=m)[,-1], 3)))
       
}

\keyword{univar}
