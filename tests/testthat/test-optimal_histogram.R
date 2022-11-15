test_that("Function returns a ggplot object", {
  expect_s3_class(optimal_histogram(c(2, 3, 3, 3, 3, 4, 2, 2, 5, 5, 5, 5, 3), "Numbers"), "ggplot")
  expect_s3_class(optimal_histogram(c(2, 3, 3, 3, 3, 4, 2, 2, 5, 5, 5, 5, 3), "Height Range ID"), "ggplot")
  expect_s3_class(optimal_histogram(c(2, 3, 3, 3, 3, 4, 2, 2, 5, 5, 5, 5, 3), "Radius"), "ggplot")
})

test_that("Function returns a ggplot object even when x contains NAs", {
  expect_s3_class(optimal_histogram(c(2, 3, 3, 3, NA, 4, 2, 2, 5, 5, 5, 5, 3), "Numbers"), "ggplot")
  expect_s3_class(optimal_histogram(c(2, 3, 3, NA, NA, 4, NA, 2, 5, 5, 5, 5, 3), "Numbers"), "ggplot")
})

test_that("Function returns error if non-numeric input passed to x", {
  expect_error(optimal_histogram(c(2, 3, 3, 3, 4, 4, 2, 2, 5, 5, "B", "C", 5, 5, 3), "Random Numbers and Letters"))
  expect_error(optimal_histogram(vancouver_trees$genus_name, "Genus Name"))
  expect_error(optimal_histogram(vancouver_trees$plant_area, "Plant Area"))
})

test_that("Function returns error if argument passed to axis is not of type character", {
  expect_error(optimal_histogram(c(2, 3, 3, 3, 4, 4, 2, 2, 5, 5, 5, 5, 3), Numbers))
  expect_error(optimal_histogram(c(2, 3, 3, 3, 4, 4, 2, 2, 5, 5, 5, 5, 3), 3, ))
  expect_error(optimal_histogram(c(2, 3, 3, 3, 4, 4, 2, 2, 5, 5, 5, 5, 3), 3.4))
  expect_error(optimal_histogram(vancouver_trees$diameter, 3.4))
  expect_error(optimal_histogram(vancouver_trees$diameter, NA))
})

test_that("Function returns warning message if vector of length zero passed to x", {
  expect_warning(optimal_histogram(numeric(0), "No Numbers"), label = "length of x must be greater than 0")
})
