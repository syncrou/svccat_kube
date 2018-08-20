module Provider
  module Openshift
    class CatalogItem
      attr_accessor :catalog_id, :name, :description, :image_url, :provider_id

      def self.entities
        'cluster_service_classes'
      end

      def self.entity
        'cluster_service_class'
      end

      def initialize(entity)
        @entity = entity
        define_attributes
      end

      def catalog_plans
        require 'byebug'; byebug
        @entity
      end

      private

      def define_attributes
        self.provider_id = "placeholder_#{Time.now.to_i}"
        self.catalog_id = @entity.metadata['name']
        self.name = @entity.spec['externalName']
        self.description = @entity.spec['description']
        self.image_url = "http://placeholder.com"

        remove_instance_variable(:@entity)
        self
      end
    end
  end
end
