module TidbitsHelper

  # Puts together tidbits category options for form select
  def tidbit_category_options(selected = nil)
    options_for_select(Tidbit.categories.map{ |name, value| [ name.titleize, value ] }, selected: selected)
  end

  # Generates list-group-item for given tidbits category (for menu on tidbits pages)
  def tidbit_category_list_item(category, currently, tidbits_count)
    link_text   = "View #{category.titleize} Tidbits"
    # link_text  += "<span class='badge badge-primary'>#{tidbits_count}</span>"
    link_path   = category == 'all' ? tidbits_path : category_tidbits_path(category)
    html_class  = 'list-group-item'
    html_class += ' active' if currently == category
    return link_to link_text, link_path, class: html_class
  end
end
