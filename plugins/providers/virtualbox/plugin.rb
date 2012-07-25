require "vagrant"

module VagrantPlugins
  module ProviderVirtualBox
    class Plugin < Vagrant.plugin("1")
      name "VirtualBox provider"
      description <<-EOF
      The VirtualBox provider allows Vagrant to manage and control
      VirtualBox-based virtual machines.
      EOF

      provider("virtualbox") do
        require File.expand_path("../provider", __FILE__)
        Provider
      end
    end

    # Drop some autoloads in here to optimize the performance of loading
    # our drivers only when they are needed.
    module Driver
      autoload :Meta, File.expand_path("../driver/meta", __FILE__)
      autoload :Version_4_0, File.expand_path("../driver/version_4_0", __FILE__)
      autoload :Version_4_1, File.expand_path("../driver/version_4_1", __FILE__)
    end
  end
end
