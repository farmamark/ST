module Accessors
  def attr_accessor_with_history(*names)
   names.each do |name|
      var_name = "@#{name}"
      history = "@#{name}_history"
      define_method(name) { instance_variable_get(var_name)}
      define_method("#{name}_history".to_sym) {instance_variable_get(history)}
      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(history, []) if instance_variable_get(history).nil?
        instance_variable_get(history) << instance_variable_get(var_name)
        instance_variable_set(var_name, value)
      end
    end
  end


    def strong_attr_accessor(atribut, klass)
      var_atribut = "@#{atribut}"
      define_method(atribut) {instance_variable_get(var_atribut)}
      define_method("#{atribut}=".to_sym) do |value|
        raise "Other Class" unless value.is_a?(klass)
        instance_variable_set(var_atribut, value)
      end
    end
end
