\name{dist}
\alias{dist}
\title{
Details of the distributions
}
\description{
An object that specifies the distribution to be fitted by the \code{MGLMfit} function, or the regression model to fitted by the \code{MGLMreg} or \code{MGLMsparsereg} functions.
Can be chosen from \code{"MN"}, \code{"DM"}, \code{"NegMN"}, or \code{"GDM"}.
}

%- maybe also 'usage' for other objects documented here.
\details{

\subsection{"MN": Multinomial distribution}{
Multinomial distribution models the counts of \eqn{d} possible outcomes.
The counts of categories are negatively correlated. 
The density of a \eqn{d} category count vector \eqn{y} with parameter 
\eqn{p=(p_1, \ldots, p_d)} is
\deqn{
P(y|p)= {m \choose y_1, \ldots, y_d} \prod_{j=1}^d p_j^{y_j},
}
where \eqn{m = \sum_{j=1}^d y_j}, \eqn{0<p_j<1}, and \eqn{\sum_{j=1}^d p_j = 1}.

With \code{dist="MN"}, the function \code{\link{MGLMreg}} calculates the MLE of regression coefficients \eqn{\beta_j} of the multinomial logit model, which has link function \eqn{p_j = exp(X\beta_j)/ (1 + \sum_{j=1}^{d-1} exp(X\beta_j))}, \eqn{j=1,\ldots,d-1}. With \code{dist="DM"}, the function \code{\link{MGLMsparsereg}} fits regularized multinomial logit model.
}

\subsection{"DM": Dirichlet multinomial distribution}{

When there is overdispersion in the multivariate count data, the traditional 
multinomial model is insufficient.  Dirichlet multinomial distribution models the
probabilities of the categories by a Dirichlet distribution.  
The density of a \eqn{d} category count vector \eqn{y}, with 
parameter \eqn{\alpha = (\alpha_1, \ldots, \alpha_d)},
\eqn{\alpha_j>0}, is
\deqn{
P(y|\alpha) =
 {m \choose y_1, \ldots, y_d} \prod_{j=1}^{d} 
 \frac{\Gamma(\alpha_j+y_j)}{\Gamma(\alpha_j)}
  \frac{\Gamma(\sum_j \alpha_j)}{\Gamma(\sum_j \alpha_j + \sum_j y_j)},
 }
where \eqn{m = \sum_{j=1}^d y_j}.

With \code{dist="DM"}, the function \code{\link{MGLMfit}} calculates the maximum likelihood estimate (MLE) of \eqn{(\alpha_1, \ldots, \alpha_d)}. With \code{dist="DM"}, the function \code{\link{MGLMreg}} calculates the MLE of regression coefficients \eqn{\beta_j} of the Dirichlet multinomial regression model, which has link function \eqn{\alpha_j = exp(X\beta_j)}, \eqn{j=1,\ldots,d}. With \code{dist="DM"}, the function \code{\link{MGLMsparsereg}} fits regularized Dirichlet multinomial regression model.
}

\subsection{"GDM": Generalized Dirichlet multinomial distribution}{

The more flexible Generalized Dirichlet multinomial model can be used when the counts of categories have both positive and negative correlations. 
The probability mass of a count vector \eqn{y} over \eqn{m} trials with parameter
\eqn{(\alpha, \beta)=(\alpha_1, \ldots, \alpha_{d-1}, \beta_1, \ldots, \beta_{d-1})},
\eqn{\alpha_j, \beta_j >0}, is
\deqn{
P(y|\alpha,\beta)
={m \choose y_1, \ldots, y_d} \prod_{j=1}^{d-1} 
\frac{\Gamma(\alpha_j+y_j)}{\Gamma(\alpha_j)}
\frac{\Gamma(\beta_j+z_{j+1})}{\Gamma(\beta_j)}
\frac{\Gamma(\alpha_j+\beta_j)}{\Gamma(\alpha_j+\beta_j+z_j)}  ,
}
where \eqn{z_j = \sum_{k=j}^d y_k} and \eqn{m=\sum_{j=1}^d y_j}.

With \code{dist="GDM"}, the function \code{\link{MGLMfit}} calculates the MLE of \eqn{(\alpha, \beta)=(\alpha_1, \ldots, \alpha_{d-1}, \beta_1, \ldots, \beta_{d-1})}. With \code{dist="GDM"}, the function \code{\link{MGLMreg}} calculates the MLE of regression coefficients \eqn{\alpha_j, \beta_j} of the generalized Dirichlet multinomial regression model, which has link functions \eqn{\alpha_j=exp(X\alpha_j)} and \eqn{\beta_j=exp(X\beta_j)}, \eqn{j=1, \ldots, d-1}. With \code{dist="GDM"}, the function \code{\link{MGLMsparsereg}} fits regularized generalized Dirichlet multinomial regression model.
}

\subsection{"NegMN": Negative multinomial distribution}{

Both multinomial distribution and Dirichlet multinomial distribution are good for 
negatively correlated counts.  When the counts of categories are positively 
correlated, the negative multinomial distribution is preferred.  
The probability mass function of a \eqn{d} category count vector \eqn{y} with parameter
 \eqn{(p_1, \ldots, p_{d+1}, \beta)}, \eqn{\sum_{j=1}^{d+1}p_j=1}, \eqn{p_j>0}, \eqn{\beta>0}, is
\deqn{
P(y|p,\beta) =  {\beta+m-1 \choose m}  {m \choose y_1, \ldots, y_d} 
\prod_{j=1}^d p_j^{y_j} p_{d+1}^\beta \\
= \frac{\beta_m}{m!}  {m \choose y_1, \ldots, y_d}  
\prod_{j=1}^d p_j^{y_j} p_{d+1}^\beta,
}
where \eqn{m = \sum_{j=1}^d y_j}. 

With \code{dist="NegMN"}, the function \code{\link{MGLMfit}} calculates the MLE of \eqn{(p_1, \ldots, p_{d+1}, \beta)}. With \code{dist="NegMN"} and \code{regBeta=FALSE}, the function \code{\link{MGLMreg}} calculates the MLE of regression coefficients \eqn{(\alpha_1,\ldots,\alpha_d,\beta)} of the negative multinomial regression model, which has link function \eqn{p_{d+1} = 1/(1 + \sum_{j=1}^d exp(X\alpha_j))}, \eqn{p_j = exp(X\alpha_j) p_{d+1}}, \eqn{j=1, \ldots, d}. When \code{dist="NegMN"} and \code{regBeta=TRUE}, the overdispersion parameter is linked to covariates via \eqn{\beta=exp(X\alpha_{d+1})}, and the 
function \code{MGLMreg} outputs an estimated matrix of 
\eqn{(\alpha_1, \ldots, \alpha_{d+1})}. With \code{dist="GDM"}, the function \code{\link{MGLMsparsereg}} fits regularized negative multinomial regression model.
}
}
\author{
Yiwen Zhang and Hua Zhou
}
%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{MGLMfit}}, \code{\link{MGLMreg}}, \code{\link{MGLMsparsereg}},
\code{\link{dmn}}, \code{\link{ddirm}}, \code{\link{dgdirm}}, \code{\link{dnegmn}}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{Models}
\keyword{Regression}
\keyword{Distribution fitting}
