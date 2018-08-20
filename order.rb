module Provider
  module Openshift
    class Order
      attr_accessor :guid, :user_id, :message, :state, :created_at, :ordered_at, :completed_at, :order_items

      def self.entities
        'service_instances'
      end

      def self.entity
        'service_instance'
      end

      def self.create(k8s, *args)
        inst = Kubeclient::Resource.new
        inst.metadata = {}
        inst.metadata.name = "dh-hastebin-apb-instance"
        inst.metadata.namespace = 'myproject'
        inst.spec = {}
        inst.spec.clusterServiceClassExternalName = "dh-hastebin-apb"
        inst.spec.clusterServicePlanExternalName = "default"
        inst.spec.parameters = {}
        inst.spec.parameters.HastebinPort = "7777"
        inst.spec.parameters.KeyLength = "10"
        inst.spec.parameters.MaxLength = "400000"
        inst.to_yaml
        #k8s.instance.create_service_instance(inst)
      end

      def initialize(entity)
        @entity = entity
        define_attributes
      end


      private

      def define_attributes
        #remove_instance_variable(:@entity)
        self
      end
    end
  end
end
