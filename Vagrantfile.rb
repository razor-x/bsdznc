Vagrant.configure('2') do |config|
  if Vagrant.has_plugin?('vagrant-cachier')
    # Synced folders are required by vagrant-cachier,
    # but do not work on FreeBSD.
    config.cache.disable!
  end
end
