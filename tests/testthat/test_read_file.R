data_dir <- file.path("..", "testdata")

test_that("infile and nc input are consistent", {
  file_string <- file.path(data_dir, "ex_dayx.nc")
  file_nc <- nc_open(file_string)
  read_file_string <- read_file(infile = file_string, var_name = "SIS")
  read_file_nc <- read_file(nc = file_nc, var_name = "SIS")
  expect_equal(read_file_string, read_file_nc)
  nc_close(file_nc)
})
