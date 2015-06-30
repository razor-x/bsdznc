if defined?(ChefSpec)
  def install_znc(name)
    ChefSpec::Matchers::ResourceMatcher.new(:bsdznc, :create, name)
  end

  def start_znc(name)
    ChefSpec::Matchers::ResourceMatcher.new(:bsdznc, :start, name)
  end

  def stop_znc(name)
    ChefSpec::Matchers::ResourceMatcher.new(:bsdznc, :stop, name)
  end

  def restart_znc(name)
    ChefSpec::Matchers::ResourceMatcher.new(:bsdznc, :restart, name)
  end

  def remove_znc(name)
    ChefSpec::Matchers::ResourceMatcher.new(:bsdznc, :destroy, name)
  end
end
