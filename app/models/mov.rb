class Mov < ApplicationRecord
    
    has_many :bookings,
    dependent: :destroy
    has_one_attached:image
   

    def search_data
      {
        moviename: moviename,
        cast:cast
      
      }
    end
    searchkick word_start: [:moviename]
    

    # def self.search(search)
    #     if search
    #         where (["moviename LIKE ?","%#{search}%"])
    #     else 
    #         all
    #     end
    # end
end
