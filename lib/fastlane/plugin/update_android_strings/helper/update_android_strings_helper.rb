
module Fastlane
  module Helper
    class UpdateAndroidStringsHelper
      # class methods that you define here become available in your action
      # as `Helper::UpdateAndroidStringsHelper.your_method`
      #
			def self.updateXml(nodes, hashes = {})
				if hashes and nodes
					# find key and update text with new value
          nodes.each do |element|
            if element.respond_to? :name and hashes.has_key?(element["name"])
							element.replace_text(hashes.fetch(element["name"]))
            end
					end
				end

      end
    end
  end
end
