class Items
  attr_accessor :genre, :author, :source, :label

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    # @archived = true
  end

  private

  def can_be_archived?
    @publish_date > 10
  end

  public

  def move_to_archive
    can_be_archived?
  end
end
