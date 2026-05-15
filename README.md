# FloaTiles

**Self-assembly based on the Cheerios effect and aperiodic monotiles.**

A project of the Embodied Cognitive Science Unit, Okinawa Institute of Science and Technology Graduate University (OIST).
Lead: Georgii Karelin · with Brian Morrissey and Tom Froese.

<https://karegeo.github.io/floatiles/>

---

## Overview

FloaTiles is a low-cost macroscopic experimental platform for studying **emergent collective behaviour in passive matter**. Identical 3D-printed polygonal tiles float on a shallow water surface and interact through the *Cheerios effect*: minimisation of the air–water interfacial energy produces capillary attraction whose magnitude depends on tile geometry, material, and the level of agitation imposed by motor-driven vibration or airflow.

Without motors, sensors, or onboard control in the tiles themselves, the system spontaneously aggregates into transient clusters whose morphology and lifetime are governed by the interplay between attraction and externally imposed noise. The platform is deliberately minimal — cheap to build, easy to reproduce, and well-suited to artificial-life experiments in self-assembly.

A more complete write-up with quantitative analysis (image-based cluster tracking, perimeter–area scaling, fractal-dimension measurement, and a complementary cluster–cluster aggregation simulation) is in preparation; results will appear here once published.

---

## ALIFE 2024

- Extended abstract: [ALife_conference_2024___Submission_32___Camera_Ready.pdf](ALife_conference_2024___Submission_32___Camera_Ready.pdf)
- Poster: [ALIFE_2024_OIST_LaTeX_Template__OIST_Posters-1.pdf](ALIFE_2024_OIST_LaTeX_Template__OIST_Posters-1.pdf)

---

## Videos

Latest experiments with the **Spectre** monotile in a medium container, with vibrational automatic perturbations:

<iframe title="vimeo-player" src="https://player.vimeo.com/video/932065743?h=c4199bff19" width="640" height="360" frameborder="0" allowfullscreen></iframe>

<iframe title="vimeo-player" src="https://player.vimeo.com/video/932068099?h=b203182a93" width="640" height="360" frameborder="0" allowfullscreen></iframe>

Earlier experiments with the **Hat** monotile in a small container with manual perturbations:

<div style="padding:56.25% 0 0 0;position:relative;"><iframe src="https://player.vimeo.com/video/896159119?badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" style="position:absolute;top:0;left:0;width:100%;height:100%;" title="edge3"></iframe></div><script src="https://player.vimeo.com/api/player.js"></script>

Experiments with the **Hat** monotile in a large container with automatic perturbations:

<div style="padding:100% 0 0 0;position:relative;"><iframe src="https://player.vimeo.com/video/872450614?badge=0&amp;autopause=0&amp;quality_selector=1&amp;progress_bar=1&amp;player_id=0&amp;app_id=58479" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" style="position:absolute;top:0;left:0;width:100%;height:100%;" title="experiment-cropped"></iframe></div><script src="https://player.vimeo.com/api/player.js"></script>

Previous experiments with the **Spectre** monotile in a small container:

![photo of the experiment](IMG_8073.JPG)
![photo of the experiment](IMG_8076.JPG)
![photo of the experiment](IMG_8078.JPG)

---

## Background

### The Cheerios effect

Floating objects on a liquid surface come together due to the deformation of the air–water interface around each particle. Surface tension and buoyancy combine to produce capillary attraction — a phenomenon named "the Cheerios effect" by Vella & Mahadevan in 2005, though its physics had been studied much earlier (Gifford & Scriven 1971; Hosokawa et al. 1994–1996; Bowden, Whitesides and collaborators 1997–1999).

Three physical principles govern the effect:

- **Buoyancy** — whether an object floats at all.
- **Surface tension** — the "skin" at the liquid surface that can be deformed by floating objects.
- **Meniscus deformation** — local curvature of the interface around each tile, producing an attractive force when neighbouring menisci overlap.

### Aperiodic monotiles

Aperiodic monotiles are single shapes that tile the plane without producing a repeating pattern. The 2023 discoveries of the **Hat** and **Spectre** tiles (Smith, Myers, Kaplan & Goodman-Strauss) made the *einstein* problem concrete with shapes that can be fabricated and studied physically. In FloaTiles we use 3D-printed tiles inspired by these shapes; small spikes and notches on the edges act as a primitive key-and-lock system that increases the effective capillary contact between adjacent tiles.

### Why this matters

Emergent phenomena are pervasive in nature, from flocking birds to economic systems. FloaTiles provides a controlled tabletop environment in which simple physical ingredients — geometry, surface tension, agitation — produce rich, visible self-organisation. It also brings the system into direct contact with classical theoretical results on aggregation kinetics and fractal cluster geometry.

---

## Apparatus

The setup consists of a shallow rectangular pool sitting on a slab supported by a modular perforated-steel-strut frame, with a DC gear motor and eccentric counterweight mounted below the slab to couple vibration into the water. A JDT-001 external speed controller gives quasi-continuous adjustment of vibration amplitude and dominant frequency. Optional small fans (surface airflow) and an aquarium bubble generator (sub-surface agitation) provide additional sources of noise. A USB webcam mounted above the pool records the dynamics for image analysis.

