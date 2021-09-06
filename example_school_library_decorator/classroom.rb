class Classroom
    attr_accessor :label
    has_many :students

    def initialize(label)
        @label = label
    end
end