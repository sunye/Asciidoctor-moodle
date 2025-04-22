begin
  require_relative 'lib/asciidoctor-moodle/version'
rescue LoadError
  require 'asciidoctor-moodle/version'
end

Gem::Specification.new do |s|
  s.name = 'asciidoctor-moodle'
  s.version = Asciidoctor::Moodle::VERSION
  s.summary = 'Converts AsciiDoc documents to Moodle XML'
  s.description = 'An Asciidoctor converter that converts AsciiDoc to Moodle XML documents'
  s.authors = ['Gerson Sunyé']
  s.email = 'gerson.sunye@gmail.com'
  s.homepage = 'https://github.com/'
  s.license = 'MIT'
  s.required_ruby_version = '>= 3.0.0'
  s.metadata = {
    'bug_tracker_uri' => 'https://github.com/asciidoctor/asciidoctor-docbook45/issues',
    'changelog_uri' => 'https://github.com/asciidoctor/asciidoctor-docbook45/blob/master/CHANGELOG.adoc',
    'mailing_list_uri' => 'http://discuss.asciidoctor.org',
    'source_code_uri' => 'https://github.com/asciidoctor/asciidoctor-docbook45'
  }

  # NOTE the logic to build the list of files is designed to produce a usable package even when the git command is not available
  begin
    files = (result = `git ls-files -z`.split ?\0).empty? ? Dir['**/*'] : result
  rescue
    files = Dir['**/*']
  end
  s.files = files.grep %r/^(?:lib\/.+|LICENSE|(?:CHANGELOG|README)\.adoc|\.yardopts|#{s.name}\.gemspec)$/
  s.require_paths = ['lib']

  s.add_runtime_dependency 'asciidoctor', '>= 2.0.0'
  s.add_development_dependency 'rake', '~> 12.3.0'
  s.add_development_dependency 'rspec', '~> 3.8.0'
end
