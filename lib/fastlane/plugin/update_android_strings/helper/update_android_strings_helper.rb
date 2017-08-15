module Fastlane
  module Helper
    class UpdateAndroidStringsHelper
      # class methods that you define here become available in your action
      # as `Helper::UpdateAndroidStringsHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the update_android_strings plugin helper!")
      end
    end
  end
end
