if defined?(ChefSpec)
  def configure_znc(name)
    ChefSpec::Matchers::ResourceMatcher.new(:bsdznc, :create, name)
  end
end
