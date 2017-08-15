module Fastlane
  module Actions
    class UpdateAndroidStringsAction < Action
      def self.run(params)
        require 'ox'

        if params[:block]
          if params[:xml_path]
            xmlPath = params[:xml_path]
          else
            xmlPath = "android/app/src/main/res/values/strings.xml"
          end
          unless File.exist?(xmlPath)
            UI.user_error!("The xml file at path `#{xmlPath}` doesn't exist.")
          end
          f = File.open(xmlPath, "r")
          xml = f.read
          f.close

          strings = Ox.parse(xml)

          unless strings
            UI.error("xml is Empty!")
            return
          end
          # find key and update text with new value
          strings.nodes.each do |element|
            if element.respond_to? :name and element["name"] == "reactNativeCodePush_androidDeploymentKey"
              element.replace_text("hello")
            end
          end
					if params[:block]
						hashes = {}
            params[:block].call(hashes)

            Helper::UpdateAndroidStringsHelper.updateXml(strings.nodes, hashes)

            # dump new xml file
            newXml = Ox.dump(strings)
            if xml != newXml
              File.write(xmlPath, newXml)
              UI.success("Update xml file success.")
            else
              UI.message("Nothing has changed.")
            end
          end

        else
          UI.important("You haven't specified block parameter to update your xml file")
          false
        end
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
          FastlaneCore::ConfigItem.new(key: :xml_path,
        env_name: "UPDATE_ANDROID_STRINGS_XML_PATH",
        description: "Path to strings.xml",
        optional: true),
          FastlaneCore::ConfigItem.new(key: :block,
                               description: "A block to process strings.xml with custom logic",
                                  optional: false,
                                  is_string: false)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Platforms.md
        #
        # [:ios, :mac, :android].include?(platform)
        [:android].include?(platform)
        true
      end
    end
  end
end
