# require 'active_support'
require 'active_support/core_ext/array/extract_options.rb'

class Product
  attr_reader :content
  @@all = []

  def self.all
    @@all
  end

  def valid?(new_content)
    Product.all.each do |existing_product|
      puts existing_product
      puts "DuplicateProductError: #{new_content[:name]} already exists." if existing_product.content[:name] == new_content[:name]
    end
    true
  end

  def initialize(*args)
    # Create a Hash from all args provided
    @content = args.extract_options! if valid?(args.extract_options!)
    @@all << self
  end
end
