context("Helpers")

test_that("Test for blanks", {
    expect_true(is_blank(NA))
    expect_true(is_blank(NULL))
    expect_true(is_blank(""))
    expect_true(is_blank(c()))
    expect_false(is_blank(FALSE))
    expect_true(is_blank(FALSE, false_triggers=TRUE))
    expect_false(is_blank(1))
    expect_false(is_blank(function() 1))
})

test_that("Missing value imputation", {
    x <- c(1:3, NA)
    expect_that(fill(x, 3, 0), is_identical_to(c(1,2,0,NA)))
    expect_that(fill(x, is.na, 0), is_identical_to(na_fill(x, 0)))
})

test_that("dplyr integration", {
    x <- iris[-5]
    y <- iris$Species
    names(y) <- sprintf("orchid%03i", seq_along(y))
    cv <- resample("crossvalidation", y, nfold=3, nrepeat=2)
    procedures <- list(lda = modeling_procedure("lda"),
                       qda = modeling_procedure("qda"))
    result <- evaluate(procedures, x, y, resample=cv)

    # Normal subsetting
    r <- result %>% dplyr::select(fold = TRUE, method = TRUE, error = "error")
    expect_is(r, "data.frame")
    expect_identical(names(r), c("fold", "method", "error"))

    r <- result %>% dplyr::select(fold = TRUE, method=c("lda", "nsc"), error = "error")
    expect_identical(levels(r$method), "lda") # But not nsc!

    r <- result %>% dplyr::select(fold = TRUE, "lda", error = "error")
    expect_identical(names(r), c("fold", "error"))
    
    # Resampling
    r <- result %>% dplyr::select(fold = cv, "lda", "prediction", class="prediction")
    expect_is(r, "data.frame")
    expect_is(r$id, "character")
    expect_equal(dim(r %>% spread(fold, class)), c(nrow(iris), 1+length(cv)))

    r <- result %>% dplyr::select(fold = cv[1:3], "lda", "prediction", class="prediction")
    expect_equal(levels(r$Fold), names(cv)[1:3])

    # Functions
    r1 <- result %>% dplyr::select(fold = TRUE, method = TRUE, error = "error")
    r2 <- result %>% dplyr::select(fold = TRUE, method = TRUE, accuracy = function(x) 1-x$error)
    expect_equal(r1$error, 1-r2$accuracy)

    r <- result %>% dplyr::select(fold = TRUE, method = TRUE,
        function(x) data.frame(error=x$error, accuarcy = 1-x$error))
    expect_true(all(r$error + r$accuracy == 1))
})

test_that("subtree", {
    l <- list(A=list(a=1:3, b=4:6),
              B=list(a=7:9, b=0:1))
    expect_that(subtree(l, TRUE, "a"), is_a("matrix"))
    expect_that(subtree(l, TRUE, "b"), is_a("list"))
})

