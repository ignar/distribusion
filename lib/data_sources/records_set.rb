module DataSources
  class RecordsSet
    include Enumerable

    def initialize(collection = [])
      @collection = collection
      if block_given?
        yield(self)
      end
    end

    def empty?
      @collection.empty?
    end

    def each(&block)
      collection.each(&block)
    end

    def add(params)
      collection << Record.new(params)
    end

    private

    attr_reader :collection
  end
end
