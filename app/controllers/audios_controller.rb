class AudiosController < ResourceController::Base
  actions :all, :except => [:index, :show, :create]

  update.before do
    if params[:audio][:converted_file_size]
      params[:audio].merge!(:converted_updated_at => DateTime.now)
    end
  end

  update.wants.xml do
    head :ok
  end
end