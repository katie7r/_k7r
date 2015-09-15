module TidbitsHelper

  # Puts together tidbits category options for form select
  def tidbit_category_options(selected = nil)
    options_for_select(tidbit_categories.map{ |category| [ category.titleize, category ] }, selected: selected)
  end


  # Gets category names, alphabetized
  def tidbit_categories
    Tidbit.categories.keys.sort
  end

  # Adds 'all' to list of tidbit categories
  def all_tidbit_categories
    tidbit_categories.unshift('all')
  end

  # Returns the path for the given category of tidbits
  def tidbits_path_for(category, published = true)
    if category == 'all'
      published ? tidbits_path : unpublished_tidbits_path
    else
      published ? categorized_tidbits_path(category) : unpublished_categorized_tidbits_path(category)
    end
  end
end
