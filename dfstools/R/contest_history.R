#' @title Read DraftKings Contest History
#' @name read_draftkings_contest_history
#' @description Read a DraftKings contest history CSV into a tibble
#' @import readr
#' @export read_draftkings_contest_history
#' @param file CSV history file from DraftKings
#' @return a tibble of the contest history
#' @examples
#' \dontrun{
#' View(dfstools::read_draftkings_contest_history(
#' "~/Projects/draftkings/contest-standings/draftkings-contest-entry-history.csv"))
#' }

read_draftkings_contest_history <- function(file) {
	df <- read_csv(file, col_types = cols(
    Contest_Date_EST = col_character(),
    Entry_Fee = col_number(),
    Prize_Pool = col_number(),
    Winnings_Non_Ticket = col_number(),
    Winnings_Ticket = col_number()))

	# make database-friendly column names
	colnames(df) <- tolower(colnames(df))

	# convert the contest start time
	df$contest_date_est <- lubridate::ymd_hms(df$contest_date_est, tz = "EST5EDT")
	return(df)
}

#' @title Create DraftKings Database
#' @name create_draftkings_database
#' @description Create a new database from a contest history tibble
#' @export create_draftkings_database
#' @param draftkings_contest_history DraftKings contest entry history tibble
#' @param database_file a file for the SQLite database
#' @return a connection object to the database
#' @examples
#' \dontrun{
#' dk_history <- dktidy::read_draftkings_contest_history(
#' "~/Projects/draftkings/contest-standings/draftkings-contest-entry-history.csv")
#' db_connection <- create_draftkings_database(dk_history, "dk_database.sqlite3")
#' }

create_draftkings_database <- function(draftkings_contest_history, database_file) {
  connection <- DBI::dbConnect(RSQLite::SQLite(), database_file)
  DBI::dbWriteTable(connection,
                    "draftkings_contest_history", draftkings_contest_history)
  return(connection)
}
