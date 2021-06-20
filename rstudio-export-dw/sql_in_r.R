# load library
library(RSQLite)

# see all files in directory
getwd()

# create connection between R and SQL database/file
conn <- dbConnect(SQLite(), "learn-sql/chinook.db")

# query data
dbListTables(conn)
dbListFields(conn, "customers")

dbGetQuery(conn, "
           SELECT firstname, 
           lastname,
           email, 
           country 
           FROM customers LIMIT 5")


usa_customers <- dbGetQuery(conn, "
           SELECT firstname, 
           lastname,
           email, 
           country 
           FROM customers 
           WHERE country = 'USA'")

# close connection when we are done
dbDisconnect(conn)

#### -----------------------------
#### create new database 
conn <- dbConnect(SQLite(), "learn-sql/shop.db")

locations <- data.frame(
  location_id = 1:5,
  location_city = c("London", 
                "Washington", 
                "Bangkok",
                "Seoul", 
                "Tokyo")
)

locations_2 <- data.frame(
  location_id = 6:10,
  location_city = c("Norway", 
                    "Holland", 
                    "Sweden",
                    "Denmark", 
                    "Iceland")
)

# write table to our database
dbWriteTable(conn, "locations", locations)
dbWriteTable(conn, "locations", locations_2, append = TRUE)

# see list of tables
dbListTables(conn)

# query
dbGetQuery(conn, "SELECT * FROM locations")

# disconnect database
dbDisconnect(conn)

#### ----- JOIN TABLE ----- #####

query <- "
  SELECT * FROM tracks 
  JOIN genres ON tracks.genreid = genres.genreid"

result <- dbGetQuery(conn, query)
View(result)

# clean column names
library(janitor)

result <- result %>%
  clean_names() %>%
  tibble()

result %>%
  select(song_name = name, 
         composer, 
         genre = name_2) %>%
  count(genre) %>%
  arrange( desc(n) )

# alternative in SQL
dbGetQuery(conn, "SELECT a.name, COUNT(*)
           FROM genres a 
           JOIN tracks b
           ON a.genreid = b.genreid
           GROUP BY 1
           ORDER BY 2 DESC")


















