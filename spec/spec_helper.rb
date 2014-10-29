require 'chefspec'
require 'chefspec/berkshelf'

SafeYAML::OPTIONS[:deserialize_symbols] = true
SafeYAML::OPTIONS[:default_mode] = 'unsafe'
