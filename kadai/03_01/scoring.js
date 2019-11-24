$(function(){ //処理説明①：HTML Fileを読込み（画像などは除く）DOM生成が終わってから処理を開始する
  function score_indicate(){
    // このような記述をすることで、subject_pointsという変数の中に
    // [国語の点数,英語の点数,数学の点数,理科の点数,社会の点数]という配列を作成できる。
    let subject_points = [
			Number($('#national_language').val()), //処理説明④＆⑤：指定した要素ノードにおいて、val()でvalue値を取得し、Numberで値が数値か判定している
			Number($('#english').val()),
			Number($('#mathematics').val()),
			Number($('#science').val()),
			Number($('#society').val())
		];

    // さらにこのような記述をすることで、「合計点：」となっている右の部分に合計点が出力される
    let sum = subject_points[0];
    sum = sum + subject_points[1];
    sum = sum + subject_points[2];
    sum = sum + subject_points[3];
    sum = sum + subject_points[4];
    $("#sum_indicate").text(sum); //処理説明⑥：指定した要素ノードの中身を変数sumの値に追加・置換・変更している

    // ここに、上記を参考にして平均点を出力する処理を書き込む
		let average = sum / subject_points.length;
		$("#average_indicate").text(average);
		return average;
  };

  function get_achievement(){
    // ここに、ランクの値の文字列（平均点が80点以上なら"A"、60点以上なら"B"、40点以上なら"C"、それ以下なら"D"）を出力する処理を書き込む
		let average =  score_indicate();
		if ( average >= 80){
				return "A";
		} else if( average >= 60){
				return "B";
		} else if( average >= 40){
				return "C";
		} else {
				return "D";
		}
	}

  function get_pass_or_failure(){
    // ここに、全ての教科が60点以上なら"合格"の文字列、一つでも60点未満の教科があったら"不合格"の文字列を出す処理を書き込む
		
		let subject_points = [
			Number($('#national_language').val()),
			Number($('#english').val()),
			Number($('#mathematics').val()),
			Number($('#science').val()),
			Number($('#society').val())
		];
		
		let number = subject_points.length;
		let passline = 60;
		let judge;
		for (let i=0; i<number; i++){
			if(subject_points[i] >= passline){
				judge = "合格";
			} else {
				judge = "不合格";
				break;
			}
		}
		return judge;
  }

  function judgement(){
    // ここに、「最終ジャッジ」のボタンを押したら「あなたの成績はAです。合格です」といった内容を出力する処理を書き込む
    // 下記の記述をすることで、「最終ジャッジ」のボタンを押すと「あなたの成績は（ここに「ランク」の値を入れる）です。（ここに「判定」の値を入れる）です」という文字の入った水色のフキダシが出力される処理が実装される。
		let achievement = get_achievement();
    let pass_or_failure =  get_pass_or_failure();
    $('#declaration').append(`<label id="alert-indicate" class="alert alert-info">${achievement}です。${pass_or_failure}です</label>`); //処理説明⑦：指定した要素ノードの最後にテキストやHTML要素を追加する
  };



  $('#national_language, #english, #mathematics, #science, #society').change(function(){ // 処理説明③：指定した要素ノード内の要素が変更されたらスコープ？内の処理が実行される
    score_indicate();
  });

  $('#btn-evaluation').click(function(){ // 処理説明②：要素ノード#btn-evaluationがクリックされたらイベント発火し、スコープ？内の処理が実行される
    let rank = get_achievement();
    $('#evaluation').text(rank);
  });

  $('#btn-judge').click(function(){
    let judge = get_pass_or_failure();
		$('#judge').text(judge);
  });

  $('#btn-declaration').click(function(){
    let finalJudge = judgement();
  });
});