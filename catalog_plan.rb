module Provider
  module Openshift
    class CatalogPlan
      attr_accessor :plan_id, :catalog_id, :name, :description, :cost, :provider_id, :plan_parameters

      def self.entities
        'cluster_service_plans'
      end

      def self.entity
        'cluster_service_plan'
      end

      def initialize(entity)
        @entity = entity
        @plan_parameters = []
        define_attributes
        plan_parameters
      end

      def plan_parameters
        properties = @entity.spec.to_h[:instanceCreateParameterSchema][:properties]
        properties.each_pair do |k, v|
          @plan_parameters << PlanParameter.new(k, v)
        end
        remove_instance_variable(:@entity)
      end

      private

      def define_attributes
        self.provider_id = "placeholder_#{Time.now.to_i}"
        self.catalog_id = @entity.spec['clusterServiceClassRef']['name']
        self.plan_id = @entity.metadata['name']
        self.name = @entity.spec['externalName']
        self.description = @entity.spec['description']
        self.cost = @entity.spec['externalMetadata']['cost']

        self
      end
    end
  end
end
