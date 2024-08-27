# Load the datasets
d1 <- read.table("notebook/data/student-mat.csv", sep=";", header=TRUE)
d2 <- read.table("notebook/data/student-por.csv", sep=";", header=TRUE)

# Perform an outer join (full join)
merged_data <- merge(d1, d2, by=c("school", "sex", "age", "address", "famsize", "Pstatus", "Medu", "Fedu", "Mjob", "Fjob", "reason", "nursery", "internet"), all=TRUE)

# Create a unique student ID based on the identifying columns
merged_data$student_id <- apply(merged_data[, c("school", "sex", "age", "address", "famsize", "Pstatus", "Medu", "Fedu", "Mjob", "Fjob", "reason", "nursery", "internet")], 1, paste, collapse="_")

# Replace NA values with -1 (to handle students only in one dataset)
merged_data[is.na(merged_data)] <- -1

# Print the number of unique students
cat("Total unique students:", length(unique(merged_data$student_id)), "\n")

# Save the final dataset to a CSV file
write.csv(merged_data, "notebook/data/combined_student_data.csv", row.names=FALSE)