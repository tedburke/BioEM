---
title: Biopotential Measurement and Analysis
author: Ted Burke
date: Sat 18 Oct 17:23:53 IST 2025
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

## What is a biopotential?

In normal usage, the word biopotential refers to an electrical signal recorded from a living organism. Conventionally, the word biopotential refers to one of the following two things:

1. **Unipolar lead:** A time-varying _electrical potential at a single point_ on (or in) an organism, relative to some reference electrical potential in the system (e.g. ground).
1. **Bipolar lead:** A time-varying _electrical potential difference_ between two points on (or in) an organism.

## Neurons

A neuron is a nerve cell. Neurons process and transmit information around the body electrochemically. Different types of neuron vary dramatically in size, from less than a millimetre in length to potentially over one metre (for nerves connecting the spinal cord to the toes). It has been estimated that there are between 95-100 billion neurons in the human brain, each of which may be connected to as many as 10,000 other neurons.

Different types of neurons have very different functions. For example, _afferent neurons_ (sensory nerves) relay information from various parts of the body to the central nervous system (CNS, the brain and spinal chord), whereas _efferent neurons_ (motor nerves) relay information from the CNS to the rest of the body to initiate muscle contractions or to control the operation of glands. Unlike many other types of cells in the body, most neurons cannot be replaced if they are destroyed.

### Neuron structure

![Diagram of neuron structure](figures/neuron_structure.png)

The structure of a typical neuron is illustrated in Figure 1.

- The soma is the main central section of the neuron from which other parts
branch out. It contains the cell nucleus.
- The dendrites branch out in tree-like structures from the soma. They are the primary source of incoming information to the neuron, receiving signals from potentially thousands of other neurons through their post-synaptic membranes.
- Neurotransmitters released by the presynaptic terminals of other neurons affect the potential of a dendrite’s postsynaptic membrane. If the cumulative effect of the input received from all connected neurons is sufficient to raise the neuron’s membrane potential above a threshold point, an action potential will be generated.
- The axon hillcock is the point at which the axon branches out from the soma.  It has a high density of voltage dependent sodium channels, making it the point with the lowest threshold for action potential initiation.
- The axon is a long (potentially over 1 metre) thin tail emanating out from the soma, which may itself have several branches. Once generated, an action potential propagates along the length of the axon at speeds ranging from 0.5 m/s to 120 m/s depending on the type of neuron.
- The axon is coated by a myelin sheath. Along the length of the axon, there are gaps in the myelin sheath called Nodes of Ranvier. These nodes are about 1 µm apart. An action potential that is propagating down the axon jumps from node to node. The flow of ions through the cell membrane that is required to generate the action potential cannot occur where the myelin sheath is present, so the nodes need to be close enough together for an action potential at one to trigger an action potential in its nearest neighbour – otherwise, the action potential would not propagate down the nerve.
- At the end of the axon is a network of branches, terminating in presynaptic terminals. When these terminals are excited by an action potential arriving through the axon, they release neurotransmitters into the synapse (the junction between neurons).
- These neurotransmitters affect the postsynaptic membranes of many other neurons’ dendrites (in some cases the effect is excitatory; in others it is inhibitory).
- In this way, initiation of an action potential in each neuron is the result of the action potentials of thousands of other neurons. Furthermore, each neuron in turn affects thousands of other neurons each time it generates an action potential. Collectively, large numbers of appropriately arranged neurons can perform complex tasks, such as pattern recognition.

## The electrocardiogram (ECG)

_Electrocardiography_ is the process of recording the electrical activity of the heart to produce an _electrocardiogram_ (ECG, but also sometimes abbreviated as EKG)

## The electromyogram (EMG)

_Electromyography_ is the process of recording an _electromyogram_ (EMG) - a record of the electrical activity of skeletal muscles.

## The electroencephalogram

## The electrooculogram



# Biopotential measurement systems

## What is a lead?

