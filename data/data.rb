require 'active_support/core_ext/hash/indifferent_access'
require "yaml"

def load_data
    [
        YAML::load(File.open('data/ice.yaml')).with_indifferent_access,
        YAML::load(File.open('data/breakers.yaml')).with_indifferent_access
    ]
end