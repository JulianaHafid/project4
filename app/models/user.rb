class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    #  has_many :reviews
    #  has_many :reviewers, class_name: 'Review', foreign_key:'reviewer_id'
    #  has_many :reviewee, class_name: 'Review', foreign_key:'reviewee_id'
    #  has_many :reviewers, through: :reviewers, source: :reviewer
    #  has_many :reviewees, through: :reviewee, source: :reviewee

     has_one :profile

    #  has_many :services
     has_many :seeker, class_name: 'Service', foreign_key:'seeker_id'
     has_many :helper, class_name: 'Service', foreign_key:'helper_id'
     has_many :seekers, through: :seeker, source: :seeker
     has_many :helpers, through: :helper, source: :helper


      #   has_many :events
      #  has_many :requests, class_name: 'Request', foreign_key:'requestor_id'
      #  has_many :standin, class_name: 'Request', foreign_key:'standin_id'
      #  has_many :requestors, through: :requests, source: :requestor
      #  has_many :standins, through: :standin, source: :standin

end
