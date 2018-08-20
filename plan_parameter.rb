module Provider
  module Openshift
    class PlanParameter
      attr_accessor :type, :title, :name, :description, :default, :value, :pattern, :example, :required, :enum

      def initialize(key, value)
        define_attributes(key, value)
      end

      private

      def define_attributes(key, value)
        self.type = value[:type]
        self.title = value[:title]
        self.name = key
        self.description = 'description'
        self.default = value[:default]
        self.enum = value[:enum]
        self.value = ""
        self.pattern = ""
        self.example = ""
        self.required = false
      end
    end
  end
end
