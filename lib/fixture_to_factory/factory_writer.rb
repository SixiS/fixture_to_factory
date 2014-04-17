module FixtureToFactory
  class FactoryWriter
    def self.write_files(folder, file_hashes)
      file_hashes.each do |fixture_path, fixtures|
        write_fixtures_to_file(folder, fixture_path, fixtures)
      end
    end

    private

    class << self
      def write_fixtures_to_file(folder, fixture_path, fixtures)
        fixture_file_name = fixture_path.split('/').last.split('.')[0..-2].join('.')
        class_name = ActiveSupport::Inflector.singularize(fixture_file_name).capitalize
        factory_file_name = "generated_#{fixture_file_name}.rb"

        FileUtils.mkdir_p(folder)
        file = File.new("#{folder}/#{factory_file_name}", 'w')
        file.write(convert_yaml_hashes_to_factory_file(class_name, fixtures))
      end

      def convert_yaml_hashes_to_factory_file(class_name, fixture_yaml_hash)
        output = "FactoryGirl.define do\n"
        fixture_yaml_hash.each do |fixture, values|
          output += "\n  factory :#{fixture}, class: #{class_name}\n"
          values.each do |key, value|
            output += "    #{attribute_to_factory_line(key, value)}\n"
          end
          output += "  end\n"
        end
        output += "\nend"
      end

      def attribute_to_factory_line(key, value)
        result = ''
        if key != 'id'
          result = "#{key} { "
          result += value_in_factory_format(value)
          result += " }"
        end
        result
      end

      def value_in_factory_format(value)
        value_class = value.class
        case value_class.to_s
          when 'TrueClass'
            true
          when 'FalseClass'
            false
          when 'String'
            "%|#{value.gsub('|', '\|')}|"
          else
            "#{value}"
        end
      end
    end
  end
end
