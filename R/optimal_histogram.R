#' Optimal Histogram
#'
#' This function creates a histogram with the optimal bin-width, as calculated by the Freedman-Diaconis rule. It is a wrapper for geom_histogram().
#'
#' @param x A list containing values belonging to the following data types: numeric, integer or NA. This parameter is named x because it represents the numerical variable that will be plotted on the x-axis of this histogram.
#' @param axis An object of class "character", indicating the x-axis label. This parameter is named axis because its input is used create the label of the x-axis of the histogram.
#' @param ... Other parameters to pass to geom_histogram()
#'
#' @return A histogram plot that visualizes the distribution of x
#' @export
#' 
#' @examples
#' optimal_histogram(c(2, 3, 3, 3, 4, 4, 2, 2, 5, 5, 5, 5, 3), "Numbers")
#' optimal_histogram(c(2, 3, 3, 3, 5, 4, 2, 3, 2, 5, 4, 5, 1), "Mean Neutrophil Counts", fill = "darkgoldenrod4", color = "darkgoldenrod3", alpha = 0.5)
optimal_histogram <- function(x, axis, ...) {
  if (length(x) == 0) {
    warning("length of *x* must be greater than 0!")
    return(x)
  }
  stopifnot(is.na(x) | is.numeric(x) | is.integer(x))
  stopifnot(is.character(axis))
  
  x <- na.omit(x)
  
  optimal_bin_width <- ((IQR(x)) * 2) / (length(x)^(1 / 3))
  ggplot2::ggplot(mapping = ggplot2::aes(x)) +
    ggplot2::geom_histogram(binwidth = optimal_bin_width, ...) +
    ggplot2::labs(x = axis) +
    ggplot2::theme_linedraw()
}