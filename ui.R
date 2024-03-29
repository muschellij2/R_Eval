library(shiny)
library(car)
source("server.R")
shinyUI(pageWithSidebar(

  headerPanel("Models!"),

  sidebarPanel(
  	helpText(HTML("All source available on <a href = \"https://github.com/muschellij2/Shiny_model\">Github</a>")),

    wellPanel(
    	# checkboxGroupInput("x_var", "Variables:",                    
    		# c("Enrollment GCS" = "Enrollment_GCS_Add",                      
    		# "Age" = "Age",                      
    		# "Pre-Randomization ICH (per 10cc)" = "ICH_Pre_Rand_10",                      
    		# "Surgery vs. Medical" = "Group_Assigned", 
    		# "End of Treatment ICH (per 10cc)" = "ICH_EOT_10", 
    		# "End of Treatment IVH (per 10cc)" = "IVH_EOT_10",
    		# "Less or equal to 15cc at EOT" = "Under_15cc"
    		# ), selected=c("Enrollment GCS", "Age", "Pre-Randomization ICH (per 10cc)", "Surgery vs. Medical")),
    fileInput("files", "Read Data", multiple=FALSE)
#     selectInput("dtype", "Data Type:",
#     	c("csv" = "csv",
# 	    "rda" = "rda")
    ) 

  ), 
  	mainPanel( htmlOutput(outputId = "mod_linear_text"),
		textOutput("fileName"),
		plotOutput(outputId = "main_plot")
    )

  
))
