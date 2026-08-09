# FloaTiles

**Self-assembly based on the Cheerios effect and aperiodic monotiles.**

A small experimental project by Georgii Karelin ([all projects](https://karegeo.github.io/)) at the [Embodied Cognitive Science Unit (ECSU)](https://www.oist.jp/research/research-units/ecsu), Okinawa Institute of Science and Technology Graduate University (OIST).

<https://karegeo.github.io/floatiles/>

<sub>*Last updated: 2026-08-09 05:49 UTC*</sub>

---

## About

FloaTiles is a simple, affordable tabletop experiment. Identical 3D-printed polygonal tiles float on a shallow water surface and slowly come together because of the *Cheerios effect* — the familiar capillary attraction that makes breakfast cereal clump in a bowl of milk. Adding gentle vibration or airflow changes how the tiles aggregate and break apart, and the shape of the tile (we mostly use the recently discovered *Hat* and *Spectre* aperiodic monotiles) influences the patterns that emerge.

The goal of the project is modest: to see how much interesting collective behaviour can come out of very simple ingredients — geometry, surface tension, and a bit of noise — without any electronics or active components in the tiles themselves. Further analysis of the recordings is ongoing.

**Status (May 2026):** paper in preparation for the AROB / ICAROB conference series; in-browser simulation v1 live; Hat- and Spectre-tile experiments ongoing.

---

## Interactive simulation

A small in-browser simulation of the on-lattice cluster–cluster aggregation model that we use to compare against the experiment:

➡ **[Open the simulation](simulation.html)**

<iframe src="simulation.html" width="100%" height="600" style="border:1px solid #2a2f3a;border-radius:6px;" title="FloaTiles LCCA simulation"></iframe>

Sliders let you change the surface density φ, the sticking probability *p*<sub>stick</sub>, the evaporation rate *ε*, and the diffusion exponent *γ*. Live stats show the number of clusters, the largest cluster, and the mean cluster size. The algorithm is a faithful port of the C reference (`lcca_v18`): 50×50 grid, 8-direction isotropic diffusion with size-dependent mobility, per-face stochastic sticking with union-find + BFS relabel, surface evaporation with short-range teleport that conserves the total tile count.

---

## ALIFE 2024

Karelin, G. (2024). *Floatiles: Self-Assembly Based On Cheerios Effect and Aperiodic Monotiles.* ALIFE 2024 (extended abstract).

- [ALIFE 2024 — extended abstract (PDF)](ALife_conference_2024___Submission_32___Camera_Ready.pdf)
- [ALIFE 2024 — poster (PDF)](ALIFE_2024_OIST_LaTeX_Template__OIST_Posters-1.pdf)

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

### A theoretical anchor: the Smoluchowski equation

The classical starting point for thinking about aggregation kinetics is **Smoluchowski's coagulation equation** (Smoluchowski, 1916). If $n_k(t)$ is the number density of clusters of size $k$ at time $t$, and $K_{ij}$ is the rate at which clusters of size $i$ and $j$ meet and merge, then

$$
\frac{\partial n_k}{\partial t} \;=\; \tfrac{1}{2}\sum_{i+j=k} K_{ij}\,n_i\,n_j \;-\; n_k \sum_{j=1}^{\infty} K_{kj}\,n_j .
$$

The first term creates clusters of size $k$ by merging smaller ones; the second removes them by merging with anything else. In FloaTiles, where agitation (vibration, airflow) breaks clusters apart, the natural extension is the **aggregation–fragmentation** version, with an additional fragmentation kernel $F_{ij}$:

$$
\frac{\partial n_k}{\partial t} \;=\; \tfrac{1}{2}\!\!\sum_{i+j=k}\!\! K_{ij}\,n_i\,n_j \;-\; n_k\!\sum_{j\ge 1}\! K_{kj}\,n_j \;-\; n_k \,\Gamma_k \;+\!\!\sum_{i+j=k}\!\! F_{ij}\,n_{i+j} ,
$$

where $\Gamma_k = \sum_{i+j=k} F_{ij}$ is the total fragmentation rate of clusters of size $k$. The shape of $K_{ij}$ and $F_{ij}$ encodes the physics: the geometry of the tiles, the strength of the capillary bond, and the level of agitation. These coarse-grained rates are exactly what FloaTiles, viewed as an aggregation-kinetics experiment, can be used to probe.

---

## Apparatus

A shallow rectangular pool sits on a slab supported by a modular perforated-steel-strut frame. A small DC motor with an eccentric mass is mounted underneath and couples vibration into the slab and the water; a household speed controller (JDT-001) lets us adjust amplitude and frequency. Optional small fans and an aquarium bubble generator provide alternative ways of adding noise. A USB webcam above the pool records the experiment.

The frame and pool are described by a parametric OpenSCAD model. The model is a *conceptual* rendering made after the table was already built from available materials — it is close to the real apparatus but is not a literal blueprint of this particular table.

Source: [`apparatus.scad`](apparatus.scad). Open it in [OpenSCAD](https://openscad.org/) to inspect, modify, or render the geometry.

🖱️ **[Open the 3D viewer in its own page](apparatus_3d.html)** (Three.js, ~2 MB STL)

<iframe src="apparatus_3d.html" width="100%" height="600" style="border:1px solid #2a2f3a;border-radius:6px;" title="FloaTiles apparatus 3D viewer"></iframe>

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

[Full poster (PDF)](Poster%20CCS2023stable.pdf)

---

## References

1. Vella, D. & Mahadevan, L. (2005). *The "Cheerios effect."* American Journal of Physics 73(9), 817–825. [doi:10.1119/1.1898523](https://doi.org/10.1119/1.1898523)
2. Gifford, W. A. & Scriven, L. E. (1971). *On the attraction of floating particles.* Chemical Engineering Science 26(3), 287–297. [doi:10.1016/0009-2509(71)83003-8](https://doi.org/10.1016/0009-2509(71)83003-8)
3. Hosokawa, K., Shimoyama, I. & Miura, H. (1994). *Dynamics of self-assembling systems: analogy with chemical kinetics.* Artificial Life 1(4), 413–427. [doi:10.1162/artl.1994.1.4.413](https://doi.org/10.1162/artl.1994.1.4.413)
4. Hosokawa, K., Shimoyama, I. & Miura, H. (1996). *Two-dimensional micro-self-assembly using the surface tension of water.* Sensors and Actuators A 57(2), 117–125. [doi:10.1016/S0924-4247(97)80102-1](https://doi.org/10.1016/S0924-4247(97)80102-1)
5. Bowden, N., Terfort, A., Carbeck, J. & Whitesides, G. M. (1997). *Self-assembly of mesoscale objects into ordered two-dimensional arrays.* Science 276, 233–235. [doi:10.1126/science.276.5310.233](https://doi.org/10.1126/science.276.5310.233)
6. Bowden, N., Choi, I. S., Grzybowski, B. A. & Whitesides, G. M. (1999). *Mesoscale self-assembly of hexagonal plates using lateral capillary forces.* JACS 121(23), 5373–5391. [doi:10.1021/ja983882z](https://doi.org/10.1021/ja983882z)
7. Whitesides, G. M. & Grzybowski, B. (2002). *Self-assembly at all scales.* Science 295, 2418–2421. [doi:10.1126/science.1070821](https://doi.org/10.1126/science.1070821)
8. Smith, D., Myers, J. S., Kaplan, C. S. & Goodman-Strauss, C. (2024). *An aperiodic monotile.* Combinatorial Theory 4(1). [doi:10.5070/C64163843](https://doi.org/10.5070/C64163843)
9. Smith, D., Myers, J. S., Kaplan, C. S. & Goodman-Strauss, C. (2023). *A chiral aperiodic monotile.* [arXiv:2305.17743](https://arxiv.org/abs/2305.17743)
10. Hooshanginejad, A. et al. (2024). *Interactions and pattern formation in a macroscopic magnetocapillary SALR system of mermaid cereal.* Nature Communications 15, 5466. [doi:10.1038/s41467-024-49754-4](https://doi.org/10.1038/s41467-024-49754-4)
11. Wilt, J. K., Schramma, N., Bottermans, J.-W. & Jalaal, M. (2024). *ActiveCheerios: 3D-printed Marangoni-driven active particles at an interface.* [arXiv:2411.16011](https://arxiv.org/abs/2411.16011)
12. Eatson, J. L., Morgan, S. O., Horozov, T. S. & Buzza, D. M. A. (2024). *Programmable 2D materials through shape-controlled capillary forces.* PNAS 121(35). [doi:10.1073/pnas.2401134121](https://doi.org/10.1073/pnas.2401134121)
13. Smoluchowski, M. (1916). *Drei Vorträge über Diffusion, Brownsche Molekularbewegung und Koagulation von Kolloidteilchen.* Physikalische Zeitschrift 17, 557–585.
14. Brilliantov, N. V. et al. (2018). *Steady oscillations in aggregation–fragmentation processes.* Physical Review E 98, 012109. [doi:10.1103/PhysRevE.98.012109](https://doi.org/10.1103/PhysRevE.98.012109)
15. Witten, T. A. & Sander, L. M. (1981). *Diffusion-limited aggregation, a kinetic critical phenomenon.* Physical Review Letters 47(19), 1400–1403. [doi:10.1103/PhysRevLett.47.1400](https://doi.org/10.1103/PhysRevLett.47.1400)
16. Meakin, P. (1984). *The effects of rotational diffusion on the fractal dimensionality of structures formed by cluster–cluster aggregation.* J. Chem. Phys. 81(10), 4637–4639. [doi:10.1063/1.447398](https://doi.org/10.1063/1.447398)
17. Karelin, G. (2024). *Floatiles: Self-Assembly Based On Cheerios Effect and Aperiodic Monotiles.* ALIFE 2024: Proceedings of the 2024 Artificial Life Conference, MIT Press.
18. Vassileva, N. D., van den Ende, D., Mugele, F. & Mellema, J. (2005). *Capillary forces between spherical particles floating at a liquid–liquid interface.* Langmuir 21(24), 11190–11200. [doi:10.1021/la051186o](https://doi.org/10.1021/la051186o)
19. Ginot, F., Theurkauff, I., Detcheverry, F., Ybert, C. & Cottin-Bizonne, C. (2018). *Aggregation–fragmentation and individual dynamics of active clusters.* Nature Communications 9, 696. [doi:10.1038/s41467-017-02625-7](https://doi.org/10.1038/s41467-017-02625-7)
20. Miyashita, S., Nagy, Z., Nelson, B. J. & Pfeifer, R. (2009). *The influence of shape on parallel self-assembly.* Entropy 11(4), 643–666. [doi:10.3390/e11040643](https://doi.org/10.3390/e11040643)
21. Ko, H., Hadgu, M., Komilian, K. & Hu, D. L. (2022). *Small fire ant rafts are unstable.* Physical Review Fluids 7(9), 090501. [doi:10.1103/PhysRevFluids.7.090501](https://doi.org/10.1103/PhysRevFluids.7.090501)
22. Haghighat, B., Droz, E. & Martinoli, A. (2015). *Lily: a miniature floating robotic platform for programmable stochastic self-assembly.* IEEE ICRA 2015. [doi:10.1109/ICRA.2015.7139452](https://doi.org/10.1109/ICRA.2015.7139452)
23. Sayama, H. (2025). *Swarm systems as a platform for open-ended evolutionary dynamics.* Phil. Trans. R. Soc. A 383(2289), 20240143. [doi:10.1098/rsta.2024.0143](https://doi.org/10.1098/rsta.2024.0143)
24. Zhao, L., Jiang, Y., She, C.-Y., Li, A. Q., Chen, M. & Balkcom, D. (2026). *SoftRafts: floating and adaptive soft modular robots.* npj Robotics 4, 8. [doi:10.1038/s44182-025-00070-z](https://doi.org/10.1038/s44182-025-00070-z)
25. Voigt, J. et al. (2025). *An aperiodic chiral tiling by topological molecular self-assembly.* Nature Communications 16, 83. [doi:10.1038/s41467-024-55405-5](https://doi.org/10.1038/s41467-024-55405-5)
26. Lattuada, M. (2012). *Predictive model for diffusion-limited aggregation kinetics of nanocolloids under high concentration.* J. Phys. Chem. B 116(1), 120–129. [doi:10.1021/jp2097839](https://doi.org/10.1021/jp2097839)
27. Wolfram, S. (2023). *Aggregation and Tiling as Multicomputational Processes.* Stephen Wolfram Writings, November 2023. [writings.stephenwolfram.com](https://writings.stephenwolfram.com/2023/11/aggregation-and-tiling-as-multicomputational-processes/)

The full BibTeX file for these references is available in the repository as [`references.bib`](references.bib).

---

## Acknowledgments

This project would not have been possible without the help of the **OIST Embodied Cognitive Science Unit (ECSU)**: **Stephen Estelle** for 3D printing and laser cutting, **Brian Morrissey** for the vibrational platform, and **Tom Froese** for supervision and support. **Roman Mukhin** kindly helped with the first 3D print. The first pilot experiments were carried out during an educational visit to the **Takashi Ikegami Laboratory** at the University of Tokyo, with the help of [johnsmith](http://johnsmithstudios.com).

### Shape data

Tile-design files originally drew on Christian Lawson-Perfect's [**aperiodic-monotile**](https://github.com/christianp/aperiodic-monotile) repository, Craig Kaplan's [**spectre resource**](https://cs.uwaterloo.ca/~csk/spectre/), and the [**Hat**](https://polytope.miraheze.org/wiki/Hat) page on the Polytope Wiki. The underlying geometry is mathematical knowledge and not in itself copyrightable; these sources are credited as the origin of the data used here.

### Web page

This web page was assembled with the help of Anthropic's **Claude** (Claude Code), working from drafts and source material provided by the author. All scientific content, decisions, and any remaining errors are the author's own.

---

## Related concepts and reading

Background reading that the FloaTiles project sits next to. Most of these are general overview pages — useful starting points if you want to dig into the physics, mathematics, or artificial-life context.

### Physics and self-organisation

- [**Self-assembly** (Wikipedia)](https://en.wikipedia.org/wiki/Self-assembly) — the umbrella concept: components organising into ordered structures without external guidance. FloaTiles is a macroscopic, capillary-driven case of this.
- [**Self-organization** (Scholarpedia)](http://www.scholarpedia.org/article/Self-organization) — a careful definition emphasising the difference between self-organisation (pattern emergence in a dynamical system) and self-assembly (a special case where the products are equilibrium structures).
- [**Emergence** (Wikipedia)](https://en.wikipedia.org/wiki/Emergence) — what we mean when "a whole has properties its parts do not have on their own."
- [**Cheerios effect** (Wikipedia)](https://en.wikipedia.org/wiki/Cheerios_effect) — the specific capillary phenomenon that FloaTiles uses.
- [**Capillary action** (Wikipedia)](https://en.wikipedia.org/wiki/Capillary_action) — the underlying interfacial physics.
- [**Surface tension** (Wikipedia)](https://en.wikipedia.org/wiki/Surface_tension).

### Aggregation and pattern formation

- [**Diffusion-limited aggregation** (Wikipedia)](https://en.wikipedia.org/wiki/Diffusion-limited_aggregation) — the canonical stochastic model for fractal aggregation (Witten & Sander, 1981). Cluster–cluster aggregation is its many-cluster cousin and is the most natural theoretical reference point for the patterns FloaTiles produces.
- [**Active matter** (Wikipedia)](https://en.wikipedia.org/wiki/Active_matter) — a coarse-grained description of collective behaviour in systems whose individual units are *driven* (each unit appears to inject energy at its own scale). FloaTiles is driven only externally — at the level of the whole pool — and the individual tiles themselves are passive. The line between "active" and "passive" is really a statement about where, in the coarse-grained description, the drive enters.
- [**Granular material** (Wikipedia)](https://en.wikipedia.org/wiki/Granular_material) — vibrated granular layers also show rich pattern formation and segregation, and share several technical questions (Faraday-like instabilities, jamming, anisotropy of agitation) with FloaTiles.
- Stephen Wolfram considers tiling as a form of computation: [*Aggregation and Tiling as Multicomputational Processes*](https://writings.stephenwolfram.com/2023/11/aggregation-and-tiling-as-multicomputational-processes/)

### Self-assembly as a manufacturing approach

- [**Self-assembly based manufacturing** (Wikipedia)](https://en.wikipedia.org/wiki/Self-assembly_based_manufacturing) — using self-assembly to build structures, from DNA origami to mesoscale capillary assembly (Whitesides and collaborators).
- [**Programmable matter** (Wikipedia)](https://en.wikipedia.org/wiki/Programmable_matter) — a long-running adjacent goal: matter whose properties can be reconfigured by design or signal.

### Aperiodic order

- [**Aperiodic tiling** (Wikipedia)](https://en.wikipedia.org/wiki/Aperiodic_tiling) — tilings that admit no translational symmetry.
- [**Einstein problem** (Wikipedia)](https://en.wikipedia.org/wiki/Einstein_problem) — the question of a single tile that tiles only aperiodically. Solved in 2023 by Smith, Myers, Kaplan & Goodman-Strauss with the *Hat* and *Spectre*.
- [**Quasicrystal** (Wikipedia)](https://en.wikipedia.org/wiki/Quasicrystal) — physical solids with long-range aperiodic order; the deep physical motivation for studying aperiodic tilings.
- [**Penrose tiling** (Wikipedia)](https://en.wikipedia.org/wiki/Penrose_tiling) — the classical pair of aperiodic tiles.

### Artificial life context

- [**Artificial life** (Wikipedia)](https://en.wikipedia.org/wiki/Artificial_life) — the field FloaTiles is presented in.
- [**Open-ended evolution** (Wikipedia)](https://en.wikipedia.org/wiki/Open-ended_evolution) — the longer-term question of whether systems like FloaTiles can be enriched into substrates where novelty keeps appearing.
- [**ALIFE conference series**](https://alife.org/) — the annual international conference on artificial life.
- [**ISAL — International Society for Artificial Life**](https://alife.org/about-isal/) — the society that organises ALIFE.
- [**ISAROB — International Society for Artificial Life and Robotics**](https://isarob.org/) — host of the AROB conference.

### Institutional

- [**OIST Embodied Cognitive Science Unit (ECSU)**](https://www.oist.jp/research/research-units/ecsu) — the home unit for the FloaTiles project at OIST.
- [**Okinawa Institute of Science and Technology Graduate University (OIST)**](https://www.oist.jp/) — the host institution.

### Related work and inspiration

- [Evaporation-induced self-assembling of few-layer graphene into a fractal-like conductive macro-network](https://arxiv.org/abs/2301.03397)
- Nils Berglund ([@NilsBerglund](https://twitter.com/NilsBerglund)) — particles of larger charge forming "molecules":

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/kicn2fX11CI?si=hfFMimbjx9f6fAk6" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

---

## Contributing & feedback

If you're interested in extending the experiment, reproducing the apparatus, or have observations of your own, please open an [issue](https://github.com/karegeo/floatiles/issues) or pull request.
