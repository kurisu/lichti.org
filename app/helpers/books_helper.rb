module BooksHelper

  def amazon_url_for(book)
    "http://www.amazon.com/gp/search/ref=sr_adv_b/?search-alias=stripbooks&unfiltered=1&field-keywords=&field-author=#{book.author}&field-title=#{book.title}&field-isbn=#{book.isbn}&field-publisher=&node=&field-p_n_condition-type=&field-feature_browse-bin=&field-subject=&field-language=&field-dateop=During&field-datemod=&field-dateyear=&sort=relevanceexprank&Adv-Srch-Books-Submit.x=0&Adv-Srch-Books-Submit.y=0"
  end
end
