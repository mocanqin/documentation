---
title: Text and Annotations in R | Examples | Plotly
name: Text and Annotations
permalink: r/text-and-annotations/
description: How to add text labels and annotations to plots in R.
layout: base
thumbnail: thumbnail/text-and-annotations.jpg
language: r
page_type: example_index
has_thumbnail: false
display_as: style_opt
order: 1
output:
  html_document:
    keep_md: true
---


### New to Plotly?

Plotly's R library is free and open source!<br>
[Get started](https://plot.ly/r/getting-started/) by downloading the client and [reading the primer](https://plot.ly/r/getting-started/).<br>
You can set up Plotly to work in [online](https://plot.ly/r/getting-started/#hosting-graphs-in-your-online-plotly-account) or [offline](https://plot.ly/r/offline/) mode.<br>
We also have a quick-reference [cheatsheet](https://images.plot.ly/plotly-documentation/images/r_cheat_sheet.pdf) (new!) to help you get started!

### Version Check

Version 4 of Plotly's R package is now [available](https://plot.ly/r/getting-started/#installation)!<br>
Check out [this post](http://moderndata.plot.ly/upgrading-to-plotly-4-0-and-above/) for more information on breaking changes and new features available in this version.

```r
library(plotly)
packageVersion('plotly')
```

```
## [1] '4.7.0.9000'
```

### Text Mode


```r
library(plotly)

Primates <- c('Potar monkey', 'Gorilla', 'Human', 'Rhesus monkey', 'Chimp')
Bodywt <- c(10.0, 207.0, 62.0, 6.8, 52.2)
Brainwt <- c(115, 406, 1320, 179, 440)
data <- data.frame(Primates, Bodywt, Brainwt)

p <- plot_ly(data, x = ~Bodywt, y = ~Brainwt, type = 'scatter',
        mode = 'text', text = ~Primates, textposition = 'middle right',
        textfont = list(color = '#000000', size = 16)) %>%
  layout(title = 'Primates Brain and Body Weight',
         xaxis = list(title = 'Body Weight (kg)',
                      zeroline = TRUE,
                      range = c(0, 250)),
         yaxis = list(title = 'Brain Weight (g)',
                      range = c(0,1400)))

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = api_create(p, filename="text-mode")
chart_link
```

<iframe src="https://plot.ly/~RPlotBot/3877.embed" width="800" height="600" id="igraph" scrolling="no" seamless="seamless" frameBorder="0"> </iframe>

See more options on the textposition argument [here](https://plot.ly/r/reference/#scatter-textposition).

### Styling Text


```r
library(plotly)

data <- mtcars[which(mtcars$am == 1 & mtcars$gear == 4),]

t <- list(
  family = "sans serif",
  size = 14,
  color = toRGB("grey50"))

p <- plot_ly(data, x = ~wt, y = ~mpg, text = rownames(data)) %>%
  add_markers() %>%
  add_text(textfont = t, textposition = "top right") %>%
  layout(xaxis = list(range = c(1.6, 3.2)),
         showlegend = FALSE)

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = api_create(p, filename="text-style")
chart_link
```

<iframe src="https://plot.ly/~RPlotBot/3147.embed" width="800" height="600" id="igraph" scrolling="no" seamless="seamless" frameBorder="0"> </iframe>

### Adding Informations to Default Hover Text


```r
library(plotly)

p <- plot_ly(iris, x = ~Petal.Length, y = ~Petal.Width, type = 'scatter', mode = 'markers',
        text = ~paste('Species: ', Species))

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = api_create(p, filename="text-hover1")
chart_link
```

<iframe src="https://plot.ly/~RPlotBot/3871.embed" width="800" height="600" id="igraph" scrolling="no" seamless="seamless" frameBorder="0"> </iframe>

### Custom Hover Text


```r
library(plotly)

p <- plot_ly(iris, x = ~Petal.Length, y = ~Petal.Width, type = 'scatter', mode = 'markers',
        hoverinfo = 'text',
        text = ~paste('Species: ', Species,
                      '</br> Petal Lenght: ', Petal.Length,
                      '</br> Petal Width: ', Petal.Width))

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = api_create(p, filename="text-hover2")
chart_link
```

<iframe src="https://plot.ly/~RPlotBot/3873.embed" width="800" height="600" id="igraph" scrolling="no" seamless="seamless" frameBorder="0"> </iframe>

### Single Annotation


```r
library(plotly)

m <- mtcars[which.max(mtcars$mpg), ]

a <- list(
  x = m$wt,
  y = m$mpg,
  text = rownames(m),
  xref = "x",
  yref = "y",
  showarrow = TRUE,
  arrowhead = 7,
  ax = 20,
  ay = -40
)

p <- plot_ly(mtcars, x = ~wt, y = ~mpg) %>%
  add_markers() %>%
  layout(annotations = a)

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = api_create(p, filename="annotation-single")
chart_link
```

<iframe src="https://plot.ly/~RPlotBot/3150.embed" width="800" height="600" id="igraph" scrolling="no" seamless="seamless" frameBorder="0"> </iframe>

### Multiple Annotations


```r
library(plotly)

data <- mtcars[which(mtcars$am == 1 & mtcars$gear == 4),]

p <- plot_ly(data, x = ~wt, y = ~mpg, type = 'scatter', mode = 'markers',
        marker = list(size = 10)) %>%
  add_annotations(x = data$wt,
                  y = data$mpg,
                  text = rownames(data),
                  xref = "x",
                  yref = "y",
                  showarrow = TRUE,
                  arrowhead = 4,
                  arrowsize = .5,
                  ax = 20,
                  ay = -40)

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = api_create(p, filename="annotation-multiple")
chart_link
```

<iframe src="https://plot.ly/~RPlotBot/3152.embed" width="800" height="600" id="igraph" scrolling="no" seamless="seamless" frameBorder="0"> </iframe>

### Subplot Annotations


```r
library(plotly)

m <- economics[which.max(economics$unemploy), ]
n <- economics[which.max(economics$uempmed), ]

# annotations
a <- list(
  x = m$date,
  y = m$unemploy,
  text = "annotation a",
  xref = "x",
  yref = "y",
  showarrow = TRUE,
  arrowhead = 7,
  ax = 20,
  ay = -40
)

b <- list(
  x = n$date,
  y = n$uempmed,
  text = "annotation b",
  xref = "x2",
  yref = "y2",
  showarrow = TRUE,
  arrowhead = 7,
  ax = 20,
  ay = -40
)

# figure labels
f <- list(
  family = "Courier New, monospace",
  size = 18,
  color = "#7f7f7f ")
x <- list(
  title = "x Axis",
  titlefont = f)
y <- list(
  title = "y Axis",
  titlefont = f)

p1 <- plot_ly(economics, x = ~date, y = ~unemploy) %>%
  add_lines(name = ~"unemploy") %>%
  layout(annotations = a, xaxis = x, yaxis = y)
p2 <- plot_ly(economics, x = ~date, y = ~uempmed) %>%
  add_lines(name = ~"uempmed") %>%
  layout(annotations = b, xaxis = x, yaxis = y)
p <- subplot(p1, p2, titleX = TRUE, titleY = TRUE) %>%
  layout(showlegend = FALSE)

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = api_create(p, filename="annotation-subplot")
chart_link
```

<iframe src="https://plot.ly/~RPlotBot/3973.embed" width="800" height="600" id="igraph" scrolling="no" seamless="seamless" frameBorder="0"> </iframe>

### 3D Annotations


```r
library(plotly)

p <- plot_ly() %>%
  add_trace(
    x = c("2017-01-01", "2017-02-10", "2017-03-20"), 
    y = c("A", "B", "C"), 
    z = c(1, 1000, 100000), 
    name = "z", 
    type = "scatter3d"
  ) %>% 
  layout(
    scene = list(
      aspectratio = list(
        x = 1,
        y = 1,
        z = 1
      ),
      camera = list(
        center = list(
          x = 0,
          y = 0,
          z = 0
        ),
        eye = list(
          x = 1.96903462608,
          y = -1.09022831971,
          z = 0.405345349304
        ),
        up = list(
          x = 0,
          y = 0,
          z = 1
        )
      ),
      dragmode = "turntable",
      xaxis = list(
        title = "",
        type = "date"
      ),
      yaxis = list(
        title = "",
        type = "category"
      ),
      zaxis = list(
        title = "",
        type = "log"
      ),
      annotations = list(list(
        showarrow = F,
        x = "2017-01-01",
        y = "A",
        z = 0,
        text = "Point 1",
        xanchor = "left",
        xshift = 10,
        opacity = 0.7
      ), list(
        x = "2017-02-10",
        y = "B",
        z = 4,
        text = "Point 2",
        textangle = 0,
        ax = 0,
        ay = -75,
        font = list(
          color = "black",
          size = 12
        ),
        arrowcolor = "black",
        arrowsize = 3,
        arrowwidth = 1,
        arrowhead = 1
      ), list(
        x = "2017-03-20",
        y = "C",
        z = 5,
        ax = 50,
        ay = 0,
        text = "Point 3",
        arrowhead = 1,
        xanchor = "left",
        yanchor = "bottom"
      )
    )),
    xaxis = list(title = "x"),
    yaxis = list(title = "y")
  )

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = api_create(p, filename="annotation-3d")
chart_link
```

<iframe src="https://plot.ly/~RPlotBot/5133.embed" width="800" height="600" id="igraph" scrolling="no" seamless="seamless" frameBorder="0"> </iframe>

### Styling Annotations


```r
library(plotly)

data <- mtcars[which(mtcars$am == 1 & mtcars$gear == 4),]

p <- plot_ly(data, x = ~wt, y = ~mpg, type = 'scatter', mode = 'markers',
        marker = list(size = 10)) %>%
  add_annotations(x = data$wt,
                  y = data$mpg,
                  text = rownames(data),
                  xref = "x",
                  yref = "y",
                  showarrow = TRUE,
                  arrowhead = 4,
                  arrowsize = .5,
                  ax = 20,
                  ay = -40,
                  # Styling annotations' text:
                  font = list(color = '#264E86',
                              family = 'sans serif',
                              size = 14))

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = api_create(p, filename="annotation-style")
chart_link
```

<iframe src="https://plot.ly/~RPlotBot/3875.embed" width="800" height="600" id="igraph" scrolling="no" seamless="seamless" frameBorder="0"> </iframe>

### Set Annotation Text Anchors


```r
library(plotly)

p <- plot_ly() %>%
  add_markers(
    x = 1,
    y = 1,
    showlegend = F
  ) %>%
  add_markers(
    x = 1,
    y = 2,
    showlegend = F
  ) %>%
  add_markers(
    x = 1,
    y = 3,
    showlegend = F
  ) %>%
  add_annotations(
    x=1,
    y=1,
    xref = "x",
    yref = "y",
    text = "Right Anchor",
    xanchor = 'right',
    showarrow = F
  ) %>%
  add_annotations(
    x=1,
    y=2,
    xref = "x",
    yref = "y",
    text = "Center Anchor",
    xanchor = 'center',
    showarrow = F
  ) %>%
  add_annotations(
    x=1,
    y=3,
    xref = "x",
    yref = "y",
    text = "Left Anchor",
    xanchor = 'left',
    showarrow = F
  )

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = api_create(p, filename="annotation-anchors")
chart_link
```

<iframe src="https://plot.ly/~RPlotBot/4575.embed" width="800" height="600" id="igraph" scrolling="no" seamless="seamless" frameBorder="0"> </iframe>

### Set Annotation Coordinate References


```r
library(plotly)

p <- plot_ly() %>%
  add_markers(
    x = 0.5,
    y = 1,
    showlegend = F
  ) %>%
  add_annotations(
    x= 0.5,
    y= 1,
    xref = "paper",
    yref = "paper",
    text = "<b>paper reference = [0.5, 1]</b>",
    showarrow = F
  ) %>%
  add_annotations(
    x= 0.5,
    y= 1,
    xref = "x",
    yref = "y",
    text = "x + y reference = [0.5, 1]",
    showarrow = T,
    ax = 20,
    ay = -40
  ) %>%
  layout(
    xaxis = list(zeroline = F),
    yaxis = list(zeroline = F)
  )

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = api_create(p, filename="annotation-xref")
chart_link
```

<iframe src="https://plot.ly/~RPlotBot/4577.embed" width="800" height="600" id="igraph" scrolling="no" seamless="seamless" frameBorder="0"> </iframe>

#Reference

See [https://plot.ly/r/reference/#layout-annotations](https://plot.ly/r/reference/#layout-annotations) for more information and chart attribute options!
