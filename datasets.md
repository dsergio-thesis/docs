---
bibliography: paper.bib
csl: styles/apa.csl
---

## Background

The datasets are constructed using the Rubin Science Platform, which is
a software stack developed for the Vera C. Rubin Observatory. The Rubin
Science Platform provides tools and infrastructure for data processing,
analysis, and visualization, enabling researchers to work with large
astronomical datasets efficiently.

For more information on the Rubin Science Platform, please refer to the
following resources:

- <https://data.lsst.cloud/>

## Dataset Construction

### Step 1: TAP Query

The python package `lsst.rsp` provides a convenient interface to query
the LSST TAP service.

ADQL used:

    SELECT TOP {max_records}
    objectId,
    coord_ra,
    coord_dec,

    -- u
    u_psfFlux,            u_psfFluxErr,            u_psfFlux_flag,
    u_free_cModelFlux,    u_free_cModelFluxErr,    u_free_cModelFlux_flag,

    -- g
    g_psfFlux,            g_psfFluxErr,            g_psfFlux_flag,
    g_free_cModelFlux,    g_free_cModelFluxErr,    g_free_cModelFlux_flag,

    -- r
    r_psfFlux,            r_psfFluxErr,            r_psfFlux_flag,
    r_free_cModelFlux,    r_free_cModelFluxErr,    r_free_cModelFlux_flag,

    -- i
    i_psfFlux,            i_psfFluxErr,            i_psfFlux_flag,
    i_free_cModelFlux,    i_free_cModelFluxErr,    i_free_cModelFlux_flag,

    -- z
    z_psfFlux,            z_psfFluxErr,            z_psfFlux_flag,
    z_free_cModelFlux,    z_free_cModelFluxErr,    z_free_cModelFlux_flag,

    -- y
    y_psfFlux,            y_psfFluxErr,            y_psfFlux_flag,
    y_free_cModelFlux,    y_free_cModelFluxErr,    y_free_cModelFlux_flag,

    refExtendedness

    FROM dp1.Object
    WHERE coord_ra BETWEEN {ra_min} AND {ra_max}
        AND coord_dec BETWEEN {dec_min} AND {dec_max}

### Step 1b: 3D-HST catalog cross-match

The 3D-HST catalog ([Skelton et al.]{.nocase}, 2014) is a photometric
catalog that includes data from the CANDELS survey. We cross-match our
sample with the 3D-HST catalog to obtain additional photometric
information for our sources. The cross-matching is performed using a
positional matching algorithm with a search radius of 1 arcsecond. This
allows us to identify counterparts in the 3D-HST catalog for our
sources, providing us with multi-wavelength photometry that can be used
for further analysis, such as spectral energy distribution (SED) fitting
and redshift estimation.

\# References

::: #refs :::

:::: {#refs .references .csl-bib-body .hanging-indent entry-spacing="0" line-spacing="2"}
::: {#ref-skelton2014 .csl-entry}
[Skelton, R. E., Whitaker, K. E., Momcheva, I. G., & al., et]{.nocase}.
(2014). 3D-HST WFC3-selected photometric catalogs in the five
CANDELS/3D-HST fields. *The Astrophysical Journal Supplement Series*,
*214*(2), 24. <https://doi.org/10.1088/0067-0049/214/2/24>
:::
::::
