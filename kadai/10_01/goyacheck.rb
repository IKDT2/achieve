# データを受け取り、返却するCGIプログラムの起動
require 'cgi'
cgi = CGI.new

# データを受け取った後、HTMLの形式でレスポンスを返す
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  # 情報の目印とした"goya"のデータを cgi['goya']と言う記述で取り出し、ローカル変数に代入する
  get = cgi['goya']

  # HTMLでレスポンスを返却する
  "<html>
    <body>
    <style>
      table{text-align:center; border:1px solid #ccc;}
      th,td{border:1px solid #ccc;}
    </style>
      <h1>出力結果</h1>
      <table>
        <tr>
          <th>長さ</th><th>重さ</th><th>譲渡先</th><th>譲渡日</th>
        </tr>
        #{get}
      </table>
    </body>
  </html>"
}