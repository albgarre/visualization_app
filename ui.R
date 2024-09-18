
ui <- page(
  title = "visual",
  
  layout_column_wrap(
    # min_height = "400px",
    width = 1/2,
    
    selectInput("dataset", label = "Dataset",
                choices = c("mtcars", "iris", "ine")
    ),

    card(
      DTOutput("out_data")
    )
    
    
  ),
  
  layout_column_wrap(
    min_height = "400px",
    width = 1/2,
    
    card(
      checkboxInput("use_histo", label = "histogram"),
      
      conditionalPanel(condition = "input.use_histo",
                       selectInput("histo_x", "X", choices = c())
      ),
      
      checkboxInput("use_density", label = "density plot"),
      
      conditionalPanel(condition = "input.use_density",
                       selectInput("density_x", "X", choices = c()),
                       selectInput("density_colour", "colour", choices = c())
      ),
      
      checkboxInput("use_point", label = "scatter plot"),
      
      conditionalPanel(condition = "input.use_point",
                       selectInput("point_x", "X", choices = c()),
                       selectInput("point_y", "Y", choices = c()),
                       selectInput("point_colour", "colour", choices = c())
      ),
      
      checkboxInput("use_line", label = "line plot"),
      
      conditionalPanel(condition = "input.use_line",
                       selectInput("line_x", "X", choices = c()),
                       selectInput("line_y", "Y", choices = c()),
                       selectInput("line_colour", "colour", choices = c())
      ),
      
      checkboxInput("use_smooth", label = "smooth line"),
      
      conditionalPanel(condition = "input.use_smooth",
                       selectInput("smooth_x", "X", choices = c()),
                       selectInput("smooth_y", "Y", choices = c()),
                       selectInput("smooth_colour", "colour", choices = c()),
                       selectInput("smooth_type", "method", choices = c("lm", "loess"))
      ),
      
      checkboxInput("use_text", label = "scatter text"),
      
      conditionalPanel(condition = "input.use_text",
                       selectInput("text_x", "X", choices = c()),
                       selectInput("text_y", "Y", choices = c()),
                       selectInput("text_text", "label", choices = c()),
                       selectInput("text_colour", "colour", choices = c())
      ),
      
      checkboxInput("use_boxplot", label = "boxplot"),
      
      conditionalPanel(condition = "input.use_boxplot",
                       selectInput("boxplot_x", "X", choices = c()),
                       selectInput("boxplot_y", "Y", choices = c()),
                       selectInput("boxplot_colour", "colour", choices = c())
                       
      ),
      
      checkboxInput("use_violin", label = "violin plot"),
      
      conditionalPanel(condition = "input.use_violin",
                       selectInput("violin_x", "X", choices = c()),
                       selectInput("violin_y", "Y", choices = c())
      ),
      
      checkboxInput("use_count", label = "count plot"),
      
      conditionalPanel(condition = "input.use_count",
                       selectInput("count_x", "X", choices = c()),
                       selectInput("count_y", "Y", choices = c())
      )
    ),
    
    plotOutput("outplot")
    
  ),
  
  layout_column_wrap(
    width = 1/2,
    min_height = "400px",
    
    card(
      selectInput("grouping_var", "Grouping variable:", choices = c()),
      selectInput("target_var", "Target variable:", choices = c())
    ),
    
    
    tableOutput("summary_table")
  )
  
)
