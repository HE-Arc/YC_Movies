module ActiveRecord
  module Tasks
    class PostgreSQLDatabaseTasks
      def drop
        establish_connection configuration
        conn = ActiveRecord::Base.connection

        username = configuration['username']
        schema_search_path = configuration
          .fetch('schema_search_path') { username }
          .split(',')[0]
        q = %{
          SELECT tablename
          FROM pg_tables
          WHERE schemaname=$1 AND tableowner=$2;
        }
        res = conn.raw_connection.exec_params(q, [schema_search_path, username])

        tables = res.map { |t| t['tablename'] }

        tables
          .each { |t| conn.execute("TRUNCATE #{t}") }
          .each { |t| conn.execute("DROP TABLE #{t}") }
      end

      def create(master_established = false)
        # do nothing :-)
      end
    end
  end
end