class ShortLink
  include Redis::Objects

  value :link

  def initialize id = nil
    @id = id
  end

  def self.find id
    link = ShortLink.new id
    link.value ? link : nil
  end

  def id
    @id ||= SecureRandom.hex 4
  end

  def == other
    self.class == other.class and id == other.id
  end

  delegate :value, to: :link
end
