require "and_or/version"

module AndOr
  class RegExp
    def initialize
      if value.kind_of? Array
        @regexp = value.split(",").dup
      else
        @regexp = Array(value.split(",").dup)
      end

      # flag for content match
      # true:  match
      # false: not match
      @match = false
    end

    def classify
      @multi_elms  = []
      @single_elms = []
      @regexp.each do |regexp|
        if regexp.split(" ").length > 1 # if arguments are multi words
          @multi_elms << regexp
        else
          @single_elms << regexp
        end
      end
    end

    def check_single(content)
      if @single_elms.length > 0
        @single_elms.each do |single_elm|
          deleted_space_elm = single_elm.strip
          @match =  true  if content.include?  deleted_space_elm
        end
      end
    end

    def check_multi(content)
      if @multi_elms.length > 0 && !@match
        @multi_elms.each do |multi_elm|
          and_num = 0
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

    def result
      @match
    end
  end
end