In biopotential measurement, the word _lead_ always refers to an individual signal, rather than a physical wire. This is a frequent cause of confusion!

Recording a single bipolar lead typically involves connecting three electrodes to the subject, each with its own physical wire connecting it to the recording instrument. One of the three electrodes provides a low-impedance connection between the human subject and the amplifier. The recording instrument measures the voltage (i.e. the electrical potential difference) between the other two electrodes, resulting in just one recorded signal – a bipolar lead.

## Basic electronic circuit concepts

To understand biopotential measurement circuits, you don’t need to be an electronics expert, but you do need to be familiar with some basic circuit elements and concepts. The amount of knowledge you need is not vast, but it’s important to understand it thoroughly. The intended emphasis in what follows is on _understanding_. To gain a useful understanding of biopotential amplifier circuits, you really need to _intuitively_ understand the behaviour of resistors, capacitors and op-amps. When I say _intuitively_, what I mean is that it’s not enough to learn off a formula for something like a voltage divider – you need to understand it well enough that, at a glance, you can recognise one in a circuit and work out what it’s doing.

These circuits are not very complex, but their operation rests on some subtle principles (such as _negative feedback_) which, if poorly understood, permit only a very superficial understanding of biopotential instrumentation.

### Voltage and current

Firstly, let’s be crystal clear about the difference between voltage and current.

- **Voltage** is the difference in electrical potential between two points in circuit. A difference in potential must be measured between two points, so it can cause confusion when people talk about the voltage at a single point in a circuit. In this case, the voltage in question is the difference in electrical potential between that point and some reference potential, such as earth or the “0V” terminal of the power supply.
- Electrical **current** tells us how many units of charge per second are flowing through a branch in a circuit. Often, the charge moves in the form of free electrons. For example, when current flows in a copper wire, the electrons that transport the charge move quite freely from atom to atom in the metal. However, electrical current can take other forms. For example, electrical currents inside the human body are almost all _ionic_ currents. Whatever form it takes, a current measured in Amps tells us how many Coulombs of charge are transported per second.

### Notation for currents and voltages

In equations involving voltage and current, the following notational convention is used throughout this document:

| Symbol | notation | Denotes | Description |
|--------|----|---------|-------------|
| V | (upper case V) | Steady state voltage | Either a constant DC voltage or a sinusoidal AC voltage with constant frequency and amplitude. |
| I | (upper case I) | Steady state current | Either a constant DC current which flows at a constant rate in one direction, or a sinusoidal AC current with constant frequency and amplitude. |
| v | (lower case v) | Instantaneous voltage | This voltage signal is a function of time, so it is often written as v(t). |
| i | (lower case i) | Instantaneous current | This current signal is a function of time, so it is often written as i(t). |

### Electrical power

The instantaneous power dissipated in a two-terminal circuit element (such as a resistor) is

\begin{equation}
p = v \times i 
\end{equation}

Keep in mind that p, v and i are all functions of time, i.e. they can change.

### Resistors

FIGURE SHOWING CIRCUIT SYMBOL FOR RESISTOR

A resistor is a two-terminal circuit element. In circuit diagrams, a resistor is normally represented by the symbol shown on the right (although other symbols are sometimes used). Its electrical behaviour is defined by Ohm’s Law:

v = i \times R 

where R is the resistance of the resistor. To describe this behaviour in words: the current in a resistor is proportional to the voltage across it. For example, if the voltage trying to push current through the resistor doubles, the current will also double. A resistance in a circuit could be a physical resistor component, or it could be modeling electrical resistance in another component or object (e.g. the parasitic resistance of the copper wire in an induction coil).

### Capacitors

FIGURE SHOWING CIRCUIT SYMBOL FOR CAPACITOR

Like the resistor, the capacitor is a two-terminal circuit element. However, the relationship between current and voltage in a capacitor is slightly more complicated:

