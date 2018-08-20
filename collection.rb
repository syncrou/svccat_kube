module Provider
  module Openshift
    class Collection
      attr_reader :k8s, :klass

      def initialize(k8s, klass = nil)
        @k8s = k8s
        @klass = klass
      end

      def create(*args)
        klass.create(k8s, *args)
      end

      def find(id)
        item_by_entity(klass.entity, id)
      end

      def all
        items_by_entity(klass.entities)
      end

      def item_by_entity(entity, id)
        method_name = "get_#{entity}"
        klass.new(k8s.instance.send(method_name, id))
      end

      def items_by_entity(entity)
        method_name = "get_#{entity}"
        array_resource_to_klass_translation do
          k8s.instance.send(method_name)
        end
      end

      def array_resource_to_klass_translation
        Array.new.tap do |it|
          yield.each do |item|
              it << klass.new(item)
          end
        end
      end
    end
  end
end
