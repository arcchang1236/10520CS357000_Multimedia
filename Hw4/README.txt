這次的作業分成兩部分:
Part I: 有兩個執行檔hw4_part1_40.m和hw4_100_part1_100.m，執行後要標點(39和99個點)，完成按Enter執行，
	會得到三張結果圖result_XX_low.png、result_XX_high.png、result_XX_big.png，前兩個是Low和High LoD
	，第三個是經過Nearest-neighbor resize後和代入scaled control points算Bezier curves比較的結果。

Part II: 有兩個執行檔makeRGBCube.m和readOBJFile.m，第一個執行後會產生補全後的RGB cube，第二個則會
	分別產生8個figure，分別是:
	(1) HSV Cylinder with 60 vertices each circle
	(2) 經平移後Cyclinder與OBJ model同時顯示在座標空間
	(3) Add Point(Position) light
	(4) Add Directional light
	 -------------------------------------------------------------------------------------------
	Add different ambient strength ka, diffuse strength kd, specular strength ks [ka, kd, ks]
	(5) [ 1.0, 0.0, 0.0 ]
	(6) [ 0.1, 1.0, 0.0 ]
	(7) [ 0.1, 0.1, 1.0 ]
	(8) [ 0.1, 0.8, 1.0 ]