unlink("inst/extdata", recursive = TRUE, force = TRUE)
dir.create("inst/extdata")
dir.create("inst/extdata/sub")

saveRDS(datasets::mtcars, "inst/extdata/mtcars.rds")
saveRDS(datasets::chickwts, "inst/extdata/chickwts.rds")
write.csv(datasets::chickwts, "inst/extdata/chickwts.csv", row.names = FALSE)
saveRDS(datasets::trees, "inst/extdata/trees.rds")
saveRDS(datasets::chickwts, "inst/extdata/sub/chickwts.rds")