\begin{equation}
i = C \frac{\mathrm{d}v}{\mathrm{d}t} 
\end{equation}

What this means is that current is proportional to the rate of change of voltage. The relationship between current and voltage in a capacitor is arguably revealed more clearly by rearranging the equation as follows. Multiply both sides by dt, then integrate, yielding the following (I’m assuming zero initial conditions):

\begin{equation}
v = \frac{1}{C} \int i \, \mathrm{d}t 
\end{equation}

The capacitor voltage is the integral of all the current that has flowed through it. The simplest physical realisation of a capacitor consists of two parallel conducting plates separated by an insulator, each with a wire attached. When current flows through the capacitor, positive charge accumulates on one plate and negative charge accumulates on the other. As the plates become more and more highly charged, the capacitor voltage builds up until eventually whatever voltage source is driving the current can’t push hard enough to push any more through and the current grinds to a halt. We can therefore think of the capacitor voltage as remembering how much current has flowed through the device, charging the two plates.

### Impedance

This brings us onto the important concept of impedance which, again speaking loosely, can be thought of as "resistance" that changes as a function of frequency. Like resistance, impedance is measured in units of ohms. However, resistance always has a real value, whereas in general impedance is complex.

The impedance of a resistor is equal to its resistance, R:

\begin{equation}
Z_R = R 
\end{equation}

The impedance of a capacitor is purely imaginary:

\begin{equation}
Z_C = \frac{1}{j \omega C} 
\end{equation}

where j is the square root of -1, $\omega$  is angular frequency (in radians per second) and C is capacitance (in Farads). The magnitude of $Z_C$  can be thought of as how much the capacitor resists the flow of current. Clearly, this magnitude is heavily dependent on the frequency $\omega$.

\begin{equation}
\left| Z_C \right| = \frac{1}{\omega C} 
\end{equation}

At DC ($\omega = 0$), the magnitude of $Z_C$ is infinite, which reflects the fact that DC current cannot flow through a capacitor (remember the elastic membrane in the pipe!). However, the higher the frequency, the smaller $|Z_C|$ becomes, until at very high frequencies it becomes so small that it is virtually insignificant, resembling a short circuit.



### Plumbing analogy for voltage and current

Imagine a plumbing system in which a pump drives water around a closed circuit – something like a home central heating system. The same water travels around and around the system, passing through the pipes (and presumably the pump, boiler, radiators, etc.) over and over again. The pump has to consume energy to keep the circulation going. The harder the pump pushes the water, the faster the water circulates. If the pipes are too narrow, or if they have become partially blocked by sediment over time, then circulation will be reduced even is the pump is still pushing at full strength. The flow rate depends on two things: how hard the pump pushes and how easy or hard it is to push water through the system.

IMAGE OF PUMP AND SIMPLE CLOSED LOOP PIPE

If you get confused between electrical voltage and current, think of the following analogy:

Voltage is analogous to how hard the pump is pushing. The water pressure at the output of the pump is high. The water pressure at the input to the pump is very low. The difference in pressure created by the pump creates a potential difference across the entire plumbing system (boiler, pipes, radiator) that encourages water to flow through the system. That’s exactly what a voltage source does in an electric circuit, except of course that it’s electrical potential rather than water pressure. Electrical current is analogous to the rate at which water flows around the system.

I’m going to expand on this plumbing analogy below as each of the basic circuit elements (resistors, capacitors and inductors) is introduced.

### Plumbing analogy for resistor

DIAGRAM OF PLUMBING ANALOGY FOR CIRCUIT WITH ONE RESISTANCE

Returning to the plumbing analogy, a resistance is like a partial blockage at some point in the pipe. It creates a "bottle neck" which reduces the overall flow rate through the system. If we measured the water pressure in the pipe either side of such a blockage, we would see an abrupt drop in water pressure across it. The diagram above illustrates a system in which a partial blockage is resisting the flow of water around the circuit.

