$ ->
  $('#cover-image').click ->
    $('#article_image').click()
    false

  $('#article_image').on 'change', (e) ->
    console.log(e)
    file = e.target.files[0]
    reader = new FileReader
    $preview = $('.article-image')
    t = this
    
    if file.type.indexOf('image') < 0
      return false

    # ファイル読み込みが完了した際のイベント登録
    reader.onload = do (file) ->
      (e) ->
        #既存のプレビューを削除
        $preview.empty()
        # .prevewの領域の中にロードした画像を表示するimageタグを追加
        $preview.attr("src",e.target.result)
        return
    reader.readAsDataURL file
    return
  return