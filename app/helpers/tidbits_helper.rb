module TidbitsHelper

  def tidbit_category_options(selected = nil)
    options_for_select(Tidbit.categories.map{ |name, value| [ name.titleize, value ] }, selected: selected)
  end
end
