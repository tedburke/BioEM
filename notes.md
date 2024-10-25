---
title: Bioelectromagnetism
author: Ted Burke
date: 23-Oct-2024
geometry: margin=2.5cm
mainfont: DejaVuSerif.ttf
sansfont: DejaVuSans.ttf
monofont: DejaVuSansMono.ttf 
mathfont: texgyredejavu-math.otf
fontsize: 12pt
bibliography: library.bib
csl: ieee.csl
---

# Test text

Here is some text @horowitz1989art. This is another sentence @horowitz1989art.

And now a list...

- apples
- oranges
- pears

# Test maths

Ok, let's try an equation...

(@foo) An equation $e = mc^2$

(@bar) $e = mc^2$

And this $e = mc^2$ is some inline maths.

These equations are enclosed in a TeX environment:

\begin{align}
x=y \\
x=y
\end{align}

So are these:

\begin{equation}
x=y
\end{equation}

This one uses the markdown dollars convention:

(@blah) $$y = mx + c$$

Now, let's try referring to equation \ref{myeqn}.

\begin{equation}\label{myeqn}
x=y
\end{equation}

As you can see, the LaTeX and markdown equation numbers appear to be counted independently of each other :(

# Test image

Here's an example image:

![This is an example image](example.png)

# Bibliography

