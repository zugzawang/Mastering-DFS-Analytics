# internal function to select_if non-zero columns
.any_non_zero <- function(x) {
  any(x != 0)
}

#' @title Archetype Prep
#' @name archetype_prep
#' @description prepare a plaer box score for archetypal analysis
#' @export archetype_prep
#' @importFrom dplyr %>%
#' @importFrom dplyr group_by
#' @importFrom dplyr select
#' @importFrom dplyr select_if
#' @importFrom dplyr filter
#' @importFrom dplyr ungroup
#' @importFrom dplyr summarize_if
#' @importFrom dplyr arrange
#' @importFrom tibble column_to_rownames
#' @param pbs player box score
#' @return an "as" object from archetypes::stepArchetypes

archetype_prep <- function(pbs) {

  # figure out which team each player is currently on
  current_team <- pbs %>%
    group_by(player_full_name) %>%
    filter(date == max(date)) %>%
    select("player_full_name", "position", "own_team") %>%
    ungroup() %>%
    arrange(player_full_name)
  leftmost <- 8 # leftmost numeric in a box score row
  rightmost <- ncol(pbs) # rightmost numeric
  pbs_summary <- pbs %>%
    select(player_full_name, leftmost:rightmost) %>%
    group_by(player_full_name) %>%
    summarize_if(is.numeric, sum, na.rm = TRUE) %>%
    ungroup() %>%
    select_if(.any_non_zero) %>%
    arrange(player_full_name) %>%
    column_to_rownames(var = "player_full_name") %>%
    as.matrix()
  View(pbs)
  View(pbs_summary)
  # stop("Testing")
  return(list(current_team = current_team, pbs_summary = pbs_summary))
}

#' @title Archetype Search
#' @name archetype_search
#' @description search for the best archetypal analysis of real box score values
#' @export archetype_search
#' @importFrom dplyr %>%
#' @param pbs player box score
#' @return an "as" object from archetypes::stepArchetypes

archetype_search <- function(pbs) {

  # make input dataset
  arch_input <- archetype_prep(pbs)

  # run the archetypal analysis
  max_arch <- 6
  arch_data <- arch_input$pbs_summary
  set.seed(1924)
  arch_results <- archetypes::stepArchetypes(
    data = arch_data,
    method = archetypes::robustArchetypes,
    k = 1:max_arch,
    verbose = FALSE,
    nrep = 64)
  return(list(arch_input = arch_input, arch_results = arch_results))
}
