require 'yaml'

class YConfig
  def initialize root_dir
    self.root_dir = root_dir
  end

  def parse(filename)
    hash = {}

    hash.merge! hash_from default_file(filename)
    hash.merge! hash_from filename
    hash["base_working_dir"] = root_dir unless hash.empty?
    hash
  end

  private
  attr_accessor :root_dir

  def hash_from filename
    full_file_name = File.join root_dir, filename

    return {} unless File.exist? full_file_name
    yaml = YAML.parse File.read(full_file_name)
    return yaml.to_ruby if yaml.respond_to? :to_ruby
    {}
  end

  def default_file filename
    ext = File.extname filename
    base = File.basename filename, ext
    "#{base}_default#{ext}"
  end
end
