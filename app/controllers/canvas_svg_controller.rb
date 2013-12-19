class CanvasSvgsController < ApplicationController
  # after_filter :set_context_type

  # def set_context_type
  #   headers['Context-Type'] = 'image/svg+xml'
  # end

  def show
    @canvas = Canvas.find(params[:id])
    respond_to do |f|
      f.svg {render svg: @canvas, :content_type => 'image/svg+xml'}
    end
  end


end