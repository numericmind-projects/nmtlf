# footer function

li_footer <- function (user, notes = "")
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
  }')

  css_dir <- paste0(getwd(), "/css")
  if (!dir.exists(css_dir)) {dir.create(css_dir)}
  writeLines(page, paste0(getwd(), "/css/page.css"))
}


# listing function

nm_listing <- function(data, title, side_title, side_category = "", footnotes = "", cols_n) {


  paged_li <- (
    '.pageNum, .pageNum:after {
  content: "Page " counter(page) " of " counter(pages);
  margin: -60px 0 0;
}

body{
    font-family: Courier New;
    font-size: 10pt;

  }

h1,h2,h3,h4,h5,h6{
    font-family: Courier New;
    font-size: 12pt;
  }

.lightable-minimal {
  width: 100%;
}

.lightable-minimal tbody tr td:first-child {
  width: 160px !important;
}

.lightable-minimal tbody tr td {
  width: 120px !important;
}

.lightable-minimal thead {
  border-bottom: 1.5px dashed #666;
  empty-cells: hide;

}


  .lightable-minimal thead tr:last-child th {
    border-bottom: none;
  }

.lightable-minimal tbody tr td:first-child {
  overflow-wrap: break-word;
  width: 500px;

}

.lightable-minimal tbody tr td {
  overflow-wrap: break-word;
  width: 80px;

}

.lightable-minimal { border-collapse: collapse; }

th {
  font-weight: normal !important;
}

.lightable-minimal tbody tr td:first-child {
    overflow-wrap: break-word;
    width: 160px !important;
    padding: 5px 0 5px !important;
}


.pagedjs_pagebox * {
    box-sizing: none !important;
}

.pagedjs_pages .pagedjs_margin .pagedjs_margin-content {
    width: 100%;
    margin: -110px 0px 0px;
}

/*page break in tables*/
div.pagebreak
    {
        page-break-after: always;
        page-break-inside: avoid;
    }

table { overflow: visible !important; }
thead { display: table-header-group }
tfoot { display:  table-footer-group; }
tr { page-break-inside: avoid }

');

  # page_li <- system.file("css/li_paged.css", package = "nmtlf")
  # file.copy(page_li , paste0(getwd(), "/css"))

  css_dir <- paste0(getwd(), "/css")
  if (!dir.exists(css_dir)) {dir.create(css_dir)}
  if (!file.exists(paste(css_dir, "/li_paged.css"))) {
    writeLines(paged_li, paste0(getwd(), "/css/li_paged.css"))
  }

  t <- c(t = cols_n)
  st <- c(st = cols_n)
  sc <- c(sc = cols_n)
  names(t) <- title
  names(st) <- side_title
  names(sc) <- side_category
  page_number <- c('<div class="pageNum"></div>' = cols_n)

  if(side_category != "") {
    kableExtra::kbl(data, align="l", escape = F, bootstrap_options = "basic") %>%
      kableExtra::kable_minimal(full_width = T, html_font = "Courier New") %>%
      kableExtra::add_header_above(header = sc, escape = F, line = F, align = "l") %>%
      kableExtra::add_header_above(header = page_number, escape = F, line = F, align = "r") %>%
      kableExtra::add_header_above(header = t, escape = F, line = F) %>%
      kableExtra::add_header_above(header = st, escape = F, line = F, align = "l")
  }

  else{
    kableExtra::kbl(data, align="l", escape = F, bootstrap_options = "basic") %>%
      kableExtra::kable_minimal(full_width = T, html_font = "Courier New") %>%
      kableExtra::add_header_above(header = page_number, escape = F, line = F, align = "r") %>%
      kableExtra::add_header_above(header = t, escape = F, line = F) %>%
      kableExtra::add_header_above(header = st, escape = F, line = F, align = "l")
  }

}
