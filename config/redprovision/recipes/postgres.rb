class Postgres
  include Redprovision::Recipe

  apt :postgresql
  apt 'postgresql-server-dev-8.4'
  template('postgresql.conf.erb' => '/etc/postgresql/8.4/main/postgresql.conf')
  file('pg_hba.conf' => '/etc/postgresql/8.4/main/pg_hba.conf')

  run '/etc/init.d/postgresql-8.4 restart', :user => 'postgres'

  run "psql -c \"CREATE ROLE deploy WITH LOGIN ENCRYPTED PASSWORD '\#{password}';\"", :user => 'postgres'
  run "createdb -O deploy -T template0 -E UTF8 signalchains_production", :user => 'postgres'

  run '/etc/init.d/postgresql-8.4 restart', :user => 'postgres'
end