DIAGRAM OF PLUMBING ANALOGY FOR CIRCUIT WITH TWO RESISTANCES

The diagram above illustrates a second system in which there are two roughly equal blockages resisting the flow of water. The pump is still generating a substantial pressure drop across the whole system, but the blockages are reducing the flow rate substantially. Almost half of the total pressure is dropped across the first blockage and almost half is dropped across the second blockage, leaving very little pressure drop to drive water around the rest of the system.

### Plumbing analogy for capacitor

DIAGRAM OF PLUMBING ANALOGY FOR RC CIRCUIT WITH DC SOURCE

Returning to my plumbing analogy again, a capacitor is like a very elastic (but sturdy) rubber membrane that blocks the pipe. As current flows through the pipe, the membrane stretches out further and further in the direction of flow. However, the farther the elastic membrane stretches, the harder it pushes back resisting the flow. After a short time, the elastic force of the stretched membrane pushes the water back as hard as the pump can push it forwards and the flow comes to a halt. So, the capacitor allows current to flow in one direction for a short time, but the more current flows through it in one direction the harder it pushes back. Ultimately, current cannot continue flowing in one direction through the capacitor.

DIAGRAM OF PLUMBING ANALOGY FOR RC CIRCUIT WITH AC SOURCE

The plumbing analogy also provides a good insight into the AC behaviour of the capacitor. AC (alternating current) is just current that moves back and forth in a circuit (strictly speaking, it varies sinusoidally) rather than moving continuously in one direction. Using the plumbing analogy, imagine that instead of driving the water continuously in one direction, the pump is now some kind of piston which drives the water back and forth in the pipes. In this situation, the elastic membrane is much less resistant to the flow. It repeatedly stretches out one way then the other. When the membrane is stretching out it stores energy, and when it contracts it releases energy. Furthermore, its movement is not perfectly synchronised with the piston pump – they oscillate at the same frequency, but there is a constant phase difference between them. Sometimes the membrane works with the pump, pushing in the same direction, and sometimes it works against the pump. Over the course of one full cycle, the elastic membrane stores and releases exactly the same amount of energy. Although it can store energy, it always ends up being released. It doesn’t dissipate power. In this respect, it is fundamentally different to a resistor, which certainly does dissipate real power (as heat).

This is a very good analogy for the behaviour of a capacitor when AC current flows through it. It resists the flow of DC current (current that flows continuously in one direction) because once the capacitor is charged, it pushes back too hard against the voltage source. However, when the current is driven back and forth by an AC voltage, the capacitor offers less resistance – it bends one way then the other, allowing the current to oscillate. In fact, the faster the voltage switches back and forth, the less resistance the capacitor offers to the flow of current. I’m using the term “resistance” loosely here, since we saw in the previous section on the resistor that “resistance” has a specific meaning in electrical engineering – namely, it describes things that conform to Ohm’s Law. What the capacitor does when it resists the flow of current is different – it doesn’t follow Ohm’s Law – but it does affect the magnitude of the current produced by a given voltage.

### Elements and networks

- Elements, voltage, current, networks, nodes and node voltages, binary nodes, true nodes, branches and branch currents.
- voltage source, current source, resistor, inductor, capacitor, diode, opamp.
- Ohm's law for resistances.

### Voltage dividers

- Also known as potential dividers.
- Key to understanding the circuits we're building up to.
- Basic passive voltage divider with Vin, Vout and GND.
- The voltage divider as a calculating element - weighted average of two arbitrary noode voltages.

### Impedance and phasors

- Representing sinusoidal voltages and currents as phasors.
- Impedance - describe frequency-dependent relationship between voltage and current in a linear element using a single complex number.


### The operational amplifier

- The ideal opamp - rules of operation.
- The non-inverting opamp circuit.
- 


## Biopotential measurement with the 2-opamp instrumentation amplifier

# Circuit analysis of 2-opamp instrumentation amplifier

