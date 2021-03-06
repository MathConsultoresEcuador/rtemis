# dplot3.table.R
# ::rtemis::
# 2019 Efstathios D. Gennatas egenn.github.io

#' Simple HTML table
#'
#' Draw an html table using \code{plotly}
#'
#' @param x data.frame: Table to draw
#' @param ddSci Logical: If TRUE, apply \link{ddSci} to numeric columns. Default = TRUE
#' @param main Character: Table tile. Default = NULL
#' @param main.col Color: Title color. Default = "black"
#' @param main.x Float [0, 1]: Align title: 0: left, .5: center, 1: right. Default = 0
#' @param main.xanchor Character: "auto", "left", "right": plotly's layout xanchor for title. Default = "auto"
#' @param fill.col Color: Used to fill header with column names and first column with row names.
#' Default = "#18A3AC"  (teal)
#' @param table.bg Colot: Table background. Default = "white"
#' @param bg Color: Background. Default = "white"
#' @param line.col Color: Line color. Default = "white"
#' @param lwd Float: Line width. Default = 1
#' @param header.font.col Color: Header font color. Default = "white"
#' @param table.font.col Color: Table font color. Default = "gray20"
#' @param font.size Integer: Font size. Default = 14
#' @param font.family Character: Font family. Default = "Helvetica Neue"
#' @param margin List: plotly's margins. Default = \code{list(l = 0, r = 5, t = 30, b = 0, pad = 0)}
#' @author Efstathios D. Gennatas
#' @export

dplot3.table <- function(x,
                         .ddSci = TRUE,
                         main = NULL,
                         main.col = "black",
                         main.x = 0,
                         main.xanchor = "auto",
                         fill.col = "#18A3AC",
                         table.bg = "white",
                         bg = "white",
                         line.col = "white",
                         lwd = 1,
                         header.font.col = "white",
                         table.font.col = "gray20",
                         font.size = 14,
                         font.family = "Helvetica Neue",
                         padding = 10,
                         margin = list(l = 0, r = 5,
                                       t = 30, b = 0,
                                       pad = 0)) {

  # [ DEPENDENCIES ] ====
  if (!depCheck("plotly", "dplyr", verbose = FALSE)) {
    cat("\n"); stop("Please install dependencies and try again")
  }

  # Input ====
  x <- as.data.frame(x)
  if (.ddSci) x <- dplyr::mutate_if(x, is.numeric, ddSci)

  # Colnames ====
  if (!is.null(colnames(x))) colnames(x) <- paste0("<b>", colnames(x), "</b>")

  # Rownames ====
  if (!is.null(rownames(x))) rownames(x) <- paste0("<b>", rownames(x), "</b>")

  # plotly ====

  plt <- plotly::plot_ly(x)
  plt <- plotly::add_table(plt,
                           header = list(
                             line = list(width = lwd,
                                         color = c("rgba(255,255,255,0)",
                                                   plotly::toRGB(line.col))),
                             fill = list(color = c("rgba(255,255,255,0)",
                                                   plotly::toRGB(fill.col))),
                             align = c('right','center'),
                             font = list(color = plotly::toRGB(header.font.col),
                                         family = font.family,
                                         size = font.size)
                           ),
                           cells = list(
                             line = list(width = lwd,
                                         color = c(plotly::toRGB(line.col),
                                                   plotly::toRGB(fill.col))
                                         ),
                             fill = list(color = c(plotly::toRGB(fill.col),
                                                   plotly::toRGB(table.bg))),
                             align = c('right', 'center'),
                             font = list(color = c(plotly::toRGB(header.font.col),
                                                   plotly::toRGB(table.font.col)),
                                         family = font.family,
                                         size = font.size)
                           ))

  # layout ====
  main <- paste0("<b>", main, "</b>")
  plt <- plotly::layout(plt,
                        title = list(text = main,
                                     font = list(family = font.family,
                                                 size = font.size,
                                                 color = main.col),
                                     x = main.x,
                                     xanchor = main.xanchor),
                        paper_bgcolor = plotly::toRGB(bg),
                        margin = margin)

  # Remove padding
  plt$sizingPolicy$padding <- padding

  plt

} # rtemis::dplot3.table
