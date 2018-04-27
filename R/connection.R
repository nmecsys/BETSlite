#' @title Connection with the server
#' @description  Make the connection with the server
#' @import DBI RMySQL RODBC  
#' @importFrom utils  install.packages
#' 

connection = function(){
    tryCatch({
        conn = dbConnect(MySQL(),db="bets",user="BETS_user",password="123456",host="200.18.49.107",port=3306)
        return(conn)
    },
    error = function(e){
       # message("Nao foi possivel se conectar ao servidor via RMySQL")
       # message("Tentando com RODBC")
        tryCatch({
            conn = odbcDriverConnect('Driver={MySQL ODBC 5.3 ANSI Driver};Server=200.20.164.178;Database=bets;
             User=BETS_user;Password=123456;Option=3;trusted_connection=false')
            return(conn)
        },
        error = function(e){
            #message("Nao foi possivel se conectar ao servidor via RODBC")
            #message("Tentando com DBI")
            tryCatch({
                if( suppressMessages(requireNamespace("odbc"))){
                    conn <- DBI::dbConnect(odbc::odbc(),
                                           driver = "MySQL ODBC 5.3 ANSI Driver",server = "200.20.164.178",database = "BETS",uid = "BETS_user",pwd = "123456")
                    return(conn)
                }else{
                   suppressMessages(install.packages("odbc"))
                    conn <- DBI::dbConnect(odbc::odbc(),
                                           driver = "MySQL ODBC 5.3 ANSI Driver",server = "200.20.164.178",database = "BETS",uid = "BETS_user",pwd = "123456")
                    return(conn)
                }
                
            },
            error = function(e){
                message("Desculpe mas nao foi possivel conectar ao servidor")
               x <- readline("You want to install a development version of RMySQL and DBI package packages? \n
                               (This may solve the connection problem)[Y/n]")
               if(x %in% c("y","Y","N","n","yes","Yes","YES","No","NO","no")){
                   if(requireNamespace("devtools")){
            
                       devtools::install_github("rstats-db/DBI")
                       devtools::install_github("rstats-db/RMySQL")
                       conn = dbConnect(MySQL(),db="bets",user="BETS_user",password="123456",host="200.20.164.178",port=3306)
                       return(conn)
                   }
                   
               }
            })
        })
    })
}