The following equation described the voltage relationships in opamp 1.

\begin{equation}
\frac{v_3 - V_{ref}}{R_1 + R_2} = \frac{v_2 - V_{ref}}{R_2}
\end{equation}

Multiplying both sides by both denominators yields the following.

\begin{equation}
R_2v_3 - R_2V_{ref} = R_1v_2 - R_1V_{ref} + R_2v_2 - R_2V_{ref}
\end{equation}

which simplifies to

\begin{equation}
v_3 = \frac{R_1}{R_2}v_2 + \frac{R_2}{R_2}v_2 - \frac{R_1}{R_2}V_{ref}
\end{equation}

and hence

\begin{equation}\label{v3_eq}
v_3 = \frac{R_1+R_2}{R_2}v_2 - \frac{R_1}{R_2}V_{ref}
\end{equation}

Applying the equivalent analysis to opamp 2 yields the following (with $R_1$ in place of $R_2$, $R_2$ in place of $R_1$, $v_3$ in place of $V_{ref}$, $v_1$ in place of $v_2$, and $v_4$ in place of $v_3$): 

\begin{equation}\label{v4_eq1}
v_4 = \frac{R_2+R_1}{R_1}v_1 - \frac{R_2}{R_1}v_3
\end{equation}

Substituting equation \ref{v3_eq} into equation \ref{v4_eq1},

\begin{align}\label{v4_eq}
v_4 &= \frac{R_2+R_1}{R_1}v_1 - \frac{R_2}{R_1}\frac{R_1+R_2}{R_2}v_2 + \frac{R_2}{R_1}\frac{R_1}{R_2}V_{ref} \\
&= \frac{R_1+R_2}{R_1}v_1 - \frac{R_1+R_2}{R_1}v_2 + V_{ref} \\
\end{align}

Hence,

\begin{equation}\label{v4_eq2}
v_4 = \frac{R_1+R_2}{R_1}(v_1 - v_2) + V_{ref}
\end{equation}

The full amplifier includes an additional gain stage (opamp 3, plus $R_3$ and $R_4$), which receives $v_4$ as its input and produces $v_{out}$ as its output. $v_out$ can be expressed in terms of $v_4$ as follows.

\begin{equation}\label{v_outv_4_eq}
v_{out} = V_{ref} + \frac{R_3 + R_4}{R_3}(v_4 - V_{ref})
\end{equation}

Substituting equation \ref{v4_eq} into equation \ref{v_outv_4_eq} yields

\begin{equation}
v_{out} = V_{ref} + \frac{R_3 + R_4}{R_3}\left( \frac{R_1 + R_2}{R_1}(v_1 - v_2) + V_{ref} - V_{ref} \right)
\end{equation}

Finally, tidying up, we obtain the following tidy expression for $v_out$ in terms of the differential input $v_diff = v_1 - v_2$ and $V_{ref}$.

\begin{equation}
v_{out} = V_{ref} + \frac{R_3 + R_4}{R_3}\frac{R_1 + R_2}{R_1}(v_1 - v_2)
\end{equation}

This can be written as

\begin{equation}
v_{out} = V_{ref} + A_{diff}v_{diff} + A_{cm}v_{cm}
\end{equation}

where $v_{diff}$ is the differential voltage input,

\begin{equation}
v_{diff} = v_1 - v_2
\end{equation}

$v_{cm}$ is the common-mode voltage input,

\begin{equation}
v_{cm} = \frac{v_1 + v_2}{2}
\end{equation}

$A_{diff}$ is the differential-mode gain,

\begin{equation}
A_{diff} = \frac{R_1+R_2}{R_1}\frac{R_3+R_4}{R_3}
\end{equation}

and $A_{cm}$ is the common-mode gain.

\begin{equation}
A_{cm} = 0
\end{equation}



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

![This is an example image](figures/example.png)

Here's an SVG image:

![Example SVG image](figures/example.svg)

