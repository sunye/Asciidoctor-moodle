# frozen_string_literal: true

#require 'asciidoctor-moodle'
require_relative '../lib/asciidoctor-moodle'

Asciidoctor.convert_file 'test/test.adoc', {:safe => :safe, :backend => 'moodle'}
