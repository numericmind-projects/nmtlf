# print function

nm_print <- function(path){
  pagedown::chrome_print(path)
}

listing_format = function(...){

  # locations of resource files in the package
  pkg_src = function(...) {
    system.file(..., package = "nmtlf")
  }

  li_paged_css <- pkg_src("rmarkdown/resources/li_paged.css")

  page_css <- paste0(getwd(), "/css/page.css")

  pagedown::html_paged(
    css =  c(page_css, li_paged_css),
    ...
    )

}

table_format = function(...){

  # locations of resource files in the package
  pkg_src = function(...) {
    system.file(..., package = "nmtlf")
  }

  tbl_paged_css <- pkg_src("rmarkdown/resources/tbl_paged.css")

  page_css <- paste0(getwd(), "/css/page.css")

  pagedown::html_paged(
    css =  c(page_css, tbl_paged_css),
    ...
  )
}
