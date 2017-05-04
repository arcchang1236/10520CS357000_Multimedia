總共有三個主要的執行檔，分別是HW3_1a.m、HW3_1b.m、HW3_2.m，
跑完後會將差異的黑白圖存在Result資料夾裡面，命名中第一段有顯示題號；
而command line中會顯示total SAD和PSNR的結果，其中第一題的顯示順序為
(1) macroblock 8*8, p = 8, Full-Search
(2) macroblock 8*8, p = 16, Full-Search
(3) macroblock 8*8, p = 8, 2D-Log-Search
(4) macroblock 8*8, p = 16, 2D-Log-Search
(5) macroblock 16*16, p = 8, Full-Search
(6) macroblock 16*16, p = 16, Full-Search
(7) macroblock 16*16, p = 8, 2D-Log-Search
(8) macroblock 16*16, p = 16, 2D-Log-Search

還有一個執行檔是timeCompare.m，他跑出來會是第三點中所要比較的四種時間結果，
顯示在command line上面。