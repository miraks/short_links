class ShortLinksController < ApplicationController
  def show
    link = ShortLink.find params[:id]
    return render 'shared/404', status: 404 unless link
    redirect_to link.value
  end

  def create
    link = ShortLink.new
    link.link = params[:value]
    render json: { link: short_link_url(link.id) }
  end
end
