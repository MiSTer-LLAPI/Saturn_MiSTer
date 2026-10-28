# Saturn LLAPI updater builds — 28 October 2026

`Saturn_LLAPI_20261028.rbf`: 1 SDRAM. `Saturn_DS_LLAPI_20261028.rbf`: 2 SDRAM.

These are byte-for-byte the RBFs in the public test release below, renamed to follow the updater's dated release naming convention. The source is the release tag/commit linked below; the main branch source has not been merged with the experimental integration.

## Saturn LLAPI — public test build

Updated to the official Saturn core source dated **24 October 2026**, retaining the LLAPI implementation and its controller support.

**Initial hardware testing:** on 28 October 2026, the maintainer tested **both the 1-SDRAM and 2-SDRAM builds** on MiSTer and reported that everything appears to work. Wider compatibility testing is welcome.

### Downloads

- **Saturn-LLAPI-1-SDRAM-experimental.zip** — standard MiSTer configuration with one SDRAM module.
- **Saturn-LLAPI-2-SDRAM-experimental.zip** — dual-SDRAM configuration.
- **Saturn-LLAPI-SHA256SUMS.txt** — checksums for both ZIP files.

Each ZIP contains the RBF, installation notes, `saturn_ramcart.txt`, the original build reports and the RBF checksum. BIOS and game files are not included. Back up your working core and configuration before testing; use the build matching your hardware.

### LLAPI controller support

Original digital and 3D Saturn controllers are supported. To fit the implementation in the FPGA, **Lightgun, Mouse, Steering Wheel and Dual Mission remain unsupported**. The corresponding exclusions in `files.qip` and `rtl/hps2pad.sv` are preserved. LLAPI reserves the USER port.

### Known build limitation

This remains an **experimental pre-release**: both RBFs were generated and fit in the FPGA, but Quartus reported unmet timing requirements. The initial successful hardware tests do not establish timing closure or full game/controller compatibility.

| Build | Logic usage | Setup slack | Hold slack |
| --- | --- | --- | --- |
| 1 SDRAM | 99% | -0.735 ns | -0.456 ns |
| 2 SDRAM | 99% | -1.093 ns | -0.331 ns |

Please report the build used, game, controller and port, and any reproducible issue. Further testing of digital/3D controllers, independent triggers, mixed USB/LLAPI use and Shinobi X is welcome.

### Source and credits

- Official source: [MiSTer-devel/Saturn_MiSTer, c072434](https://github.com/MiSTer-devel/Saturn_MiSTer/commit/c072434a61c88c1d9f5dfae09d502cc1b3e7c326).
- Release source: [6c8abf6](https://github.com/MiSTer-LLAPI/Saturn_MiSTer/commit/6c8abf6be366075eb8a999f3dcf38c1a90c5c53e), branch `update-official-20261024`.
- [Integration PR](https://github.com/MiSTer-LLAPI/Saturn_MiSTer/pull/1) and [build reports](https://github.com/MiSTer-LLAPI/Saturn_MiSTer/actions/runs/40664162181).

All upstream credits, licenses and source histories are preserved. This is an independent LLAPI test release, not an official MiSTer-devel release.

## RBF SHA-256

```
2b2135c562e417d758f01f299f79111d12ea8d9620547bd98e352f563c5ebb4d  Saturn_DS_LLAPI_20261028.rbf
c1e90b1d66764138b930d30430c1465157f3b45969d33193fe4358b3adeea48c  Saturn_LLAPI_20261028.rbf
```

Public test release: https://github.com/MiSTer-LLAPI/Saturn_MiSTer/releases/tag/v2026.10.28-llapi-test
