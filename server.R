rm(list=ls())
options(stringsAsFactors=FALSE)

##########################
### Generating Random Data
##########################

shinyServer(function(input, output) {

# 	dataset <- reactive({
# 	    if (is.null(input$files)) {
# 	      # User has not uploaded a file yet
# 	    } else {
# 	    	print(input$files$datapath)
# 	    	get_rda <- function(rda){
# 	    		x = load(rda)
# 	    		df <- get(x[1])
# 	    		rm(list=x)
# 	    		return(df)
# 	    	}
# 	    	df <- switch(input$dtype, 
# 	    		"csv" = read.csv(input$files$datapath, header=TRUE, stringsAsFactors =TRUE),
# 	    			"xls" = read.xlsx(input$files$datapath, 1),
# 	    			"rda" = get_rda(input$files$datapath))	    	
# 	    }
# 	    #print("FILES")
# 	    #print(head(df))
# 	    #print(input$files)
# 	   
# 	})


  output$mod_linear_text <- renderPrint( {
    if (!is.null(input$files$datapath)) {
      cat("Running Code\n\n")
#       print(input$files$datapath)
      sink("sink-examp.txt")
      source(input$files$datapath, echo=FALSE, print.eval=FALSE)
      sink()
      unlink("sink-examp.txt")    
      
      #### example of a check
      if (abs(mod$coefficients["x"] - 1.900975) > 0.0001) {
        cat("\nModel is wrong")
        stop("wrong MOD")
      } else {
        cat("\nModel is Correct!")
      }
    }
                                         
  })

  



})
