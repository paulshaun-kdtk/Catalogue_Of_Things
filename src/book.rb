class Book < Items
  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    parent_archive = Items.new
    false unless @cover_state == 'bad' || parent_archive.move_to_archive == true
  end
end
