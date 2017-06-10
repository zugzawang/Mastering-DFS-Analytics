# internal function to select_if non-zero columns
.any_non_zero <- function(x) {
  any(x != 0)
}

## See <https://github.com/STAT545-UBC/Discussion/issues/451#issuecomment-264598618>
if(getRversion() >= "2.15.1")  utils::globalVariables(c(
  "player_full_name",
  "Back",
  "Bench",
  "Front",
  "own_team",
  "Player",
  "Player/Position",
  "position"
))

#' @title Archetype Prep
#' @name archetype_prep
#' @description prepare a plaer box score for archetypal analysis
#' @export archetype_prep
#' @importFrom dplyr %>%
#' @param pbs player box score
#' @return an "as" object from archetypes::stepArchetypes

archetype_prep <- function(pbs) {

  # figure out which team each player is currently on
  current_team <- pbs %>%
    dplyr::group_by(player_full_name) %>%
    dplyr::filter(date == max(date)) %>%
    dplyr::select(player_full_name, position, own_team) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(player_full_name)
  leftmost <- 8 # leftmost numeric in a box score row
  rightmost <- ncol(pbs) # rightmost numeric
  pbs_summary <- pbs %>%
    dplyr::select(player_full_name, leftmost:rightmost) %>%
    dplyr::group_by(player_full_name) %>%
    dplyr::summarize_if(is.numeric, sum, na.rm = TRUE) %>%
    dplyr::ungroup() %>%
    dplyr::select_if(.any_non_zero) %>%
    dplyr::arrange(player_full_name) %>%
    tibble::column_to_rownames(var = "player_full_name") %>%
    as.matrix()
  return(list(current_team = current_team, pbs_summary = pbs_summary))
}

#' @title Archetype Search
#' @name archetype_search
#' @description search for the best archetypal analysis of real box score values
#' @export archetype_search
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

#' @title Ternary Plot
#' @name ternary_plot
#' @description a visualization of a set of players using `ggtern`
#' @export ternary_plot
#' @import ggtern
#' @importFrom ggplot2 geom_point
#' @importFrom ggplot2 scale_colour_manual
#' @importFrom ggplot2 ggtitle
#' @param player_table a data frame with player archetype values
#' @param plot_title the plot title
#' @return a `ggplot` object

ternary_plot <- function(player_table, plot_title) {

  # colour-blind-friendly palette
  cbPalette <- RColorBrewer::brewer.pal(n = 12, name = "Paired")
  xdata <- dplyr::mutate(
    player_table,
    `Player/Position` = paste(Player, Position, sep = "/"))
  plot_object <- ggtern(
    data = xdata, mapping =
      aes(x = Front, y = Back, z = Bench)) +
    geom_point(
      aes(colour = `Player/Position`, shape = `Position`), size = 5) +
    theme_nomask() +
    scale_colour_manual(values = cbPalette) +
    ggtitle(plot_title) +
    Tlab("Back") +
    Llab("Front")
  return(plot_object)
}
