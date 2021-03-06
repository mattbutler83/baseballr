#' Process Baseball Savant CSV payload
#'
#' This is a helper function for all scrape_statcast_savant functions.
#' The function processes the initial csv payload acquired from
#' baseballsavant to ensure consistency in formattting across downloads
#' @param payload payload from a Baseball Savant request, e.g.
#' from \code{\link[readr]{read_csv}}
#' @keywords MLB, sabermetrics, Statcast
#' @importFrom dplyr mutate_
#' @export
#' @examples
#' \dontrun{
#' process_statcast_payload(payload)
#' }

process_statcast_payload <- function(payload) {

  # Clean up formatting of Baseball Savant download

  payload$game_date <- as.Date(payload$game_date, "%Y-%m-%d")
  payload$des <- as.character(payload$des)
  payload$game_pk <- as.character(payload$game_pk) %>% as.numeric()
  payload$hc_x <- as.character(payload$hc_x) %>% as.numeric()
  payload$hc_y <- as.character(payload$hc_y) %>% as.numeric()
  payload$on_1b <- as.character(payload$on_1b) %>% as.numeric()
  payload$on_2b <- as.character(payload$on_2b) %>% as.numeric()
  payload$on_3b <- as.character(payload$on_3b) %>% as.numeric()
  payload$release_pos_x <- as.character(payload$release_pos_x) %>% as.numeric()
  payload$release_pos_x <- as.character(payload$release_pos_x) %>% as.numeric()
  payload$hit_distance_sc <- as.character(payload$hit_distance_sc) %>% as.numeric()
  payload$launch_speed <- as.character(payload$launch_speed) %>% as.numeric()
  payload$launch_angle <- as.character(payload$launch_angle) %>% as.numeric()
  payload$pfx_x <- as.character(payload$pfx_x) %>% as.numeric()
  payload$pfx_z <- as.character(payload$pfx_z) %>% as.numeric()
  payload$plate_x <- as.character(payload$plate_x) %>% as.numeric()
  payload$plate_z <- as.character(payload$plate_z) %>% as.numeric()
  payload$vx0 <- as.character(payload$vx0) %>% as.numeric()
  payload$vy0 <- as.character(payload$vy0) %>% as.numeric()
  payload$vz0 <- as.character(payload$vz0) %>% as.numeric()
  payload$ax <- as.character(payload$ax) %>% as.numeric()
  payload$az <- as.character(payload$az) %>% as.numeric()
  payload$ay <- as.character(payload$ay) %>% as.numeric()
  payload$sz_bot <- as.character(payload$sz_bot) %>% as.numeric()
  payload$sz_top <- as.character(payload$sz_top) %>% as.numeric()
  payload$effective_speed <- as.character(payload$effective_speed) %>% as.numeric()
  payload$release_speed <- as.character(payload$release_speed) %>% as.numeric()
  payload$release_spin_rate <- as.character(payload$release_spin_rate) %>% as.numeric()
  payload$release_extension <- as.character(payload$release_extension) %>% as.numeric()
  payload$pitch_name <- as.character(payload$pitch_name)
  payload$home_score <- as.character(payload$home_score) %>% as.numeric()
  payload$away_score <- as.character(payload$away_score) %>% as.numeric()
  payload$bat_score	<- as.character(payload$bat_score) %>% as.numeric()
  payload$fld_score <- as.character(payload$fld_score) %>% as.numeric()
  payload$post_away_score <- as.character(payload$post_away_score) %>% as.numeric()
  payload$post_home_score	<- as.character(payload$post_home_score) %>% as.numeric()
  payload$post_bat_score <- as.character(payload$post_bat_score) %>% as.numeric()
  payload$post_fld_score <- as.character(payload$post_fld_score) %>% as.numeric()
  payload$zone <- as.character(payload$zone) %>% as.numeric()

  # Create a specific variable for barrels

  payload <- payload %>%
    dplyr::mutate_(
      barrel = ~ifelse(launch_angle <= 50 & launch_speed >= 98 & launch_speed * 1.5 - launch_angle >= 11 & launch_speed + launch_angle >= 124, 1, 0)
  )

  return(payload)

}
