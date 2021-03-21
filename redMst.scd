// SuperCollider workshop at WOMB LOUNGE 2012

////////////////////////////////////////////////////////////////////

1. RedMstとRedTrk

RedMstとRedTrkを用いることで、複数のPbindを扱うことができます。

	// 一つのトラックの例
	RedTrk(
		\bass,									// トラック名
		Pbind(\degree, Pseq([0, 5], inf), \octave, 4),	// トラックのアイテム（Pbind）
		#[0, 1, 2, 3]								// 再生するセクション番号
	);


	(

		RedMst.clear;									// トラックを削除しておく
		RedMst.clock= TempoClock(150/60);			// クロックを定義しておく
		RedMst.quant= 4;								// 4拍ごとに再生セクションを移動

		RedTrk(
			\bass,
			Pbind(\degree, Pseq([0, 5], inf), \octave, 4, \instrument, \test),

			#[0, 1, 2, 3]
		);

		RedTrk(
			\melody,
			Pbind(\degree, Pseq([0, 5, 2, 3, 3, 1], inf), \dur, Pseq([0.25, 0.25, 0.5], inf), \instrument, \test),
			#[1, 2, 5]
		);

		RedTrk(
			\melody2,
			Pbind(\degree, Pseq([7, 6, 4, 3], inf), \dur, 2, \octave, 6, \instrument, \test),
			#[2, 3]
		);

	)

		RedMstGUI(30);
		RedMst.play; // 再生
		RedMst.clock.tempo =90/60; // テンポを変更する
		RedMst.goto(3); // 任意のセクションに移動
		RedMst.stop; // 停止


////////////////////////////////////////////////////////////////////