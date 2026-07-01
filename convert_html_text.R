# Load required packages
library(fs)

# Input and output directories
input_dir  <- "docs"
output_dir <- "docs_tex"

# Create output directory if it doesn't exist
dir_create(output_dir)

# List all .html files in /docs/
html_files <- dir_ls(input_dir, regexp = "\\.html$", type = "file")

# Loop through each HTML file and convert to TeX
for (f in html_files) {
  
  # Build output filename
  out_file <- path(output_dir, paste0(path_ext_remove(path_file(f)), ".tex"))
  
  # Pandoc command
  cmd <- sprintf(
    'pandoc "%s" -o "%s" --from=html --to=latex',
    f, out_file
  )
  
  # Run conversion
  system(cmd)
  
  message("Converted: ", f, " → ", out_file)
}
