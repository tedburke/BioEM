---
title: Biopotential Measurement and Analysis
author: Ted Burke
date: Fri  1 Nov 14:25:54 GMT 2024
geometry: margin=2.5cm
fontsize: 12pt
#mainfont: DejaVuSerif.ttf
mainfont: DejaVu Sans
sansfont: DejaVuSans.ttf
monofont: DejaVuSansMono.ttf 
mathfont: texgyredejavu-math.otf
bibliography: library.bib
csl: ieee.csl
---


# Introduction

This book provides a practical introduction to the measurement of bioelectrical signals from the human body and to their analysis.
Part 1 explores the origin of bioelectrical signals in the body, initially at the cellular level and then at the macroscopic scale of signals recorded using electrodes on the surface of the skin.
In particular, we will focus on the origin of _biopotentials_, time-varying voltage signals recorded between points on (or in) an organism.
However, the primary aim of this book is to explain the _measurement and analysis_ of these signals, and to equip the reader to design and implement systems that do just that.
Some knowledge of the phyiological origin of biopotentials is certainly useful for the designer of such systems, but a detailed description of the complex processes that give rise to biopotentials is beyond the scope of this book. For that, the reader is instead referred to Malmivuo and Plonsey's excellent book, _Bioelectromagnetism_ @malmivuo_plonsey, which the authors have generously made available for free online.

The following are examples of biopotential signals.

- The electrocardiogram (ECG), which records the electrical activity of the heart,
- The electromyogram (EMG), which records the electrical activity of skeletal muscles, and
- The electroencephalogram (EEG), which records the electrical activity of the brain.

The origin of those signals, and of most other biopotentials, lies in the generation of _action potentials_ in excitable cells - neurons and muscle cells. Our journey therefore begins with a simplified description of the structure and function of neurons, providing a basic understanding of how action potentials are generated. We then zoom out to see how large populations of excitable cells work together to produce the macroscopic signals we observe using surface electrodes attached to the skin, such as the _electrocardiogram_ and the _electroencephalogram_.

# Biopotential signals

## Excitable cells

## The electrocardiogram (ECG)

_Electrocardiography_ is the process of recording the electrical activity of the heart to produce an _electrocardiogram_ (ECG, but also sometimes abbreviated as EKG)

## The electromyogram (EMG)

_Electromyography_ is the process of recording an _electromyogram_ (EMG) - a record of the electrical activity of skeletal muscles.

## The electroencephalogram

## The electrooculogram

# Biopotential measurement systems


# Bibliography


# Test text

Horowitz and Hill share much wisdom in their book, *The Art of Electronics* @horowitz1989art. 

Topics covered in that book which are relevant to the present document include:

- resistance
- operational amplifiers
- instrumentation amplifiers

# Test maths

The equations below were inserted using the single dollar marks.

(@foo) An equation $e = mc^2$

(@bar) $e = mc^2$

The equation $e = mc^2$ was inserted as inline maths using single dollar signs.

These equations are enclosed in a TeX environment:

\begin{align}
x=y \\
x=y
\end{align}

So is this one:

\begin{equation}
x=y
\end{equation}

This one uses markdown's double dollars marks:

(@blah) $$y = mx + c$$

Now, let's try referring to equation \ref{myeqn}.

\begin{equation}\label{myeqn}
x=y
\end{equation}

As you can see, the LaTeX and markdown equation numbers appear to be counted independently of each other :(

# Test image

Here's an example image:

![This is an example image](example.png)

