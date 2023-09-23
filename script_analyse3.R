#### CONF VARIABLES #####

pattern_to_be <- "_extr2.csv"

pattern_to_remove <- list("14000", "13800")

sep_ = ','

#######################

list_names <- list.files(path=".", pattern=NULL, all.files=FALSE, full.names=FALSE)

list_names_output <- list()

list_ <- list()

len_ = 0

lenb_ = 0

for (i in list_names){

  if (grepl(".csv", list_names[len_+1]) == TRUE){

  tr <- gsub(".csv", pattern_to_be, list_names[len_+1])

  list_names_output[[len_+1]] <- tr

  file_to_add <- read.csv(list_names[[len_+1]], sep=sep_)

  list_[[len_+1]] <- file_to_add

  lenb_ = lenb_ + 1

  }
  
  len_ = len_ + 1
  
}

len_ = len_ - (len_ - lenb_)

for (i in 1:len_){

        file_to_analyze <- list_[[i]]

        len2_ = 1
 
        for (i2 in list_[[i]][,1]){

                len2_ = len2_ + 1

        }

        i2 = 2

        df <- data.frame(file_to_analyze[1,])

        skip = 0

        while (i2 < len2_){

                x2 = 1

                for (x in pattern_to_remove){

                  if (pattern_to_remove[x2] %in% list_[[i]][i2,]){

                        skip = 1

                  }

                  x2 = x2 + 1

                }

                if (skip == 0){

                        df2 <- file_to_analyze[i2, ]

                        df <- rbind(df, df2)

                }

          skip = 0

          i2 = i2 + 1

        }

        name <- list_names_output[[i]]

        write.csv(df, name, row.names=FALSE)    

        rm(df)

}



