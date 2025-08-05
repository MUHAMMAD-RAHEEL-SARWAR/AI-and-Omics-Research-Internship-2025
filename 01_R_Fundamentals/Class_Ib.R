# MUHAMMAD RAHEEL SARWAR_Class_Ib

# Module 1 Assignment Project



# Creating folders:raw_data, clean_data, scripts, results or Tasks, plots

dir.create("Raw Data")
dir.create("Clean Data")
dir.create("Scripts")
dir.create("Results")
dir.create("Tasks")
dir.create("Plots")



# Importing data from excel/csv file

patient_data = read.csv(file.choose())

View(patient_data)


# Viewing the data structure by using the following str function

str(patient_data)





# CONVERSIONS

# Convert height into factor
patient_data$diagnosis_fact = as.factor(patient_data$diagnosis)

# Check the structure
str(patient_data)

# Changing the levels
patient_data$diagnosis_fact = factor(patient_data$diagnosis_fact,
                              levels = c("Normal", "Cancer"))

# Checking levels
levels(patient_data$diagnosis_fact)




# Convert gender into factor
patient_data$gender_fact = as.factor(patient_data$gender)
levels(patient_data$gender_fact)

# Changing the levels
patient_data$gender_fact = factor(patient_data$gender_fact,
                              levels = c("Male", "Female"))

# Checking levels
levels(patient_data$gender_fact)

# Conversion into numeric
patient_data$gender_num = ifelse(patient_data$gender_fact == "Male", 1, 0)
class(patient_data$gender_num)






# Creating a new variable for smoking status as a binary factor

# Convert smoker into factor
patient_data$smoker_fact = as.factor(patient_data$smoker)
levels(patient_data$smoker_fact)


# Conversion into numeric
patient_data$smoking_status = ifelse(patient_data$smoker_fact == "No", 0, 1)
class(patient_data$smoking_status)





# Save as .R
# Go to save as and save it as .R

# Save as CSV
write.csv(patient_data, file = "Clean Data/patient_info_clean.csv")


# Saving entire Work-space
save.image(file = "MUHAMMAD_RAHEEL_SARWAR_Class_Ib_Assignment.RData")



