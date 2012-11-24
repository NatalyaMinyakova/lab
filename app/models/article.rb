class Article < ActiveRecord::Base
  attr_accessible :text, :title, :state_event

  validates :title, :presence => true,
	            :length => { :minimum => 5 }

  state_machine :state, initial: :unpublished do
    state :published
    state :unpubslished
    state :deleted

    event :publish do
      transition :unpublished => :published
    end

    event :unpublish do
      transition :published => :unpublished
    end

    event :del do
      transition [:unpublished, :published] => :deleted
    end
  end
end
