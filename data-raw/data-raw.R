unlink("inst/extdata", recursive = TRUE, force = TRUE)
dir.create("inst/extdata")
dir.create("inst/extdata/sub")

saveRDS(head(datasets::mtcars), "inst/extdata/mtcars.rds")
saveRDS(head(datasets::chickwts), "inst/extdata/chickwts.rds")
write.csv(head(datasets::chickwts), "inst/extdata/chickwts.csv", row.names = FALSE)
saveRDS(head(datasets::trees), "inst/extdata/trees.rds")
saveRDS(head(datasets::chickwts), "inst/extdata/sub/chickwts.rds")
