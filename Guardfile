guard :minitest do
  watch(%r{^spec/(.*)_spec\.rb})
  watch(%r{^lib/(.*)([^/]+)\.rb})  { |m| "spec/lis_spec.rb" }
  watch(%r{^spec/spec_helper\.rb}) { 'spec' }
end
