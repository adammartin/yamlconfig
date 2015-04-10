version = File.read(File.expand_path('../VERSION', __FILE__)).strip

Gem::Specification.new do |s|
  s.name          = 'yconfig'
  s.version       = version
  s.date          = '2015-04-10'
  s.summary       = "yconfig is a simple config loader for yaml based config files"
  s.description   = "Give yconfig your config file and have it parse you a hash!"
  s.authors       = ["Adam Martin"]
  s.email         = 'ebondark.od@gmail.com'
  s.require_paths = ['lib']
  s.files         = ["lib/yconfig.rb"]
  s.homepage      =
    'https://github.com/adammartin/yconfig'
  s.license       = 'MIT'
end