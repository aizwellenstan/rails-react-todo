class Historicaldata::Filter
    def self.call(resources, options)
      new(historicaldata, options).filter
    end
  
    private
  
    attr_reader :resources, :options
  
    def initialize(resources, options)
      @resources = resources
      @options   = options
    end
  
    def filter
      if options[:time_start]
        @resources = resources.where('timestamp > :time_start',{:time_start => time_start })
      end
  
      if options[:time_end]
        @resources = resources.where('timestamp < :time_end',{:time_end => time_end })
      end
  
      resources
    end
end