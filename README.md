# Phison PS3111-S11 Firmware Flasher & Repair Toolkit (Toshiba 64L BiCS3 TLC)

Toolkit lengkap untuk revive dan flashing SSD berbasis controller **Phison PS3111-S11** (contoh: Apacer AS340 240GB / SATAFIRM S11) yang mengalami kerusakan bad block parah (>162 bad blocks per plane) pada NAND flash **Toshiba 64L BiCS3 TLC** (TH58TFT1V23BA8H).

## Isi Paket:
1. **`fw_patched_120G.exe`**
   - Flasher portabel yang sudah dimodifikasi:
     - Byte offset `0xFE2A`: `74 3E` -> `EB 42` (force `EraseAll` / bypass defect check).
     - Byte offset `0x195D84..0x195D87`: `B0 4B F9 0D` (set LBA 120GB: `234,441,648` sektor).
     - Menjamin SSD tidak kehabisan blok cadangan fisik akibat 402 bad blocks di Bank02/0.
2. **`SBFM61.3_11032021.BIN`**
   - Firmware binary resmi Phison S11 untuk Toshiba BiCS3 64L TLC.
3. **`MPTool_PS3111Mod/`**
   - Phison PS3111 Mass Production Tool (MPTool v7.0 & v6.0) dengan file parameter bawaan untuk inisialisasi pabrik.
4. **`s11-flasher_builder/`**
   - Toolkit pembuat firmware executable dari Ochkin Vadim (vlo).

## Cara Penggunaan di Windows:
1. Hubungkan SSD ke PC Windows (SATA caddy atau port internal).
2. Jika SSD masih mentok di ROM mode (`SATAFIRM S11` / `PS3111`), tancapkan jumper ROM selama 2-3 detik saat kabel power dicolok, lalu lepas jumpernya.
3. Jalankan **`fw_patched_120G.exe`** sebagai **Administrator**.
4. Pilih SSD target, lalu klik **Upgrade** / **Start**.
5. Tunggu hingga muncul notifikasi sukses, lalu power cycle / cabut-pasang kabel SSD.
6. Masuk ke **Disk Management**, inisialisasi partisi (120 GB), dan format NTFS/exFAT.
