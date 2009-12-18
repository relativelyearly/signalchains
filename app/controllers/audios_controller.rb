class AudiosController < ResourceController::Base
  belongs_to :chain

  actions :all, :except => [:index, :show, :create]

  update.before do
    if params[:audio][:mp3_file_size]
      params[:audio].merge!(:mp3_updated_at => DateTime.now)
    end

    if params[:audio][:ogg_file_size]
      params[:audio].merge!(:ogg_updated_at => DateTime.now)
    end
  end

  update.wants.xml do
    head :ok
  end
end