The mechanical design is parametric (OpenSCAD), so dimensions, motor placement, and frame geometry are reproducible from a single script.

### Tiles

- 3D-printed polygonal tiles, characteristic linear dimension ~1 cm.
- Dark filament for high optical contrast against diffuse illumination.
- A small bright fiducial marker glued to the top face of each tile for tracking.

---

## Poster (CCS 2023)

> **Cheerios Effect**: Floating objects on a liquid surface come together due to surface tension and buoyancy. This phenomenon can be harnessed to control and manipulate the assembly of specific structures. The light reflection visible in our images effectively demonstrates the deformation of the water surface around the floating objects — this deformation results in the force that pulls objects together, allowing for controlled aggregation of structures.
>
> **Aperiodic tiling**: covering a whole plane without a repeating pattern using a single tile type. The 2023 discovery of the *Hat* and *Spectre* offers unique geometric shapes that can be incorporated into the experiment. Tiles can be created using 3D printing or laser cutting and are introduced to a water surface to see how they aggregate based on the Cheerios effect.
>
> The **FloaTiles** project combines these two ideas to demonstrate how individual tiles interact through the Cheerios effect to produce emergent behaviour. The system can produce more complex patterns by adding tiles and stationary elements (engines) that have specific effects like attraction and repulsion, and patterns can affect the level of perturbation in real time via a video-feedback loop from the camera.

Full poster: [Poster CCS2023stable.pdf](Poster%20CCS2023stable.pdf)

---

## References

1. Vella, D. & Mahadevan, L. (2005). *The "Cheerios effect."* American Journal of Physics 73(9), 817–825.
2. Gifford, W. A. & Scriven, L. E. (1971). *On the attraction of floating particles.* Chemical Engineering Science 26(3), 287–297.
3. Hosokawa, K., Shimoyama, I. & Miura, H. (1994). *Dynamics of self-assembling systems: analogy with chemical kinetics.* Artificial Life 1(4), 413–427.
4. Hosokawa, K., Shimoyama, I. & Miura, H. (1996). *Two-dimensional micro-self-assembly using the surface tension of water.* Sensors and Actuators A 57(2), 117–125.
5. Bowden, N., Terfort, A., Carbeck, J. & Whitesides, G. M. (1997). *Self-assembly of mesoscale objects into ordered two-dimensional arrays.* Science 276, 233–235.
6. Bowden, N., Choi, I. S., Grzybowski, B. A. & Whitesides, G. M. (1999). *Mesoscale self-assembly of hexagonal plates using lateral capillary forces.* JACS 121(23), 5373–5391.
7. Whitesides, G. M. & Grzybowski, B. (2002). *Self-assembly at all scales.* Science 295, 2418–2421.
8. Smith, D., Myers, J. S., Kaplan, C. S. & Goodman-Strauss, C. (2024). *An aperiodic monotile.* Combinatorial Theory 4(1).
9. Smith, D., Myers, J. S., Kaplan, C. S. & Goodman-Strauss, C. (2023). *A chiral aperiodic monotile.* arXiv:2305.17743.
10. Hooshanginejad, A. et al. (2024). *Interactions and pattern formation in a macroscopic magnetocapillary SALR system of mermaid cereal.* Nature Communications 15, 5466.
11. Wilt, J. K., Schramma, N., Bottermans, J.-W. & Jalaal, M. (2024). *ActiveCheerios: 3D-printed Marangoni-driven active particles at an interface.* arXiv:2411.16011.
12. Eatson, J. L., Morgan, S. O., Horozov, T. S. & Buzza, D. M. A. (2024). *Programmable 2D materials through shape-controlled capillary forces.* PNAS 121(35).

---

## Acknowledgments

OIST, especially **Brian Morrissey** and **Stephen Estelle** for help with equipment and 3D printing/laser cutting. **Roman Mukhin** for the first 3D print. The **Ikegami Lab** at the University of Tokyo for hosting early pilot experiments. The **Embodied Cognitive Science Unit** at OIST (Tom Froese) for supervision and support.

Tile-design files originally drew on <https://github.com/christianp/aperiodic-monotile> and Craig Kaplan's spectre resource at <https://cs.uwaterloo.ca/~csk/spectre/>. QR code generated with <https://stablediffusion.fr>.

### Related work and inspiration

- [Evaporation-induced self-assembling of few-layer graphene into a fractal-like conductive macro-network](https://arxiv.org/abs/2301.03397)
- Nils Berglund ([@NilsBerglund](https://twitter.com/NilsBerglund)) — particles of larger charge forming "molecules":

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/kicn2fX11CI?si=hfFMimbjx9f6fAk6" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

---

## Contributing & feedback

If you're interested in extending the experiment, reproducing the apparatus, or have observations of your own, please open an [issue](https://github.com/karegeo/floatiles/issues) or pull request.
