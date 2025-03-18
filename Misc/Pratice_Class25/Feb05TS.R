p <- ggplot(
  gapminder, 
  aes(x = gdpPercap, y=lifeExp, size = pop, colour = country)
) +
  geom_point(show.legend = FALSE, alpha = 0.7) +
  scale_color_viridis_d() +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(x = "GDP per capita", y = "Life expectancy")
#> Error in ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, size = pop, : could not find function "ggplot"
p
#> Error in eval(expr, envir, enclos): object 'p' not found
p + transition_time(year) +
  labs(title = "Year: {frame_time}")
#> Error in eval(expr, envir, enclos): object 'p' not found
file_renderer(dir = ".", prefix = "gganim_plot", overwrite = FALSE)
#> Error in file_renderer(dir = ".", prefix = "gganim_plot", overwrite = FALSE): could not find function "file_renderer"