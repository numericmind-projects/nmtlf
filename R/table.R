tbl_footer <- function (user, notes = "", first_col_width = "auto")
{
  if(notes == ""){
    footer <- paste0(user, ": ", getwd(), " ", toupper(format(Sys.time(), format = "%d%b%Y %H:%M")))
  }

  else{
    footer <- paste0(notes, " ", user, ": ", getwd(), " ", toupper(format(Sys.time(), format = "%d%b%Y %H:%M")))
  }

  page <- paste0(
    '@page {
    size: 279.4mm 215.9mm;
    margin: 38mm 25mm;
    @bottom-left {content: "',  footer, '"}
    @top-right {content: element(pageNum)}
  }

  .lightable-minimal tbody tr td:first-child {
    overflow-wrap: break-word;
    width:', first_col_width, '!important;
  }

    ')

  css_dir <- paste0(getwd(), "/css")
  if (!dir.exists(css_dir)) {dir.create(css_dir)}
  writeLines(page, paste0(getwd(), "/css/page.css"))
}



nm_table <- function(data, title, side_title, cols_n, col_width) {

  t <- c(t = cols_n)
  st <- c(st = cols_n)
  names(t) <- title
  names(st) <- side_title
  page_number <- c('<div class="pageNum"></div>' = cols_n)

kableExtra::kbl(data, align="l", escape = F, bootstrap_options = "basic") %>%
  kableExtra::kable_minimal(full_width = T, html_font = "Courier New", fixed_thead = T)  %>%
  kableExtra::add_header_above(header = page_number, escape = F, line = F, align = "r") %>%
  kableExtra::add_header_above(header = t, escape = F, line = F) %>%
  kableExtra::add_header_above(header = st, escape = F, line = F, align = "l") %>%
  kableExtra::row_spec(2:nrow(data)) %>%
  kableExtra::column_spec(1, extra_css = col_width)

}

