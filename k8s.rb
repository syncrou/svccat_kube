module Provider
  module Openshift
    class K8s < Connection
      attr_reader :instance

      def initialize(connection)
        @instance = connection
      end

      def catalog_items
        Collection.new(self, catalog_item_class)
      end

      def catalog_plans
        Collection.new(self, catalog_plan_class)
      end

      def orders
        Collection.new(self, order_class)
      end

      def order_class
        @order_item ||= Provider::Openshift::Order
      end

      def catalog_item_class
        @catalog_item ||= Provider::Openshift::CatalogItem
      end

      def catalog_plan_class
        @catalog_plan ||= Provider::Openshift::CatalogPlan
      end
    end
  end
end
