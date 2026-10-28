# [Sega Saturn](https://en.wikipedia.org/wiki/Sega_Saturn) for MiSTer

## Experimental update

The `update-official-20261024` branch integrates official source from 2026-10-24. See [LLAPI testing and build instructions](LLAPI-TESTING.md) and the **LLAPI experimental test build** Actions artifacts. This is not a stable release; physical testing is required.

## LLAPI notes

OG Digital and 3D controllers are supported.

Limitations due to FPGA space:		
- Lightgun not supported
- Mouse not supported
- Steering wheel not supported
- Dual Mission not supported

files.qip and rtl/hps2pad.sv have been modified to remove support for the above controllers and make the LLAPI implementation fit in the core.

## Hardware Requirements

- 128 MB SDRAM Module (Primary)
- SDRAM Module of any size (32MB-128MB) (Secondary)

> **Note:** Dual SDRAM modules is recommended for better compatibility.

## Status

The core has matured substantially, with many games tested over the course of development.

Known issues and limitations are tracked in this repository's issue list rather than in a game-by-game list here.

