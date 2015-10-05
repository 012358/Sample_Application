class Project < ActiveRecord::Base
  audited

  has_many :tasks, dependent: :destroy
  has_and_belongs_to_many :skills

  accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :tasks, :reject_if => :all_blank, :allow_destroy => true

  require 'elasticsearch/model'
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include Elasticsearch::Model::Indexing

  def as_indexed_json(options={})
    {
        id: id,
        name: name
    }
  end


  settings do
    mapping dynamic: true do
      [:name].each do |attr|
        indexes attr, type: 'string', index: :not_analyzed
      end
    end
  end

  # settings index: { number_of_shards: 1 } do
  #   mappings dynamic: 'false' do
  #     indexes :name, analyzer: 'english'
  #   end
  # end

  # def self.search(query)
  #   __elasticsearch__.search(
  #       {
  #           query: {
  #               multi_match: {
  #                   query: query,
  #                   fields: ['name']
  #               }
  #           }
  #       }
  #   )
  # end

end
