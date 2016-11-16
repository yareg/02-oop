# functions for reading/saving library data
module DataManipulation
  STORAGE = 'library.yml'.freeze

  def method_missing(method_name, *args, &block)
    match = method_name.to_s.match(/^((add|fetch)_(authors|books|orders|readers)|(fetch)_(book|reader)_by_name)$/)

    if match
      case match[2]
      when 'add'
        __send__("#{match[2]}_data".to_sym, args[0], match[3].to_sym)
      when 'fetch'
        __send__("#{match[2]}_data".to_sym, match[3].to_sym)
      when nil && !match[5].nil?
        compare_field_map = { book: 'title', reader: 'name' }
        __send__(:fetch_item_by_name, args[0], compare_field_map[match[5].to_sym], "#{match[5]}s".to_sym)
      else
        super
      end
    else
      super
    end
  end

  private

  def add_data(data, key)
    data = [data] unless data.is_a? Array
    load_data unless defined? @storage_data
    @storage_data[key] = @storage_data[key].concat data
    write_data(@storage_data)
  end

  def load_data
    no_data = { authors: [], books: [], orders: [], readers: [] }
    @storage_data = File.file?(STORAGE) ? (YAML.load_file(STORAGE) || no_data) : no_data
  end

  def fetch_data(key)
    load_data unless defined? @storage_data
    @storage_data[key]
  end

  def fetch_item_by_name(value, compare_field, key)
    @storage_data[key].each do |item|
      return item if item.public_send(compare_field) == value
    end
    raise "Couldn't find #{key} with #{compare_field} == #{value}"
  end

  def write_data(data)
    File.open(STORAGE, 'w') { |f| f.write(data.to_yaml) }
  end
end
