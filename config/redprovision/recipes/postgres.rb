class Postgres
  include Redprovision::Recipe

  apt :postgresql
  apt 'postgresql-server-dev-8.4'
  file('postgresql.conf' => '/etc/postgresql/8.4/main/postgresql.conf')
  file('pg_hba.conf' => '/etc/postgresql/8.4/main/pg_hba.conf')

  run 'sudo -u postgres /etc/init.d/postgresql-8.4 restart'

  run "sudo -u postgres psql -c \"CREATE ROLE deploy WITH LOGIN ENCRYPTED PASSWORD '705YR8jptajUcOb2KQnl';\""
  run "sudo -u postgres createdb -O deploy -T template0 -E UTF8 signalchains_production"

  run 'sudo -u postgres /etc/init.d/postgresql-8.4 restart'
end