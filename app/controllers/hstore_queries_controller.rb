class HstoreQueriesController < ApplicationController

  def index
    key   = params[:key]
    value = params[:value]
    result = case params[:query_type].to_sym
    when :key_eql
      Product.where("data ? :key",                  :key => key)
    when :key_value_eql
      Product.where("data @> (:key => :value)",     :key => key, :value => value)
    when :key_not_value
      Product.where("not data @> (:key => :value)", :key => key, :value => value)
    when :key_like_value
      Product.where("data -> :key LIKE :value",     :key => key, :value => "%#{value}%")
    end
    respond_to do |format|
      format.js {render :json => result.to_json}
      format.html {redirect_to :back}
    end
  end

end
