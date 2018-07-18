class Pagination
  attr_reader :curr_page
  attr_reader :items_per_page
  attr_reader :total_items

  def initialize(total_items:, items_per_page: 10, current_page: 1)
    @total_items = total_items.to_i
    @items_per_page = items_per_page.to_i
    @curr_page = current_page.to_i
  end

  def half_items_per_page
    (items_per_page / 2).round
  end

  def last_page
    [(total_items / items_per_page).round, 1].max
  end

  def next_page
    curr_page + 1
  end

  def page_range
    (page_range_lower..page_range_upper)
  end

  def page_range_lower
    [curr_page - [half_items_per_page, last_page].min, 1].max
  end

  def page_range_upper
    [last_page, curr_page + [half_items_per_page, last_page].min].min
  end

  def prev_page
    curr_page - 1
  end

  def to_h
    {
      page_range: page_range,
      curr_page: curr_page,
      prev_page: prev_page,
      next_page: next_page,
      last_page: last_page,
      result_count: result_count,
      total_items: total_items
    }
  end

  def result_count
    prev_page * items_per_page
  end
end
