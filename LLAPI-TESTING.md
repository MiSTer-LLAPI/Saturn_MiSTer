# Saturn LLAPI experimental integration — 2026-10-24 official source

This is a test build, not a stable release. It integrates MiSTer-devel/Saturn_MiSTer commit `c072434` (2026-10-24) with the LLAPI fork at `346b483` (2025-12-09). The official repository's latest checked-in release RBF remains `Saturn_20251003.rbf`; this integration deliberately uses newer source.

Both upstream histories, GPL notices and original author credits are preserved. LLAPI implementation derives from the MiSTer-LLAPI fork; the Saturn core is by Sergey Dvodnenko and the upstream contributors.

## Changes to the integration

- Retains both LLAPI sockets, original digital/3D controller button mappings and the OSD button combination.
- Adapts the controller menu/status fields to the newer four-bit pad types and adds the current 3D-pad packet ending.
- Routes independent left/right analogue triggers through the newer 3D protocol; keeps USB fallback and swaps analogue/digital data together.
- Keeps the LLAPI space-saving exclusions: no virtual lightgun, mouse, wheel or dual mission controller. SNAC shares the user port and is unavailable in LLAPI builds.
- Uses the current official SMPC implementations. The old fork reverted an SMPC change because of Shinobi X: specifically retest that game before considering this stable.

## Build

The `LLAPI experimental test build` GitHub Actions workflow runs controller simulation, then compiles `Saturn` (single SDRAM) and `Saturn_DS` (dual SDRAM) separately with Quartus 17.0.2. Each artifact contains the RBF if compilation succeeds, its checksum, source reference and build reports. A failed build's report artifact does not prove that an RBF was generated. Confirm fitter and timing results before hardware testing.

## Test on MiSTer

1. Preserve your current working RBF and configuration. Use a separate experimental core filename.
2. Copy the matching single/dual SDRAM test RBF into your test cores folder. Primary SDRAM must be 128 MB; dual SDRAM is recommended by upstream.
3. Copy the accompanying `saturn_ramcart.txt` into `games/Saturn/` for the new automatic cartridge selection. Keep your existing BIOS and game files.
4. First use the core's default/fresh settings: pad option bit fields changed upstream, so do not reuse the old LLAPI configuration blindly.
5. Test digital and 3D pads on each LLAPI socket alone, then both together; test USB fallback, mixed USB/LLAPI, both analogue triggers, joystick swap and the OSD combination.
6. Test Shinobi X, BIOS/disc boot, saves, reset on disc insert and automatic cartridge selection in games requiring 1 MB/4 MB RAM.

Simulation covers both 3D pad handshakes, independent trigger bytes, packet ending, USB trigger conversion and independent digital pads. Simulation is not a physical LLAPI/BlisSTer timing test or a substitute for FPGA fitting and timing analysis.
