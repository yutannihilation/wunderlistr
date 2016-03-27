context("create_scalar_list")

test_that("create_scalar_list returns error when all params are NULL", {
  expect_error(create_scalar_list(a = NULL))
  expect_error(create_scalar_list(a = NULL, b = NULL, c = NULL))
  expect_error(create_scalar_list())
})

test_that("create_scalar_list returns a scalar list when only one param is not NULL", {
  expect_equal(create_scalar_list(a = 1), list(a = 1))
  expect_equal(create_scalar_list(a = 1, b = NULL), list(a = 1))
})

test_that("create_scalar_list returns error when multiple params are not NULL", {
  expect_error(create_scalar_list(a = 1, b = 1))
  expect_error(create_scalar_list(a = 1, b = NULL, c = 1))
  expect_error(create_scalar_list(a = NULL, b = NULL, c = NULL, d = NULL))
})
