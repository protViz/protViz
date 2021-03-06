#R

context("psm")
test_that("HTLNQIDSVK", {
    spec <- list(scans=1138,
        title="178: (rt=22.3807) [20080816_23_fetuin_160.RAW]",
         rtinseconds=1342.8402,
         charge=2,
         mZ=c(195.139940, 221.211970, 239.251780, 290.221750, 
         316.300770, 333.300050, 352.258420, 448.384360, 466.348830, 
         496.207570, 509.565910, 538.458310, 547.253380, 556.173940, 
         560.358050, 569.122080, 594.435500, 689.536940, 707.624790, 
         803.509240, 804.528220, 822.528020, 891.631250, 909.544400, 
         916.631600, 973.702160, 990.594520, 999.430580, 1008.583600, 
         1017.692500, 1027.605900),
         intensity=c(931.8, 322.5, 5045, 733.9, 588.8, 9186, 604.6,
         1593, 531.8, 520.4, 976.4, 410.5, 2756, 2279, 5819, 2.679e+05,
         1267, 1542, 979.2, 9577, 3283, 9441, 1520, 1310, 1.8e+04,
         587.5, 2685, 671.7, 3734, 8266, 3309)
         )

    m <- psm('HTLNQIDSVK', spec, plot=FALSE)

    b_assumed <- c(138.0662, 239.1139, 352.1979, 466.2409, 594.2994, 
        707.3835, 822.4104, 909.4425, 1008.5109, 1136.6058)

    lapply(1:length(m$fragmentIon$b), function(i){
        expect_equal(m$fragmentIon$b[i], b_assumed[i], tolerance=1e-03)
    })
})
