require 'bundler'
Bundler.require

ENV['SINATRA_ENV'] ||= "development"

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/development.sqlite"
)
# ActiveRecord::Base.connection.tables.each do |table|
#   ActiveRecord::Base.connection.execute("DELETE FROM #{table}") unless table == "schema_migrations"
# end
#
# ActiveRecord::Base.connection.execute('DELETE FROM users;')
# ActiveRecord::Base.connection.execute('DELETE FROM sqlite_sequence WHERE NAME="users";')
# ActiveRecord::Base.connection.execute('DELETE FROM routines;')
# ActiveRecord::Base.connection.execute('DELETE FROM sqlite_sequence WHERE NAME="routines";')
# ActiveRecord::Base.connection.execute('DELETE FROM products;')
# ActiveRecord::Base.connection.execute('DELETE FROM sqlite_sequence WHERE NAME="products";')
# ActiveRecord::Base.connection.execute('DELETE FROM routine_products;')
# ActiveRecord::Base.connection.execute('DELETE FROM sqlite_sequence WHERE NAME="routine_products";')

require_all 'app'
