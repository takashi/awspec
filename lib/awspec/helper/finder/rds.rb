module Awspec::Helper
  module Finder
    module Rds
      def find_rds(id)
        # db_instance_identifier
        res = @rds_client.describe_db_instances({
                                                  db_instance_identifier: id
                                                })
        return res[:db_instances][0] if res[:db_instances].count == 1
      end

      def select_rds_by_vpc_id(vpc_id)
        res = @rds_client.describe_db_instances
        db_instances = res[:db_instances].select do |db_instance|
          db_instance.db_subnet_group.vpc_id == vpc_id
        end
        db_instances
      end
    end
  end
end
