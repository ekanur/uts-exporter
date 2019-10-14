
install.packages("pdfsearch")

install.packages("pdftools")
library(pdftools)
library("pdfsearch")
txt <- pdf_text("./pdf/uts_keamanan jaringan.pdf")
cat(txt[1])
txt_split <- unlist(strsplit(txt_split, "\n"))
print(txt_split[0:30])
grep("Nama|Student Score|Time Spent|NIS", txt_split, value=TRUE)
length(grep("Student Score", txt_split, value=TRUE))
txt_splitted <- grep("Nama|Student Score|Time Spent|NIS", txt_split, value=TRUE)
print(txt_splitted[0:56])

df_uts.data <- data.frame(
  nis = grep("NIS", txt_splitted, value=TRUE),
  nama = grep("Nama", txt_splitted, value=TRUE),
  skor = grep("Student Score", txt_splitted, value=TRUE),
  time_spent = grep("Time Spent", txt_splitted, value=TRUE)
)

length(df_uts.data$skor)

print(df_uts.data)
df_uts.data$nis <- gsub("NIS", "", df_uts.data$nis)
df_uts.data$nama <- gsub("Nama", "", df_uts.data$nama)
df_uts.data$skor <- gsub("Student Score", "", df_uts.data$skor)
df_uts.data$time_spent <- gsub("Time Spent:", "", df_uts.data$time_spent)
print(df_uts.data)
df_uts.data <- data.frame(
  nis = trimws(df_uts.data$nis, which = c("left")),
  nama = trimws(df_uts.data$nama, which = c("left")),
  skor = trimws(df_uts.data$skor, which = c("left")),
  time_spent = trimws(df_uts.data$time_spent, which = c("left"))
)
print(df_uts.data)

write.csv(df_uts.data, "result/uts_keamanan_jaringan.csv")
