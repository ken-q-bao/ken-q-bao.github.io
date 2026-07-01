library(magick)

# get all .jpg files in the folder
jpg_files <- list.files("images", pattern = "\\.jpg$", full.names = TRUE)

# convert each to .webp
for (f in jpg_files) {
  img <- image_read(f)
  out <- sub("\\.jpg$", ".webp", f)
  image_write(img, out, quality = 80)
}
