library(fs)

# Input and output directories
input_dir  <- "docs"
output_dir <- "docs_txt"

# Create output directory if needed
dir_create(output_dir)

# List all .html files
html_files <- dir_ls(input_dir, regexp = "\\.html$", type = "file")

# Loop through each HTML file and convert to TXT
for (f in html_files) {
  
  # Output filename
  out_file <- path(output_dir, paste0(path_ext_remove(path_file(f)), ".txt"))
  
  # Pandoc command
  cmd <- sprintf(
    'pandoc "%s" -o "%s" --from=html --to=plain',
    f, out_file
  )
  
  # Execute conversion
  system(cmd)
  
  message("Converted: ", f, " → ", out_file)
}
