#encoding: utf-8

class JsonWrapper
  VERSION = "0.1.0"

  # Internal value
  # @return [Hash, Array, String, Number, Nil] internal value
  attr_reader :value

  # Create a JsonWrapper
  # @param value [Hash, Array, String, Numeric, Nil] parse result from JSON.parse
  # @return [JsonWrapper] instance
  def initialize(value = nil)
    @value = value
  end

  # If value is a Hash
  # @return [True, False] if value is a Hash
  def hash?
    @value.kind_of? Hash
  end

  # If value is a Array
  # @return [True, False] if value is an Array
  def array?
    @value.kind_of? Array
  end

  # If value is String
  # @return [True,False] if value is a String
  def string?
    @value.kind_of? String
  end

  # If value is a Number
  # @return [True,False] if value is an Number
  def number?
    @value.kind_of? Numeric
  end

  # If value is a Nil
  # @return [True, False] if value is a Nil
  def null?
    @value.nil?
  end

  # Get the value if is a Hash
  # @return [Hash, nil] value if it's a Hash
  def hash
    @value if hash?
  end

  # Get the value if is a Array
  # @return [Array, Nil] value if it's a Array
  def array
    @value if array?
  end

  # Get the value if value is string
  # @return [String, Nil] value if it's a String
  def string
    @value if string?
  end

  # Get the value if value is a number
  # @return [Fixnum, Float, Nil] value if it's a Numeric, typically Fixnum or Float
  def number
    @value if number?
  end

  # Force convert to Hash
  # @return [Hash] Hash format of value, {} if not capable
  def hash!
    hash || {}
  end

  # Force convert to Array
  # @return [Array] Array format of value, {} if not capable
  def array!
    array || []
  end

  # Force convert to String
  # @return [String] String format of value, "" if not capable
  def string!
    return @value if string?
    return @value.to_s if number?
    ""
  end

  # Force convert to number
  # @return [Numeric] Number format of value, 0 if not capable
  def number!
    return @value if number?
    return @value.to_f if string?
    0
  end

  # Force convert to Float
  # @return [Float] Float format of value
  def float!
    number!.to_f
  end

  # Force convert to Fixnum
  # @return [Fixnum] Fixnum format of value
  def fixnum!
    number!.to_i
  end

  # Try to get value from Hash or Array
  # @param key [String, Symbol, Fixnum] key
  # @return [JsonWrapper] JsonWrapper of the value
  def get(key)
    return JsonWrapper.new(@value[key])       if array? and key.kind_of?(Fixnum)
    return JsonWrapper.new(@value[key])       if hash? and key.kind_of?(String)
    return JsonWrapper.new(@value[key.to_s])  if hash? and key.kind_of?(Symbol)
    JsonWrapper.new
  end

  # @see #get
  def [](key)
    get(key)
  end

  # @see #get
  def method_missing(*args)
    get args.first
  end

end
