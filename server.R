
server <- function(input, output) {
  
  ## Reactive for the data
  
  my_data <- reactiveVal()
  
  ## Update stuff when changing the dataset selector
  
  observeEvent(input$dataset, {
    
    ## Update the dataset
    
    d <- switch(input$dataset,
                mtcars = mtcars,
                iris = iris,
                ine = d_ine
    )
    
    my_data(d)
    
    
    ## Update the aesthetics
    
    updateSelectInput(inputId = "histo_x",
                      choices = names(d)
    )
    
    updateSelectInput(inputId = "density_x",
                      choices = names(d)
    )
    
    updateSelectInput(inputId = "point_x",
                      choices = names(d)
    )
    
    updateSelectInput(inputId = "point_y",
                      choices = names(d)
    )
    
    updateSelectInput(inputId = "line_x",
                      choices = names(d)
    )
    
    updateSelectInput(inputId = "line_y",
                      choices = names(d)
    )
    
    updateSelectInput(inputId = "smooth_x",
                      choices = names(d)
    )
    
    updateSelectInput(inputId = "smooth_y",
                      choices = names(d)
    )
    
    updateSelectInput(inputId = "text_x",
                      choices = names(d)
    )
    
    updateSelectInput(inputId = "text_y",
                      choices = names(d)
    )
    
    updateSelectInput(inputId = "text_text",
                      choices = names(d)
    )
    
    updateSelectInput(inputId = "boxplot_x",
                      choices = names(d)
    )
    
    updateSelectInput(inputId = "boxplot_y",
                      choices = names(d)
    )
    
    updateSelectInput(inputId = "violin_x",
                      choices = names(d)
    )
    
    updateSelectInput(inputId = "violin_y",
                      choices = names(d)
    )
    
    updateSelectInput(inputId = "count_x",
                      choices = names(d)
    )
    
    updateSelectInput(inputId = "count_y",
                      choices = names(d)
    )
    
    ## Update the colour aesthetics
    
    updateSelectInput(inputId = "density_colour",
                      choices = c("none", names(d))
    )
    
    updateSelectInput(inputId = "point_colour",
                      choices = c("none", names(d))
    )
    
    updateSelectInput(inputId = "line_colour",
                      choices = c("none", names(d))
    )
    
    updateSelectInput(inputId = "smooth_colour",
                      choices = c("none", names(d))
    )
    
    updateSelectInput(inputId = "text_colour",
                      choices = c("none", names(d))
    )
    
    updateSelectInput(inputId = "boxplot_colour",
                      choices = c("none", names(d))
    )
    
    ## Update the summary variables
    
    updateSelectInput(inputId = "grouping_var",
                      choices = c("none", names(d))
    )
    
    updateSelectInput(inputId = "target_var",
                      choices = names(d)
    )
    
    
  })
  
  # ## Str of the data
  # 
  # output$str_data <- renderPrint({
  #   str(my_data())
  # })
  
  ## Output of the table
  
  output$out_data <- renderDataTable({
    my_data()
  })
  
  ## Plot of the data
  
  output$outplot <- renderPlot({
    
    p <- ggplot(my_data())
    
    if (input$use_histo) {
      p <- p + geom_histogram(aes_string(x = input$histo_x))
    }
    
    if (input$use_density) {
      
      if (input$density_colour != "none") {
        
        p <- p + geom_density(aes(x = my_data()[[input$density_x]],
                                  colour = factor(my_data()[[input$density_colour]])
        ))
        
      } else {
        p <- p + geom_density(aes_string(x = input$density_x))
      }
    }
    
    if (input$use_point) {
      
      if (input$point_colour != "none") {
        
        p <- p + geom_point(aes(x = my_data()[[input$point_x]],
                                y = my_data()[[input$point_y]],
                                colour = factor(my_data()[[input$point_colour]])
        ))
        
      } else {
        p <- p + geom_point(aes_string(x = input$point_x, y = input$point_y))
      }
      
    }
    
    if (input$use_line) {
      
      if (input$line_colour != "none") {
        
        p <- p + geom_line(aes(x = my_data()[[input$line_x]],
                               y = my_data()[[input$line_y]],
                               colour = factor(my_data()[[input$line_colour]])
        ))
        
      } else {
        p <- p + geom_line(aes_string(x = input$line_x, y = input$line_y))
      }
      
    }
    
    if (input$use_smooth) {
      
      if (input$smooth_colour != "none") {
        
        p <- p + geom_smooth(aes(x = my_data()[[input$smooth_x]],
                                 y = my_data()[[input$smooth_y]],
                                 colour = factor(my_data()[[input$smooth_colour]])
                                 ),
                             method = input$smooth_type
                             )
        
      } else {
        p <- p + geom_smooth(aes_string(x = input$smooth_x, y = input$smooth_y),
                             method = input$smooth_type
                             )
      }
      
    }
    
    if (input$use_text) {
      
      if (input$text_colour != "none") {
        
        p <- p + geom_text(aes(x = my_data()[[input$text_x]],
                               y = my_data()[[input$text_y]],
                               label = my_data()[[input$text_text]],
                               colour = factor(my_data()[[input$text_colour]])
        ))
        
      } else {
        p <- p + geom_text(aes_string(x = input$text_x, y = input$text_y, label = input$text_text))
      }
      
    }
    
    if (input$use_boxplot) {
      
      
      if (input$boxplot_colour != "none") {
        
        p <- p + geom_boxplot(aes(x = factor(my_data()[[input$boxplot_x]]),
                                  y = my_data()[[input$boxplot_y]],
                                  colour = factor(my_data()[[input$boxplot_colour]])
        ))
        
      } else {
        
        p <- p + geom_boxplot(aes(x = factor(my_data()[[input$boxplot_x]]), y = my_data()[[input$boxplot_y]]))
        
      }
    }
    
    if (input$use_violin) {
      p <- p + geom_violin(aes(x = factor(my_data()[[input$violin_x]]), y = my_data()[[input$violin_y]]))
    }
    
    if (input$use_count) {
      p <- p + geom_count(aes_string(x = input$count_x, y = input$count_y))
    }
    
    p + theme(legend.position = "bottom")
    
  })
  
  ## Summary table
  
  output$summary_table <- renderTable({
    
    d <- my_data()
    
    if (input$grouping_var != "none") {
      d <- d %>% group_by(pick(matches(input$grouping_var)))  
    }
    
    d %>%
      summarize(`Media` = mean(.data[[input$target_var]], na.rm = TRUE),
                `Mediana` = median(.data[[input$target_var]], na.rm = TRUE),
                `Moda` = mlv(.data[[input$target_var]], method = "naive", na.rm = TRUE),
                `Varianza` = var(.data[[input$target_var]], na.rm = TRUE),
                `Std. dev` = sd(.data[[input$target_var]], na.rm = TRUE),
                IQR = quantile(.data[[input$target_var]], probs = .9, na.rm = TRUE) - quantile(.data[[input$target_var]], probs = .1, na.rm = TRUE)
                )
    
  })
  
}
