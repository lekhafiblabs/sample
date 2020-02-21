class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        home_index_path(current_user.id) 
    end
    def autocomplete
        render json: Mov.search(params[:query], {
          fields: ["moviename^5"],
          match: :word_start,
          limit: 10,
          load: false,
          misspellings: {below: 5}
        }).map(&:moviename)
      
      end
    
    
end
