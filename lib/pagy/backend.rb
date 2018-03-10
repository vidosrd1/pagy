class Pagy

  module Backend ; private         # the whole module is private so no problem with including it in a controller

    def pagy(obj, vars={})
      pagy = Pagy.new(count: pagy_get_count(obj), page: pagy_get_page, i18n_key: pagy_get_i18n_key(obj), **vars)
      return pagy, pagy_get_items(obj, pagy)
    end

    def pagy_get_count(obj)
      obj.count
    end

    def pagy_get_page
      params[:page]
    end

    def pagy_get_i18n_key(obj) end

    # this should work with ActiveRecord, Sequel, Mongoid...
    # override it if obj does not implement it that way
    def pagy_get_items(obj, pagy)
      obj.offset(pagy.offset).limit(pagy.items)
    end

  end
end
