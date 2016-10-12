---
title: "Mastering DFS Analytics"
author: "M. Edward (Ed) Borasky"
date: "2016-10-12"
site: bookdown::bookdown_site
output: bookdown::gitbook
documentclass: book
bibliography: [book.bib, packages.bib]
biblio-style: apalike
link-citations: yes
---

# About the book
_Mastering DFS Analytics_ is a data-driven program to improve your daily fantasy sports results. You'll learn

* The math you need to make informed money management decisions,
* How projection systems and optimizers work,
* How to extract valuable information from your contest history and standings,

and much more.

Written by an applied mathematician, _Mastering DFS Analytics_ will give you contest-tested tools. In addition to the ebook, you get

* Software to manage your data and workflow,
* Membership on a private mailing list for readers,
* Leanpub's 100% Happiness Guarantee

## About the Indie Web

Comments? Questions? <a href="https://twitter.com/znmeb_dfs" rel="me">\@znmeb_dfs on Twitter</a>

----------

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">Mastering DFS Analytics</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://masteringdfsanalytics.com" property="cc:attributionName" rel="cc:attributionURL">M. Edward (Ed) Borasky</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.

----------

***[Mastering DFS Analytics on LeanPub](https://leanpub.com/masteringdfsanalytics)***

<!--chapter:end:index.Rmd-->

# How Daily Fantasy Sports Contests Work

> “When I use a word,’ Humpty Dumpty said in rather a scornful tone, ‘it
> means just what I choose it to mean — neither more nor less.’
>
> ’The question is,’ said Alice, ‘whether you can make words mean so
> many different things.’
>
> ’The question is,’ said Humpty Dumpty, ‘which is to be master — that’s
> all.’’
>
> - Lewis Carroll, Through the Looking Glass
> <http://www.goodreads.com/quotes/12608-when-i-use-a-word-humpty-dumpty-said-in-rather>

As I noted in the introduction, I’m a mathematician, as was Lewis
Carroll. One sometimes-infuriating habits we mathematicians have is our
wish to standardize words to mean just what we choose them to mean —
neither more nor less.

So, in this book, when I use the word “player”, it refers to real-world
athletes or their fantasy counterparts. “Game” refers to a real-world
game, for example, the Super Bowl. And the word “contest” refers to
fantasy sports contests; “contestant” refers to a person who enters
fantasy sports contests.

Daily fantasy contests work like this:

1.  Contestants sign up on a DFS site.

2.  Most sites have both free contests (“freerolls”) and paid ones.
    Contestants who wish to play the paid contests must deposit funds.

3.  Once a contestant is signed up, it’s off to the *Lobby*.

For a newcomer, the lobby can be quite bewildering, even though it will
usually have widgets to sort and filter all the available contests.
There are usually

-   multiple sports,

-   entry fees ranging from freerolls up to thousands of dollars,

-   payout structures ranging from simple head-to-head contests up to
    multi-player / multi-entry ones with cash or tickets to other
    contests as prizes, and

-   sizes ranging from two contestants up to *hundreds of thousands*.

Contests cover at least two real-world games, usually more. Once a
contestant chooses a contest to enter, they draft a *lineup* with
players from two or more games. The structure of a lineup usually
mirrors that of a real-world team. For example, a major league baseball
DFS lineup will usually have one or two pitchers, a catcher, four
infielders and three outfielders.

The most common form of a DFS contest is the *salary cap* draft. Each
player has a salary, usually given in thousands of dollars, and the sum
of the salaries for drafted players must not exceed the *salary cap*.

Once all the contestants have drafted their lineups and the real world
games start, fantasy players accrue points as their real-world
counterparts play. For example

-   Pitchers get points for innings pitched and strikeouts.

-   Pitchers lose points for giving up walks, hits and runs.

-   Batters get points for walks, hits, homers, RBIs and stolen bases.

-   Batters lose points if they get caught stealing a base.

-   Basketball players get points for baskets, assists, rebounds,
    steals, blocked shots, double-doubles, triple-doubles.

-   Basketball players lose points for turnovers.

When all the real-world games’ results are final, the DFS contestants’
scores are tallied. The contestants are then ranked. The payouts, if
any, are decided by where a contestant ranks.

For example, in a \$1 50/50 contest with 300 contestants, each
contestant pays a \$1 entry fee. At the end of the contest, the
highest-ranking 150 contestants win \$1.80 and the rest lose their
dollar.

<!--chapter:end:01_intro_to_dfs.Rmd-->

# Getting the Software

<!--chapter:end:02_getting_the_software.Rmd-->

# The Mathematics You Need to Know

## Random variables

A *random variable* (<https://en.wikipedia.org/wiki/Random_variable>) is
is a variable whose value is subject to variations due to chance
(i.e. randomness, in a mathematical sense). As we’ll see shortly, random
variables abound in daily fantasy sports.

A large part of the skill in DFS involves dealing with random variables.
There isn’t room in this ebook for a complete discussion of probability
theory, but there are certain parts a player absolutely must know to be
successful.

### Discrete random variables

There are two types of random variables, *discrete* and *continuous*.
Discrete random variables usually represent one of a finite set of
possibilities. For example, a roll of a pair of dice results in a total
between 2 and 12.

A discrete random variable has a *probability mass function*, which
specifies the probability for each of the possible outcomes. For
example, for the pair of dice, the probability mass function is

probability(total = 2) = 1/36

probability(total = 3) = 2/36

probability(total = 4) = 3/36

probability(total = 5) = 4/36

probability(total = 6) = 5/36

probability(total = 7) = 6/36

probability(total = 8) = 5/36

probability(total = 9) = 4/36

probability(total = 10) = 3/36

probability(total = 11) = 2/36

probability(total = 12) = 1/36

### Continuous random variables

A *continuous random variable* can take on any value, usually a real
number. For example, the heights of NBA players measured in inches would
specify a continuous random variable.

A continuous random variable has a probability density function. For
example, the familiar standardized Gaussian “bell-shaped curve”
(<https://en.wikipedia.org/wiki/Normal_distribution>) has the
probability density function

$$N(x)=\frac{1}{\sqrt{2\pi}}e^{-\frac{x^{2}}{2}}$$

### Random variables we see in DFS

Some random variables we see in daily fantasy sports:

-   The number of fantasy points a player accrues in a game (continuous)

-   The total fantasy points a lineup scores in a contest (continuous)

-   The rank of a lineup among the entries in a contest (discrete)

-   Whether the lineup cashed or not: 1 if it did, 0 if it
    didn’t (discrete)

## The Bernoulli and binomial distributions

The last entry in the list above - whether a lineup cashed or not - is
an example of a *Bernoulli* random variable
(<https://en.wikipedia.org/wiki/Bernoulli_distribution>). A Bernoulli
random variable has two possible outcomes, which in games we usually
refer to as “win” and “lose”.

To make calculations easier, we’ll use “1” for win and “0” for lose. The
probability of a win is usually denoted by the letter *$p$*. The
probability of a loss is usually denoted by the letter *$q$*; *$p+q=1$*
and *$q=1-p$*.

Bernoulli variables aren’t very interesting; we wouldn’t just enter one
lineup in one contest and walk away forever. So we need a random
variable that models how many times we cash over a number of contests.
And that’s a *binomial* random variable
(<https://en.wikipedia.org/wiki/Binomial_distribution>).

A binomial random variable has an underlying Bernoulli random variable
with parameters *$p$* and $q$. We ask the question, “If we enter *$N$*
contests, what’s the probability that we win none, one, two, and so on
up to *$N$*?” And that’s the probability mass function for the binomial,

If we know *$N$* and we know *$p$*, we can compute the probability of
winning exactly *$k$* contests out of *$N$* tries. That probability is

$$probability(wins=k)=\binom{N}{k}p^{k}q^{N-k}$$

where $\binom{N}{k}$ is the number of combinations of *$N$* things taken
*$k$* at a time. That’s interesting, but that doesn’t solve our problem.
We know *$N$* - how many contests we entered. And we know *$k$* - how
many of those contests we won. But we don’t know *$p$*. We need to know
*$p$* to calculate expected values.

It turns out we can estimate *$p$* easily. The estimate of *$p$* is just

$$p_{est}=\frac{k}{N}$$

and

$$q_{est}=1-p_{est}$$

So if I entered 100 50/50 contests and cashed 60 of them, the estimate
of *p* is 0.6 and the estimate of *q* is 0.4.

### Confidence interval for *p*

Before we move on to expectations, there’s one more tool we’ll need. It
turns out that not only can we estimate *$p$*, we can compute a
*confidence interval* for *$p$*
(<https://en.wikipedia.org/wiki/Binomial_proportion_confidence_interval>).

We want to say, “there’s a 95% probability that the value of *$p$* is
between *$p_{lower}$* and *$p_{upper}$*”. As the Wikipedia article above
notes, there are a number of options for doing this and all have certain
limitations. For our purposes, the simplest one that we can copy and
paste into a spreadsheet will do
(<https://en.wikipedia.org/wiki/Binomial_proportion_confidence_interval#Normal_approximation_interval>).
In the equations, *p~est~* is the estimate of *p* we computed above and
*q~est~ = 1 - p~est~*.

$$p_{lower}=p_{est}-1.96\sqrt{\frac{1}{N}\cdot p_{est}\cdot q_{est}}$$
$$p_{upper}=p_{est}+1.96\sqrt{\frac{1}{N}\cdot p_{est}\cdot q_{est}}$$

## Expectations

Now that we have an estimate and a confidence interval for $p$, we can
estimate how much we expect to win or lose per dollar of entry fees. For
a \$1 50/50, we pay a dollar to enter. If we win, we get \$1.80 back, so
we win \$0.80. If we lose, we lose the dollar. The estimated expectation
per dollar is

$$EV_{est}=p_{est}\cdot0.8-q_{est}$$

In general, if *$F$* is the entry fee in dollars and *$C$* is the cash
paid for a win in dollars, then

-   The winnings *$W$* per dollar is *$(C-F)/F$*

-   The loss *$L$* per dollar is $F/F=1$

-   The win/loss ratio *$wlratio$* is $\frac{W}{L}=\frac{C-F}{F}$

and the estimated expectation $EV_{est}$ is

$$EV_{est}=p_{est}\cdot wlratio-q_{est}$$

with confidence interval

$$EV_{lower}=p_{lower}\cdot wlratio-q_{lower}$$
$$EV_{upper}=p_{upper}\cdot wlratio-q_{upper}$$

In the spreadsheets, we’ll do this calculation for *$p_{est}$*,
*$p_{lower}$* and $p_{upper}$, generating a 95% confidence interval for
$EV$.

## Unfavorable, fair and favorable games

We say a game is *unfavorable* if its $EV$ is less than zero. We say
it’s *fair* if it’s exactly zero and *favorable* if it’s greater than
zero <span>\[</span>@Epstein2014, chapter 3<span>\]</span>. When we say
“unfavorable”, this is what we mean: if we keep playing this game
against *anyone*, eventually we’ll lose all our money to them.

In DFS, if $EV$ is less than zero, our bankroll will eventually get
wiped out, because we’re playing against both the site (the rake) and
the other contestants. If the game is fair - our $EV$ is exactly zero -
in theory we can keep playing indefinitely and not get wiped out, but we
also won’t grow our bankroll.

*So if we want to keep playing, and make money, we need a positive
expectation - a favorable game.* In DFS, the only way we can do that in
the absence of overlays is to have lineups that outscore enough of our
competitors to cover the rake with our winnings.

In the following, to keep the calculations simple, we are going to limit
ourselves to three types of contests with simple payout structures:

1.  FanDuel 50/50s,

2.  DraftKings 50/50s, and

3.  DraftKings Triple-Ups.

Note that we will *not* be dealing with head-to-head contests! Why? Two
reasons:

1.  Opponent research takes too much time, and

2.  The sample size is too small. In a head-to-head, we only get
    information about how our lineup stacks up against *one* contestant
    out of the thousands who enter the contests.

For a 50/50, either FanDuel or DraftKings, $wlratio$ is 0.8. For a
DraftKings Triple-Up, $wlratio$ is 2.0. We won’t be looking at FanDuel
Triple-Ups because they’re multi-entry, which makes the math more
complicated.

<!--chapter:end:03_probability_theory.Rmd-->

# Analyzing Contest Details

## Downloading and cleaning the data

### Downloading contest details from FanDuel {#downloading-contest-details-from-fanduel .unnumbered}

### Downloading contest details from DraftKings {#downloading-contest-details-from-draftkings .unnumbered}

## Cash game probabilities and expectations

## Tournament / GPP probabilities and expectations

<!--chapter:end:04_analyzing_contest_details.Rmd-->

# Analyzing Your FanDuel and DraftKings Contest History

## Downloading and cleaning the data


### Downloading contest history from FanDuel

-   Log in to FanDuel.

-   Select the ‘History’ button.

-   Press the ‘Download as CSV’ button.

-   Save the CSV file in your ‘Downloads’ folder.

### Downloading contest history from DraftKings

-   Log in to DraftKings.

-   Select ‘My Contests’ and then ‘History’.

-   Click the ‘Download Entry History’ link.

-   Save the CSV file in your ‘Downloads’ folder.

## Cash game probabilities and expectations

## Logistic regression plots

## Fantasy point and quantile rank density plots

<!--chapter:end:05_analyzing_your_contest_history.Rmd-->

# Analyzing DraftKings Contest Standings

## Downloading the contest standings CSV file

## Adding the contest information

## Adding the payout data

## Parsing the entry names

## Analyzing the results

<!--chapter:end:06_analyzing_contest_results.Rmd-->

# Analyzing Archetypal Athletes

<!--chapter:end:07_analyzing_archetypal_athletes.Rmd-->

# How Projection Systems Work

## Projecting game scores with mvglmmRank

## Projecting player fantasy points with glm

<!--chapter:end:08_projecting_game_scores.Rmd-->

# How Optimizers Work

## Current available optimizers

<!--chapter:end:09_how_optimizers_work.Rmd-->

