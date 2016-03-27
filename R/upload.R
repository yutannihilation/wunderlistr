#' Upload API
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/upload}
#'
#' @export
wndr_upload <- function(filepath) {
  target_file <- httr::upload_file(filepath)

  message("Part1: Geting upload info...")

  res_part1 <- wndr_api(
    verb = "POST",
    path = "/api/v1/uploads",
    body = list(
      content_type  = target_file$type,
      file_name     = basename(target_file$path),
      file_size     = file.size(target_file$path)
    )
  )

  message("Part2: Upload to Amazon S3...")

  res_part2 <- httr::PUT(
    url = res_part1$part$url,
    config = httr::add_headers(
      `Authorization` = res_part1$part$authorization,
      `x-amz-date`    = res_part1$part$date,
      `Content-Type` = ""                             # They say Content-Type must be empty...
    ),
    body = target_file
  )

  httr::stop_for_status(res_part2)

  message("Part3: Marking the upload as finished...")

  wndr_api(verb = "PATCH",
           path = "/api/v1/uploads",
           id = res_part1$id,
           body = list(
             state = "finished"
           ))
}
