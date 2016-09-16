import <- function() {
  if (!exists("movies") || is.null(movies)) {
    movies <<- read.csv("../ml-latest-small/movies.csv")
  }
  if (!exists("ratings") || is.null(ratings)) {
    ratings <<- read.csv("../ml-latest-small/ratings.csv")
    ratings <<- ratings %>%
      mutate(
        week.day = weekdays(as.Date(as.POSIXct(timestamp, origin="1970-01-01")))
      )
  }
  if (!exists("ratings.por.filme") || is.null(ratings.por.filme)) {
    ratings.por.filme <<- read.csv("../ml-latest-small/ratings-por-filme.csv")
  }
  
  my_cor <<- function(df) {
    return(cor(df$rating, df$popularity))
  }
}