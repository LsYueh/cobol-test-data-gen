# COBOL Sample Project

這是一個最小可用的 COBOL 專案範例，用來示範：

- COBOL 程式基本結構
- COPYBOOK（`.cpy`）的使用
- DISPLAY 與數值格式化（含 COMP / COMP-3）
- 在現代開發環境（macOS + VS Code）中執行 COBOL

本專案以 **GnuCOBOL** 為編譯與執行環境。

<br>

## 專案結構

```text
.
├─ bin/               # 產出物
├─ src/
│  ├─ READ-TEST.CBL
│  └─ WRITE-TEST.CBL
├─ copybook/
│  └─ TEST.CPY        # COPYBOOK
├─ data/
│  └─ OUT.DAT         # WRITE-TEST 輸出的測試資料
└─ README.md
```

<br><br>

# 環境需求
- macOS（Intel 或 Apple Silicon）
- Homebrew
- GnuCOBOL 3.x 以上（建議）

<br><br>

# 在 macOS 安裝 GnuCOBOL

## 1. 安裝 Homebrew（若尚未安裝）
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

安裝完成後，請確認：
```sh
brew --version
```

<br>

## 2. 安裝 GnuCOBOL
```sh
brew install gnu-cobol
```

確認安裝成功：
```sh
cobc --version
```

應該會看到類似：
```sh
cobc (GnuCOBOL) 3.2.0
Copyright (C) 2023 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
Written by Keisuke Nishida, Roger While, Ron Norman, Simon Sobisch, Edward Hart
Built     Jul 28 2023 18:42:18
Packaged  Jul 28 2023 17:02:56 UTC
C version "Apple LLVM 16.0.0 (clang-1600.0.26.6)"
```

<br>

## 3. 編譯與執行
● 呼叫Task中的 `Compile: cobc (single file)` 編譯目前開啟的 `.CBL`  
> `⌘ Cmd / Ctrl(Win)` + `Shift` + `B`  

<br>

● 使用 `cobcrun` 執行  
```sh
cobcrun ./bin/WRITE-TEST
```
```sh
cobcrun ./bin/READ-TEST

ID:   12345
AMT:       100.50
NAME: JOHN SMITH
ID:   67890
AMT:  -     50.25
NAME: JANE DOE  

```

<br>

## 編譯成可執行檔 (選做)
```sh
cobc -x -o test src/test.cbl -I copybook
./test
```
- `x`：產生可執行檔

- `I copybook`：指定 COPYBOOK 搜尋路徑

<br><br>
