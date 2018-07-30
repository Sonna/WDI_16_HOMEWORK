class Entity
  attr_reader :attributes

  def initialize(attributes = {})
    @attributes = attributes.transform_keys(&:to_sym)
  end

  def ==(other)
    self.class == other.class &&
      id == other.id
  end

  def [](method_name)
    send(method_name)
  end

  def id
    attributes.fetch(:id, nil)
  end

  def method_missing(method_name, *)
    attributes.fetch(method_name, nil)
  end

  alias to_h attributes
  alias to_hash to_h
end
