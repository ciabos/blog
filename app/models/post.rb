class Post < ActiveRecord::Base
  searchkick word_middle: [:title]
  has_many :comments, dependent: :destroy
  belongs_to :category
  acts_as_taggable
  validates :title, presence: true,
                      length: { minimum: 5 }
  validates :body, presence: true, 
                      length: { minimum: 50 }
  validates :category_id, presence: true

  def self.mysearch(title, category_id = nil, tags = nil, page, per_page)
    params = {
      where: {},
      operator: 'or',
      misspellings: {distance: 2},
      fields: [{title: :word_middle}],
      page: page,
      per_page: per_page
    }
    params[:where][:category_id] = category_id if category_id.present?
    params[:where][:tags] = tags if tags && tags.any?
    Post.search(title, params)

  end

  def search_data
    {
      title: self.title,
      category_id: self.category_id,
      tags: self.tags.pluck(:name)

    }
  end

end
