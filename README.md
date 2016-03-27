R binding for Wunderlist API
===================
[![Travis-CI Build Status](https://travis-ci.org/yutannihilation/wunderlistr.svg?branch=master)](https://travis-ci.org/yutannihilation/wunderlistr)

## Wunderlist API

Official documentation is here: https://developer.wunderlist.com/documentation

## Installation

```r
devtools::install_github("yutannihilation/wunderlistr")
```

## Usage

### Authentication

At first, you have to get token and cache it locally. The token is cached as an environmental variable and optionally as a local file `.httr-oauth` (The latter is done by **httr** package).

```r
library(wunderlist)

wndr_access_token()
#> [1] "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
```

If you want to change whether or not to save token as a file, you can edit `httr_oauth_cache` option.

```r
options("httr_oauth_cache") <- FALSE
```

### Examples

```r
# get lists
l <- wndr_get_list()
l

# get tasks
t <- wndr_get_task(list_id = l$id[1])
t

# add a subtask to the task
s <- wndr_create_subtask(task_id = t$id[1], title = "test")
s

# delete the subtask
wndr_delete_subtask(id = s$id, revision = s$revision)

# upload a file to the task
f <- wndr_create_file(task_id = t$id[1], filepath = "LICENSE")
f

# delete the file
wndr_delete_file(id = f$id, revision = f$revision)
```
