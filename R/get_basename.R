#' Determine the basename of an NetCDF file
#' 
#' This function determines the basename of either a file/URL path or an 'nc'
#' object (using nc$filename). 
#' 
#' When the origin of the file path is a local .nc
#' file then get_basename() is equivalent to base::basename().
#' 
#' get_basename() also handles the case of infile/nc being from
#' a URL to ensure the results always ends in ".nc". 
#' 
#' If both infile and nc are specified, infile is ignored. 
#' 
#'
#' @param infile Filename of input NetCDF file. This may include the directory
#'  (character).
#' @param nc Alternatively to `infile` you can instead specify the input as an
#'  object of class `ncdf4` (as returned from `ncdf4::nc_open`).
#'
#' @return A character string giving the basename
#' @export
#'
get_basename <- function(infile, nc = NULL) {
  if (!is.null(nc)) {
    # Get the basename of the filename of the nc object
    b <- basename(nc$filename)
  } else b <- basename(infile)
  # If the filename is a URL it may not end in ".nc" e.g. it may include a query at the end
  # If so, this extracts the part of the basename before ".nc"
  if (!endsWith(b, ".nc")) b <- paste0(sub(".nc.*", "", b), ".nc")
  return(b)
}