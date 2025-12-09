# [Sega Saturn](https://en.wikipedia.org/wiki/Sega_Saturn) for MiSTer

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

Current status is WIP/Beta

Known issues:

