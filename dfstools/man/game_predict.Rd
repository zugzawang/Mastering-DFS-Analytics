% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rank_utils.R
\name{game_predict}
\alias{game_predict}
\title{Game predict}
\usage{
game_predict(model, schedule)
}
\arguments{
\item{model}{a model from mvglmmRank::mvglmmRank}

\item{schedule}{a data frame team names in "away" and "home" columns}
}
\value{
the schedule augmented with prediction columns
}
\description{
Creates a data frame with game predictions
}
