module Spice
  class Search < Spice::Chef
    INDEXES = %w(node role client users)
    
    INDEXES.each do |index|
      define_method index do |options|
        options ||= {}
        options.symbolize_keys!
        
        type = index
        query = options[:q] || '*:*'
        sort = options[:sort] || "X_CHEF_id_CHEF_X asc"
        start = options[:start] || 0
        rows = options[:rows] || 1000
        
        connection.get("/search/#{index}?q=#{escape(query)}&sort=#{escape(sort)}&start=#{escape(start)}&rows=#{escape(rows)}")
      end
    end
  end
end