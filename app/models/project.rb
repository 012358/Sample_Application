class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
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

end
