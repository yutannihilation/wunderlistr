% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/position.R
\name{wndr_position}
\alias{wndr_get_list_position}
\alias{wndr_get_subtask_position}
\alias{wndr_get_task_position}
\alias{wndr_position}
\alias{wndr_update_list_position}
\alias{wndr_update_subtask_position}
\alias{wndr_update_task_position}
\title{Positions API}
\usage{
wndr_get_list_position(id = NULL)

wndr_update_list_position(id, revision, values)

wndr_get_task_position(id = NULL)

wndr_update_task_position(id, revision, values)

wndr_get_subtask_position(id = NULL)

wndr_update_subtask_position(id, revision, values)
}
\arguments{
\item{id}{Position ID}

\item{revision}{Revision}

\item{values}{Positions}
}
\description{
A list of ordered, unique integers related to a users's lists or a list's tasks or a task's subtasks.
}
\examples{
\dontrun{
# get all list positions
p <- wndr_get_list_position()

# get a list position
wndr_get_list_position(id = 1111)

# update the list position
wndr_update_list_position(id = p$id[1], values = rev(p$values[[1]]), revision = p$revision[1])
}

}
\seealso{
\url{https://developer.wunderlist.com/documentation/endpoints/positions}
}

