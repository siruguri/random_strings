require "random_strings/version"

module RandomStrings
  class Config
    def initialize(*args)
      args.each do |method_name|
        self.class.class_exec do

          define_method("#{method_name}") do
            eval "@#{method_name}"
          end
          define_method("#{method_name}=") do |inp|
            eval "@#{method_name}=inp"
          end
        end
      end
    end
  end

  class Generator
    def initialize(&block)
      @config=Config.new(:tld_list, :default_string_length, :default_number_length)
      @config.tld_list=['.com', '.org', '.net']
      @config.default_string_length=10
      @config.default_number_length=5

      if block
        block.call @config
      end
    end

    def random_string(count=-1)
      if count == -1
        count = @config.default_string_length
      end
      selection = (Range.new('a', 'z').to_a | Range.new('A', 'Z').to_a)
      count.times.map { selection[Random.rand()*selection.size] }.join ""
    end

    def random_array_element(arr)
      arr[Random.rand*arr.size]
    end
    
    def random_email
      random_string + '@' + random_string + random_array_element(@config.tld_list)
    end

    def random_digits(count=-1)
      if count == -1
        count = @config.default_number_length
      end
      selection = Range.new('0', '9').to_a
      count.times.map { selection[Random.rand()*selection.size] }.join ""
    end
    
    def random_zip
      return random_digits 5
    end
  end
end
