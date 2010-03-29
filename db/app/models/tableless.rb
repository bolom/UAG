class Tableless < ActiveRecord::Base
  self.keep_translations_in_model = false
  def self.columns () @columns ||= []; end
  
  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, 
              sql_type.to_s, null)
  end
  
  def save(validate = true)
    validate ? valid? : true 
  end
end
