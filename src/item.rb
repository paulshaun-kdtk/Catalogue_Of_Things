class Items
  attr_accessor :genre, :author, :source, :label

  # removed archived: true as it was not used in the function
  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = true
  end

  private

  def can_be_archived?
    nil unless @publish_date > 10
  end

  public

  def move_to_archive
    can_be_archived?
  end
end

#SUGGESTION consider moving item file into classes folder
