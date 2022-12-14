% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bhteds_helper_functions.R
\name{visualize_bhteds_demographics}
\alias{visualize_bhteds_demographics}
\title{BHTEDS Project Data Visualizations}
\usage{
visualize_bhteds_demographics(
  data = NULL,
  labels_data = NULL,
  county_filter = NULL,
  ref_county_filter = NULL,
  subset_filter = NULL,
  fiscal_year = NULL,
  stats_vars = NULL,
  ref_stat_type = "mean"
)
}
\arguments{
\item{data}{Dataframe containing BHTEDS dataset.}

\item{labels_data}{List containing variable names with associated label.
I.e. \code{var_lab_list["income2"] <- "Income Group"}.
Used to generate title and x-axis labels for plots.}

\item{county_filter}{String naming Michigan county to generate stats for (i.e. "Allegan").}

\item{ref_county_filter}{String naming Michigan county|ies| to compare against (i.e. "Barry").
Will take the mean of multiple counties.}

\item{subset_filter}{List in the format of \code{my_filters[["var"]] <- c("relational_operator", "value")}.
Subsets dataframe based on specified criteria.
Subsetting could result in empty dataframe.
Currently supports relational operators (!=, ==, >, <, >=, <=).
Currently only supports specifying one value per relation.
Perhaps easier to filter datframe beforehand before passing to function.}

\item{fiscal_year}{String naming part of title label for ggplot.}

\item{stats_vars}{Vector of BHTEDS variable names to generate visualizations for.}

\item{ref_stat_type}{currently "mean" or "sum".}

\item{...}{To be implemented.}
}
\value{
List containing all plots and tables generated.
}
\description{
Generates aggregate statistics for Michigan Behavioral Health Treatment Episode Data Set
and produces bar charts + summary tables to visualize statistics.
}
\details{
\code{ref_county_filter} is optional.
\code{subset_filter} is optional.
All other parameters are required.
}
\examples{
\dontrun{

# Specify variables to generate plot + tables for.
my_vars <- c(
"inttx", "srvset", "prevtrmt", "psacode", "ssacode", "tsacode", "opioid", "anyopioid", "daystx2", "ageyr10", "adultchild", "gender", "gendid", "pregnant",
"race", "ethnic", "educatGrp", "mrtlstat", "empstat", "income2", "veteran", "livargmt", "corrstat")

# Create labels for variables without one (or modify them).
var_lab_list["anyopioid"] <- "Medication Assisted Opioid Treatment (any opioid)"
var_lab_list["daystx2"] <- "Days to Treatment Group"
var_lab_list["ageyr10"] <- "Age Group"
var_lab_list["adultchild"] <- "Adult/Child"
var_lab_list["educatGrp"] <- "Education"
var_lab_list["income2"] <- "Income Group"

# Create filters to subset data.
my_filters <- list()
my_filters[["gender"]] <- c("==", "Female")

# Call function.
results <- visualize_demographics(
  data = lab0,
  labels_data = var_lab_list,
  county_filter = "Allegan",
  ref_county_filter = c("Barry", "Oakland"),
  subset_filter = my_filters,
  fiscal_year = "FY2022 Q1-Q3",
  stats_vars = my_vars)

names(results)

# Modify returned plots (ggplots) + tables (dataframes)
plot1 <- results[[1]]
plot1

table1 <- results[[2]]
table1 \%>\% kableExtra::kable()

plot2 <- results[[3]] + scale_x_discrete(labels = function(x) str_wrap(x, width = 12))
plot2

table1 <- results[[4]]
table1 \%>\% kableExtra::kable()
}

}
\author{
Joseph Jinn, \email{jinnjo@mail.gvsu.edu}
}
