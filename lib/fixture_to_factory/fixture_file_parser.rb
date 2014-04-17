require 'yaml'

module FixtureToFactory
  class FixtureFileParser
    def self.parse_files(folder)
      file_names = get_file_names_in(folder)
      file_names = file_names.select{|file_name| file_name =~ /(\w+).yml/ }
      file_paths = file_names.map{|file_name| "#{folder}/#{file_name}"}

      map_fixtures_to_hash(file_paths)
    end

    private

    class << self
      def get_file_names_in(folder)
        file_names = []
        if Dir.exists?(folder)
          Dir.foreach(folder) do |file_name|
            file_names << file_name
          end
        end
        file_names
      end

      def map_fixtures_to_hash(file_paths)
        result = {}
        file_paths.each do |file_path|
          fixtures_to_yaml = YAML.load_file(file_path)
          result[file_path] = fixtures_to_yaml
        end
        result
      end
    end
  end
end
