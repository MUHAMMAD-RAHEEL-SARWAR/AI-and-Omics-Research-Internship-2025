# ===================================================================
#             AI and Omics Research Internship (2025)
# -------------------------------------------------------------------
#                Module I: Getting Started with R
# -------------------------------------------------------------------
#                   Class_2
# -------------------------------------------------------------------
#                        Assignment_2
# ===================================================================


# Define the classify_gene() function as specified in the assignment
classify_gene <- function(logFC, padj) {
  if (logFC > 1 & padj < 0.05) {
    return("Upregulated")
  } else if (logFC < -1 & padj < 0.05) {
    return("Downregulated")
  } else {
    return("Not_Significant")
  }
}

# Define the output directory and the list of files to process
output_dir <- "Results"
input_files <- c("DEGs_Data_1.csv", "DEGs_Data_2.csv")

# Create the Results folder if it does not already exist
if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}

# Prepare a list to store the processed data frames in R
processed_results <- list()

# Start the for-loop to process each file
for (file_name in input_files) {
  cat("\nProcessing file:", file_name, "\n")
  
  # 1. Import the data
  data <- read.csv(file_name)
  cat("File imported.\n")
  
  # 2. Handle missing padj values by replacing them with 1
  if ("padj" %in% names(data)) {
    data$padj[is.na(data$padj)] <- 1
    cat("Missing 'padj' values replaced with 1.\n")
  }
  
  # 3. Add a new 'status' column using the classify_gene function
  data$status <- mapply(classify_gene, data$logFC, data$padj)
  cat("New 'status' column created.\n")
  
  # 4. Save the processed file to the Results folder
  output_path <- file.path(output_dir, paste0("Processed_", file_name))
  write.csv(data, output_path, row.names = FALSE)
  cat("Processed file saved to:", output_path, "\n")
  
  # 5. Store the processed data frame in the R results list
  processed_results[[file_name]] <- data
}

# Print a summary of the results for each file
cat("\n--- Summary of Gene Classifications ---\n")
for (file_name in names(processed_results)) {
  cat("\nSummary for", file_name, ":\n")
  print(table(processed_results[[file_name]]$status))
}
