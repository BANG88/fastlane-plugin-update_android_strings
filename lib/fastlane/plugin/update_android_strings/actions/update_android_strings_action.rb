module Fastlane
  module Actions
    class UpdateAndroidStringsAction < Action
      def self.run(params)
        UI.message("The update_android_strings plugin is working!")
      end

      def self.description
        "Update Android res strings.xml"
      end

      def self.authors
        ["bang"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "This plugin help you update strings.xml"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "UPDATE_ANDROID_STRINGS_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Platforms.md
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
