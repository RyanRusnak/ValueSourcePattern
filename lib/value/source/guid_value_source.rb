# encoding: UTF-8

module Value
  module Source

    class GuidValueSource < BaseValueSource
      register :guid

      attr_reader :value

      # initialize the static value from config, etc.
      def initialize(data)
        @value = data
      end

      def value(value)
        @value = value
      end

      def process
        # custom vs code goes here
        puts params
        
        
        @value
      end

    end
  end
end

# FOUR value sources
  #1 Populate drop down values
      #Give me the sction id and the column numbers
      #returns the values in those column numbers concatenated together
      
  #2 Save guid instead of drop down values
      #Maybe saves a json hash {value: "a", guid: "AKHSCKAHS"} OR {columns: [01,04], guid: "AKHSCKAHS"} 
  
  #3 Get drop down values by GUID
      #Maybe just renders the value key of the hash?       DataRow.find_by_GUID {:select => col1...}
  
  #4 Validate the values in the grid
    #On page load give me the section id and column numbers
    #returns false if populated value is not present and alerts user somehow