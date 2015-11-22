RSpec.configure do |config|
  config.after(:each) do
    FileUtils.rm_rf(Dir["#{Rails.root}/public/uploads/test", "#{Rails.root}/public/uploads/tmp"])
  end
end

CarrierWave.configure do |config|
  config.storage = :file
  config.enable_processing = false
end

module CarrierWaveDirect
  module Test
    module CapybaraHelpers
      def attach_file_for_direct_upload(path)
        attach_file("File", path)
      end
    end
  end
end
include CarrierWaveDirect::Test::CapybaraHelpers

