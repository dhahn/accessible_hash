if RUBY_VERSION < "2.0"
  require "accessible_hash/make_accessible.rb"
else
  require "accessible_hash/refine.rb"
end

module AccessibleHash
end