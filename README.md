# FloaTiles

**Self-assembly based on the Cheerios effect and aperiodic monotiles.**

A small experimental project by Georgii Karelin at the [Embodied Cognitive Science Unit (ECSU)](https://www.oist.jp/research/research-units/ecsu), Okinawa Institute of Science and Technology Graduate University (OIST).

<https://karegeo.github.io/floatiles/>

---

## About

FloaTiles is a simple, affordable tabletop experiment. Identical 3D-printed polygonal tiles float on a shallow water surface and slowly come together because of the *Cheerios effect* — the familiar capillary attraction that makes breakfast cereal clump in a bowl of milk. Adding gentle vibration or airflow changes how the tiles aggregate and break apart, and the shape of the tile (we mostly use the recently discovered *Hat* and *Spectre* aperiodic monotiles) influences the patterns that emerge.

The goal of the project is modest: to see how much interesting collective behaviour can come out of very simple ingredients — geometry, surface tension, and a bit of noise — without any electronics or active components in the tiles themselves. Further analysis of the recordings is ongoing.

---

## ALIFE 2024

Karelin, G. (2024). *Floatiles: Self-Assembly Based On Cheerios Effect and Aperiodic Monotiles.* ALIFE 2024 (extended abstract).

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

### Why it might be interesting

Self-organisation shows up everywhere in nature, from cereal in a bowl to mosquito eggs and fire-ant rafts. FloaTiles is a small attempt to reproduce a tiny corner of that in a controlled, easy-to-rebuild setup, and to see what happens when the tile shape is unusual.

---

## Apparatus

A shallow rectangular pool sits on a slab supported by a modular perforated-steel-strut frame. A small DC motor with an eccentric mass is mounted underneath and couples vibration into the slab and the water; a household speed controller (JDT-001) lets us adjust amplitude and frequency. Optional small fans and an aquarium bubble generator provide alternative ways of adding noise. A USB webcam above the pool records the experiment.

The frame and pool are designed as a parametric OpenSCAD script, so the dimensions can be reproduced or adapted.

### Tiles

- 3D-printed polygonal tiles, roughly 1 cm across.
- Dark filament so they stand out against diffuse illumination.
- A small bright marker on top of each tile makes them easier to track.

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

This project would not have been possible without the help of the **OIST Embodied Cognitive Science Unit (ECSU)**: **Stephen Estelle** for 3D printing and laser cutting, **Brian Morrissey** for the vibrational platform, and **Tom Froese** for supervision and support. **Roman Mukhin** kindly helped with the first 3D print. The first pilot experiments were carried out during an educational visit to the **Takashi Ikegami Laboratory** at the University of Tokyo, with the help of [johnsmith](http://johnsmithstudios.com).

Tile-design files originally drew on <https://github.com/christianp/aperiodic-monotile> and Craig Kaplan's spectre resource at <https://cs.uwaterloo.ca/~csk/spectre/>. QR code generated with <https://stablediffusion.fr>.

### Related work and inspiration

- [Evaporation-induced self-assembling of few-layer graphene into a fractal-like conductive macro-network](https://arxiv.org/abs/2301.03397)
- Nils Berglund ([@NilsBerglund](https://twitter.com/NilsBerglund)) — particles of larger charge forming "molecules":

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/kicn2fX11CI?si=hfFMimbjx9f6fAk6" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

---

## Contributing & feedback

If you're interested in extending the experiment, reproducing the apparatus, or have observations of your own, please open an [issue](https://github.com/karegeo/floatiles/issues) or pull request.
