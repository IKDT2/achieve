# データを受け取り、返却するCGIプログラムの起動
require 'cgi'
cgi = CGI.new

# データを受け取った後、HTMLの形式でレスポンスを返す
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  # 情報の目印とした"goya"のデータを cgi['goya']と言う記述で取り出し、ローカル変数に代入する
  get = cgi['goya2']

  # HTMLでレスポンスを返却する
  "<html>
    <body>
    <style>
      table{text-align:center; border:1px solid #ccc;}
      th,td{border:1px solid #ccc;}
    </style>
      <h1>課題出力結果</h1>
      <h2>外部出荷ゴーヤ情報</h2>
      <table>
        <tr>
        <th>出荷先</th><th>長さ</th><th>重さ</th><th>品質</th><th>譲渡日</th>
        </tr>
        #{get}
      </table>
    </body>
  </html>"
}