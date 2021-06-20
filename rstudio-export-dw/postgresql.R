# library
library(RPostgreSQL)

# create connection to our PostgreSQL server
conn <- dbConnect(PostgreSQL(),
                  user = "qafimmmb",
                  password = "IGfG1_1j3AUDAH51Q1o0YS1erJ80ypOT",
                  host = "arjuna.db.elephantsql.com",
                  port = 5432)

conn

# list table
dbListTables(conn)

# write table
(students <- data.frame(
  id = 1:3,
  firstname = c("John", "William", "Marry")
))

dbWriteTable(conn, "students", students)

# query data from our server
dbGetQuery(conn, "select * from students;")

# execute create table
query <- "
  CREATE TABLE student_profile (
    id INT,
    major VARCHAR(20),
    submajor VARCHAR(20)
  )
"

query2 <- "
  INSERT INTO student_profile VALUES
    (1, 'Economics', 'Econometrics'),
    (2, 'Data Science', 'Databases'),
    (3, 'Data Science', 'Machine Learning')
"

# create table
dbExecute(conn, query)
dbExecute(conn, query2)

# list tables
dbListTables(conn)
dbGetQuery(conn, "select * from student_profile")

# drop table
dbExecute(conn, "DROP TABLE student_profile")
dbExecute(conn, "DROP TABLE students")

# close connection
dbDisconnect(conn)






















