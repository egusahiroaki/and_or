require "and_or/version"

module AndOr
  class RegExp
    if value.kind_of? Array
      @regexp = value.split(",").dup
    else
      @regexp = Array(value.split(",").dup)
    end

    # 合致しているかどうかのフラグ
    # true:  条件を満たす
    # false: 条件を満たさない
    @match = false
  end

  # 単一入力と複数入力のものを分類する
  def classify
    @multi_elms  = []
    @single_elms = []
    @regexp.each do |regexp|
      if regexp.split(" ").length > 1 # 複数語が入寮されている時
        @multi_elms << regexp
      else
        @single_elms << regexp
      end
    end
  end

  #[TODO] より良い書き方
  def check_single(content)
    if @single_elms.length > 0
      @single_elms.each do |single_elm|
        deleted_space_elm = single_elm.strip
        @match =  true  if content.include?  deleted_space_elm
      end
    end
  end

  # [TODO] より良い書き方
  def check_multi(content)
    # 条件一致がない場合のみ、ここの処理は走らせる（効率化のため）
    if @multi_elms.length > 0 && !@match
      @multi_elms.each do |multi_elm|
        # ここの処理でスペースを削除し、文字列の一致を見る。

        # 単語の数を初期化
        and_num = 0

        # スペースで分割、空文字、nilを削除する
        target_words = multi_elm.split(/[[:space:]]/).compact.reject(&:empty?)
        target_words.each do |word|
          and_num+=1 if content.include? word
        end

        if and_num == target_words.length
          @match = true
        end
      end
    end
  end

  # 入力に対する結果
  def result
    @match
  end
end
